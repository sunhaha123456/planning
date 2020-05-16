package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.StringUtil;
import com.rose.common.util.ValueHolder;
import com.rose.data.entity.*;
import com.rose.data.enums.FlowInstanceNodeStateEnum;
import com.rose.data.enums.FlowInstanceStateEnum;
import com.rose.data.to.request.FlowInstanceRequest;
import com.rose.data.to.response.FlowChartResponse;
import com.rose.repository.*;
import com.rose.service.FlowInstanceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.*;
import java.util.stream.Collectors;

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
    private FlowInstanceNodeUserTaskRepositoryCustom flowInstanceNodeUserTaskRepositoryCustom;
    @Inject
    private FlowInstanceOperateHistoryRepository flowInstanceOperateHistoryRepository;
    @Inject
    private FlowInstanceOperateHistoryRepositoryCustom flowInstanceOperateHistoryRepositoryCustom;
    @Inject
    private FlowInstanceFileRepository flowInstanceFileRepository;
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

            List<TbFlowInstanceFile> fileList = flowInstanceFileRepository.listByInstanceId(id);
            flowInstanceFileRepository.deleteByInstanceId(id);

            if (fileList != null && fileList.size() > 0) {
                for (TbFlowInstanceFile f : fileList) {
                    if (StringUtil.isNotEmpty(f.getNewFileName())) {
                        try {
                            // TODO: 2020/5/16 硬盘删文件代码，待完善

                        } catch (Exception e) {
                            log.error("管理员：{},删除流程：{}时，删硬盘文件：{}，失败！", user.getLoginName(), flowInstance.getInstanceName(), f.getNewFileName());
                        }
                    }
                }
            }

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
        Map<Integer, List<TbFlowInstanceNode>> map = new HashMap<>();
        List<TbFlowInstanceNode> nodeListTemp = null;
        List<TbFlowInstanceNode> instanceNodeList = flowInstanceNodeRepository.listByInstanceId(id);
        if (instanceNodeList != null && instanceNodeList.size() > 0) {
            for (TbFlowInstanceNode node : instanceNodeList) {
                Integer level = node.getNodeLevel();
                nodeListTemp = map.get(level);
                if (nodeListTemp == null) {
                    nodeListTemp = new ArrayList<>();
                    map.put(level, nodeListTemp);
                }
                nodeListTemp.add(node);
            }
        }

        Map<Long, List<String>> nodeUserMap = new HashMap<>();
        List<String> userNameListTemp = null;
        List<TbFlowInstanceNodeUserTask> userList = flowInstanceNodeUserTaskRepositoryCustom.queryTemplateNodeUserList(id);
        if (userList != null && userList.size() > 0) {
            for (TbFlowInstanceNodeUserTask t : userList) {
                userNameListTemp = nodeUserMap.get(t.getInstanceNodeId());
                if (userNameListTemp == null) {
                    userNameListTemp = new ArrayList<>();
                    nodeUserMap.put(t.getInstanceNodeId(), userNameListTemp);
                }
                userNameListTemp.add(t.getUserName());
            }
        }

        FlowChartResponse flowChart = new FlowChartResponse();

        Integer level = null;
        TbFlowInstanceNode nodeTemp = null;
        List<FlowChartResponse> children = null;
        FlowChartResponse flowChartTemp = null;
        for (Map.Entry<Integer, List<TbFlowInstanceNode>> entry : map.entrySet()) {
            level = entry.getKey();
            nodeListTemp = entry.getValue();
            if (level != null && nodeListTemp != null) {
                if (level == 0) {
                    nodeTemp = nodeListTemp.get(0);
                    flowChart.setName(nodeTemp.getNodeName() + "("+ FlowInstanceNodeStateEnum.getName(nodeTemp.getState()) + ")");

                    userNameListTemp = nodeUserMap.get(nodeTemp.getId());
                    if (userNameListTemp != null) {
                        flowChart.setContent(StringUtil.getListStr(userNameListTemp));
                    }

                    flowChart.setChildren(new ArrayList<FlowChartResponse>());
                } else if (level == 1) {
                    children = flowChart.getChildren();
                    for (TbFlowInstanceNode node : nodeListTemp) {
                        flowChartTemp = new FlowChartResponse();
                        flowChartTemp.setName(node.getNodeName() + "("+ FlowInstanceNodeStateEnum.getName(node.getState()) + ")");

                        userNameListTemp = nodeUserMap.get(node.getId());
                        if (userNameListTemp != null) {
                            flowChartTemp.setContent(StringUtil.getListStr(userNameListTemp));
                        }

                        flowChartTemp.setChildren(new ArrayList<FlowChartResponse>());
                        children.add(flowChartTemp);
                        node.setChildren(flowChartTemp.getChildren());
                    }
                } else {
                    List<TbFlowInstanceNode> upperList = map.get(level - 1);
                    Map<Long, TbFlowInstanceNode> upperMap = upperList.stream().collect(Collectors.toMap(TbFlowInstanceNode::getId, TbFlowInstanceNode -> TbFlowInstanceNode));

                    for (TbFlowInstanceNode node : nodeListTemp) {
                        flowChartTemp = new FlowChartResponse();
                        flowChartTemp.setName(node.getNodeName() + "("+ FlowInstanceNodeStateEnum.getName(node.getState()) + ")");

                        userNameListTemp = nodeUserMap.get(node.getId());
                        if (userNameListTemp != null) {
                            flowChartTemp.setContent(StringUtil.getListStr(userNameListTemp));
                        }

                        flowChartTemp.setChildren(new ArrayList<FlowChartResponse>());
                        node.setChildren(flowChartTemp.getChildren());

                        nodeTemp = upperMap.get(node.getPid());
                        if (nodeTemp == null) {
                            throw new BusinessException("获取父级node失败！");
                        }
                        nodeTemp.getChildren().add(flowChartTemp);
                    }
                }
            }
        }

        return flowChart;
    }
}