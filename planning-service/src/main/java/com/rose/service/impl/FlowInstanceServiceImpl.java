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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.io.File;
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
    private FlowTemplateRepository flowTemplateRepository;
    @Inject
    private FlowTemplateNodeRepository flowTemplateNodeRepository;
    @Inject
    private FlowTemplateNodeUserTaskRepository flowTemplateNodeUserTaskRepository;
    @Inject
    private SysUserRepository sysUserRepository;

    @Inject
    private ValueHolder valueHolder;

    @Value("${file.upload.path}")
    private String uploadPath;

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

        Long userId = valueHolder.getUserIdHolder();
        String operateInfo = null;
        if (type == 0) { // 管理员冻结流程
            if (flowInstance.getState() == FlowInstanceStateEnum.ADMIN_FROZEN.getIndex()) {
                throw new BusinessException("用户流程状态原先已是冻结！");
            }

            int c = flowInstanceRepository.updateState(id, FlowInstanceStateEnum.ADMIN_FROZEN.getIndex(), flowInstance.getState());
            if (c <= 0) {
                throw new BusinessException(ResponseResultCode.OPERT_ERROR);
            }

            operateInfo = "以管理员身份冻结流程";
        } else if (type == 1) { // 管理员恢复流程
            if (flowInstance.getState() != FlowInstanceStateEnum.ADMIN_FROZEN.getIndex()) {
                throw new BusinessException("用户流程状态不是已是冻结！");
            }

            int c = flowInstanceRepository.updateState(id, FlowInstanceStateEnum.HAVE_STARTED.getIndex(), FlowInstanceStateEnum.ADMIN_FROZEN.getIndex());
            if (c <= 0) {
                throw new BusinessException(ResponseResultCode.OPERT_ERROR);
            }

            operateInfo = "以管理员身份恢复流程";
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
                File file = null;
                for (TbFlowInstanceFile fileInstance : fileList) {
                    if (StringUtil.isNotEmpty(fileInstance.getNewFileName())) {
                        try {
                            file = new File(uploadPath + fileInstance.getNewFileName());
                            if (file.exists()) {
                                file.delete();
                            }
                        } catch (Exception e) {
                            log.error("管理员userId：{},删除流程：{}时，删硬盘文件：{}，失败！", userId, flowInstance.getInstanceName(), fileInstance.getNewFileName());
                        }
                    }
                }
            }

            operateInfo = "以管理员身份删除流程";
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
        history.setInstanceNodeName("");
        history.setOperateUserId(userId);
        history.setOperateInfo(operateInfo);
        flowInstanceOperateHistoryRepository.save(history);
    }

    @Override
    public TbFlowInstance getFlowInstanceDetail(Long id) {
        TbFlowInstance flowInstance = flowInstanceRepository.findOne(id);
        if (flowInstance == null) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }

        TbSysUser user = sysUserRepository.findOne(flowInstance.getStartUserId());
        flowInstance.setStartUserName(user.getUserName());
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

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void startApply(Long templateId, String instanceName, String applyContent, List<MultipartFile> fileList) {
        TbFlowTemplate template = flowTemplateRepository.findOne(templateId);
        if (template == null) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        if (template.getStatus() != 0) {
            throw new BusinessException("流程模板已被停用不能创建申请！");
        }

        Date now = new Date();

        TbFlowInstance flowInstanceParam = new TbFlowInstance();
        flowInstanceParam.setId(null);
        flowInstanceParam.setCreateDate(now);
        flowInstanceParam.setLastModified(now);
        flowInstanceParam.setInstanceName(instanceName);
        flowInstanceParam.setApplyContent(applyContent);
        flowInstanceParam.setTemplateId(templateId);
        flowInstanceParam.setStartUserId(valueHolder.getUserIdHolder());
        flowInstanceParam.setStartTime(now);
        flowInstanceParam.setState(FlowInstanceStateEnum.HAVE_STARTED.getIndex());

        TbFlowInstance flowInstanceRet = flowInstanceRepository.save(flowInstanceParam);

        List<TbFlowTemplateNode> templateNodeList = flowTemplateNodeRepository.listByTemplateId(templateId);
        if (templateNodeList == null || templateNodeList.size() == 0) {
            throw new BusinessException("模板无流程节点不能发起申请！");
        }

        List<TbFlowTemplateNodeUserTask> templateNodeUserTaskList = flowTemplateNodeUserTaskRepository.findByTmeplateId(templateId);
        if (templateNodeUserTaskList == null || templateNodeUserTaskList.size() == 0) {
            throw new BusinessException("模板流程节点无执行用户！");
        }

        // k：nodeLevel，v：nodeList
        Map<Integer, List<TbFlowTemplateNode>> templateNodeListMap = new HashMap<>();
        // k：nodeId，v：node
        //Map<Long, TbFlowTemplateNode> templateNodeMap = new HashMap<>();
        List<TbFlowTemplateNode> templateNodeListTemp = null;
        for (TbFlowTemplateNode templateNode : templateNodeList) {
            templateNodeListTemp = templateNodeListMap.get(templateNode.getNodeLevel());
            if (templateNodeListTemp == null) {
                templateNodeListTemp = new ArrayList<>();
                templateNodeListMap.put(templateNode.getNodeLevel(), templateNodeListTemp);
            }
            templateNodeListTemp.add(templateNode);
            //templateNodeMap.put(templateNode.getId(), templateNode);
        }

        // k：nodeId，v：nodeUserTaskLike
        Map<Long, List<TbFlowTemplateNodeUserTask>> templateNodeUserTaskMap = new HashMap<>();
        List<TbFlowTemplateNodeUserTask> templateNodeUserTaskListTemp = null;
        for (TbFlowTemplateNodeUserTask t : templateNodeUserTaskList) {
            templateNodeUserTaskListTemp = templateNodeUserTaskMap.get(t.getTemplateNodeId());
            if (templateNodeUserTaskListTemp == null) {
                templateNodeUserTaskListTemp = new ArrayList<>();
                templateNodeUserTaskMap.put(t.getTemplateNodeId(), templateNodeUserTaskListTemp);
            }
            templateNodeUserTaskListTemp.add(t);
        }

        TbFlowTemplateNode flowTemplateNodeTemp = null;
        TbFlowInstanceNode flowInstanceNodeTemp = null;
        TbFlowInstanceNode flowInstanceNodeDbTemp = null;

        if (templateNodeListMap.size() == 0) {
            throw new BusinessException("模板节点无层级！");
        } else {
            templateNodeListTemp = templateNodeListMap.get(0);
            if (templateNodeListTemp == null || templateNodeListTemp.size() != 1) {
                throw new BusinessException("模板首层节点不是一个！");
            }

            Map<Long, TbFlowInstanceNode> flowInstanceNodeDbMap = new HashMap<>();

            flowTemplateNodeTemp = templateNodeListTemp.get(0);
            flowInstanceNodeTemp = getFlowInstanceNode(now, flowInstanceRet.getId(), flowTemplateNodeTemp.getNodeName(),
                    0L, 0, flowInstanceRet.getId() + "", flowTemplateNodeTemp.getInstruction(),
                    flowTemplateNodeTemp.getOperateType(), FlowInstanceNodeStateEnum.HAVE_HANDING.getIndex());

            flowInstanceNodeDbTemp = flowInstanceNodeRepository.save(flowInstanceNodeTemp);
            flowInstanceNodeDbMap.put(flowInstanceNodeDbTemp.getId(), flowInstanceNodeDbTemp);

            templateNodeUserTaskListTemp = templateNodeUserTaskMap.get(flowTemplateNodeTemp.getId());
            if (templateNodeUserTaskListTemp == null || templateNodeUserTaskListTemp.size() == 0) {
                throw new BusinessException("模板首层节点未关联用户！");
            }

            List<TbFlowInstanceNodeUserTask> flowInstanceNodeUserTaskListTemp = new ArrayList<>();
            TbFlowInstanceNodeUserTask flowInstanceNodeUserTaskTemp = null;
            for (TbFlowTemplateNodeUserTask t : templateNodeUserTaskListTemp) {
                flowInstanceNodeUserTaskTemp = getFlowInstanceNodeUserTask(now, flowInstanceRet.getId(), flowInstanceNodeDbTemp.getId(), t.getUserId(), FlowInstanceNodeStateEnum.HAVE_HANDING.getIndex(), null);
                flowInstanceNodeUserTaskListTemp.add(flowInstanceNodeUserTaskTemp);
            }
            flowInstanceNodeUserTaskRepository.save(flowInstanceNodeUserTaskListTemp);


        }
    }

    private TbFlowInstanceNode getFlowInstanceNode(Date nodeDate, Long flowInstanceId, String nodeName, Long pid, Integer nodeLevel, String totalCode, String instruction, Integer operateType, Integer state) {
        TbFlowInstanceNode flowInstanceNode = new TbFlowInstanceNode();
        flowInstanceNode.setId(null);
        flowInstanceNode.setCreateDate(nodeDate);
        flowInstanceNode.setLastModified(nodeDate);
        flowInstanceNode.setInstanceId(flowInstanceId);
        flowInstanceNode.setNodeName(nodeName);
        flowInstanceNode.setPid(pid);
        flowInstanceNode.setNodeLevel(nodeLevel);
        flowInstanceNode.setTotalCode(totalCode);
        flowInstanceNode.setInstruction(instruction);
        flowInstanceNode.setOperateType(operateType);
        flowInstanceNode.setState(state);
        return flowInstanceNode;
    }

    private TbFlowInstanceNodeUserTask getFlowInstanceNodeUserTask(Date nodeUserTaskDate, Long flowInstanceId, Long instanceNodeId, Long userId, Integer state, String approvalContent) {
        TbFlowInstanceNodeUserTask userTask = new TbFlowInstanceNodeUserTask();
        userTask.setId(null);
        userTask.setCreateDate(nodeUserTaskDate);
        userTask.setLastModified(nodeUserTaskDate);
        userTask.setInstanceId(flowInstanceId);
        userTask.setInstanceNodeId(instanceNodeId);
        userTask.setUserId(userId);
        userTask.setState(state);
        userTask.setApprovalContent(approvalContent);
        return userTask;
    }
}