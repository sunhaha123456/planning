package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.StringUtil;
import com.rose.common.util.ValueHolder;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbFlowInstanceNode;
import com.rose.data.entity.TbFlowInstanceOperateHistory;
import com.rose.data.entity.TbSysUser;
import com.rose.data.enums.FlowInstanceStateEnum;
import com.rose.data.to.request.FlowInstanceRequest;
import com.rose.data.to.response.FlowChartResponse;
import com.rose.repository.*;
import com.rose.service.FlowInstanceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class FlowInstanceServiceImpl implements FlowInstanceService {

    @Inject
    private FlowInstanceRepository flowInstanceRepository;
    @Inject
    private FlowInstanceRepositoryCustom flowInstanceRepositoryCustom;
    @Inject
    private FlowInstanceNodeRepository flowInstanceNodeRepository;
    @Inject
    private FlowInstanceNodeUserTaskRepository flowInstanceNodeUserTaskRepository;
    @Inject
    private FlowInstanceOperateHistoryRepository flowInstanceOperateHistoryRepository;
    @Inject
    private FlowInstanceOperateHistoryRepositoryCustom flowInstanceOperateHistoryRepositoryCustom;
    @Inject
    private SysUserRepository sysUserRepository;
    @Inject
    private ValueHolder valueHolder;

    @Override
    public PageList<TbFlowInstance> searchFlowInstance(FlowInstanceRequest param) throws Exception {
        return flowInstanceRepositoryCustom.list(param.getTemplateId(), param.getFlowInstanceName(), param.getPage(), param.getRows());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void operateInstance(Long id, Integer type) {
        TbFlowInstance flowInstance = flowInstanceRepository.findOne(id);
        if (flowInstance == null) {
            throw new BusinessException("流程实例不存在！");
        }
        if (flowInstance.getState() == FlowInstanceStateEnum.HAVE_FINISH.getIndex()) {
            throw new BusinessException("不能对已完成的用户流程操作！");
        }

        StringBuilder operateInfo = new StringBuilder();
        TbSysUser user = sysUserRepository.findOne(valueHolder.getUserIdHolder());

        if (type == 0) { // 管理员冻结流程
            if (flowInstance.getState() == FlowInstanceStateEnum.ADMIN_FROZEN.getIndex()) {
                throw new BusinessException("用户流程状态原先已是冻结！");
            }

            int c = flowInstanceRepository.updateState(id, FlowInstanceStateEnum.ADMIN_FROZEN.getIndex(), flowInstance.getState());
            if (c <= 0) {
                throw new BusinessException(ResponseResultCode.OPERT_ERROR);
            }

            operateInfo.append("管理员").append(user.getLoginName()).append("将").append(flowInstance.getInstanceName()).append("冻结");
        } else if (type == 1) { // 管理员恢复流程
            if (flowInstance.getState() != FlowInstanceStateEnum.ADMIN_FROZEN.getIndex()) {
                throw new BusinessException("用户流程状态不是已是冻结！");
            }

            int c = flowInstanceRepository.updateState(id, FlowInstanceStateEnum.HAVE_STARTED.getIndex(), FlowInstanceStateEnum.ADMIN_FROZEN.getIndex());
            if (c <= 0) {
                throw new BusinessException(ResponseResultCode.OPERT_ERROR);
            }

            operateInfo.append("管理员").append(user.getLoginName()).append("将").append(flowInstance.getInstanceName()).append("恢复");
        } else if (type == 2) { // 管理员删除流程
            if (flowInstance.getState() != FlowInstanceStateEnum.ADMIN_FROZEN.getIndex()) {
                throw new BusinessException("请先冻结用户流程！");
            }
            int c = flowInstanceRepository.deleteByIdAndState(id, flowInstance.getState());
            if (c <= 0) {
                throw new BusinessException(ResponseResultCode.OPERT_ERROR);
            }
            flowInstanceRepository.deleteByIdAndState(id, flowInstance.getState());
            flowInstanceNodeRepository.deleteByInstanceId(id);
            flowInstanceNodeUserTaskRepository.deleteByInstanceId(id);

            operateInfo.append("管理员").append(user.getLoginName()).append("将").append(flowInstance.getInstanceName()).append("删除");
        } else {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }

        TbFlowInstanceOperateHistory history = new TbFlowInstanceOperateHistory();
        Date now = new Date();
        history.setCreateDate(now);
        history.setLastModified(now);
        history.setInstanceId(id);
        history.setInstanceName(flowInstance.getInstanceName());
        history.setInstanceNodeId(0L);
        history.setInstanceName("");
        history.setOperateUserId(valueHolder.getUserIdHolder());
        history.setOperateInfo(operateInfo.toString());
        flowInstanceOperateHistoryRepository.save(history);
    }

    @Override
    public TbFlowInstance getFlowInstanceDetail(Long id) {
        TbFlowInstance flowInstance = flowInstanceRepository.findOne(id);
        if (flowInstance == null) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }

        TbSysUser user = sysUserRepository.findOne(flowInstance.getStartUserId());
        flowInstance.setStartUserLoginName(user.getLoginName());
        flowInstance.setStateShow(FlowInstanceStateEnum.getName(flowInstance.getState()));

        flowInstance.setHandingInstanceNodeNames("无");
        if (FlowInstanceStateEnum.HAVE_FINISH.getIndex() != flowInstance.getState()) {
            String handingInstanceNodeIds = flowInstance.getHandingInstanceNodeIds();
            if (StringUtil.isNotEmpty(handingInstanceNodeIds)) {
                if (StringUtil.isInteger(handingInstanceNodeIds)) {
                    TbFlowInstanceNode node = flowInstanceNodeRepository.findOne(Long.valueOf(handingInstanceNodeIds));
                    flowInstance.setHandingInstanceNodeNames(node.getNodeName());
                } else {
                    String[] nodeIdArr = handingInstanceNodeIds.split(",");
                    if (nodeIdArr != null && nodeIdArr.length > 0) {
                        List<Long> nodeIdList = new ArrayList<>();
                        for (String nodeId : nodeIdArr) {
                            if (StringUtil.isInteger(nodeId)) {
                                nodeIdList.add(Long.valueOf(nodeId));
                            }
                        }

                        List<TbFlowInstanceNode> nodeList = flowInstanceNodeRepository.listByIdList(nodeIdList);
                        if (nodeList != null && nodeList.size() > 0) {
                            StringBuilder nodeNameBuilder = new StringBuilder();
                            for (TbFlowInstanceNode node : nodeList) {
                                nodeNameBuilder.append(",").append(node.getNodeName());
                            }
                            nodeNameBuilder.deleteCharAt(0);
                            flowInstance.setHandingInstanceNodeNames(nodeNameBuilder.toString());
                        }
                    }
                }
            }
        }

        return flowInstance;
    }

    @Override
    public PageList<TbFlowInstanceOperateHistory> getOperateInfo(FlowInstanceRequest param) throws Exception {
        return flowInstanceOperateHistoryRepositoryCustom.list(param.getId(), param.getPage(), param.getRows());
    }

    @Override
    public FlowChartResponse getFlowInstanceFlowChart(Long id) {
        TbFlowInstance flowInstance = flowInstanceRepository.findOne(id);
        if (flowInstance == null) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }


        return null;
    }
}