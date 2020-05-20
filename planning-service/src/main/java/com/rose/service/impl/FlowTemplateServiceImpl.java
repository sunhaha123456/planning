package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.entity.TbFlowTemplateNode;
import com.rose.data.entity.TbFlowTemplateNodeUserTask;
import com.rose.data.entity.TbSysUser;
import com.rose.data.to.request.FlowTemplateRequest;
import com.rose.data.to.response.EasyuiTreeResponse;
import com.rose.data.to.response.FlowChartResponse;
import com.rose.repository.*;
import com.rose.service.FlowTemplateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
public class FlowTemplateServiceImpl implements FlowTemplateService {

    @Inject
    private FlowTemplateRepository flowTemplateRepository;
    @Inject
    private FlowTemplateRepositoryCustom flowTemplateRepositoryCustom;
    @Inject
    private FlowTemplateNodeRepository flowTemplateNodeRepository;
    @Inject
    private FlowTemplateNodeUserTaskRepository flowTemplateNodeUserTaskRepository;
    @Inject
    private FlowTemplateNodeUserTaskRepositoryCustom flowTemplateNodeUserTaskRepositoryCustom;
    @Inject
    private FlowInstanceRepository flowInstanceRepository;
    @Inject
    private SysUserRepository sysUserRepository;

    @Override
    public List<TbFlowTemplate> getTemplateTree() {
        List<TbFlowTemplate> list = flowTemplateRepository.listAll();
        if (list != null && list.size() > 0) {
            for (TbFlowTemplate t : list) {
                t.setText(t.getTemplateName());
            }
        }
        return list;
    }

    @Override
    public TbFlowTemplate getTemplateNodeTree(Long templateId, Long nodePid) {
        TbFlowTemplate template = flowTemplateRepository.findOne(templateId);
        List<TbFlowTemplateNode> templateNodeList = flowTemplateNodeRepository.listByTemplateIdAndPid(templateId, nodePid);
        if (templateNodeList != null && templateNodeList.size() > 0) {
            List<Long> idList = templateNodeList.stream().map(TbFlowTemplateNode::getId).collect(Collectors.toList());
            List<TbFlowTemplateNode> allChildList= flowTemplateNodeRepository.listByPid(idList);
            List<Long> allChildPidList = allChildList.stream().map(TbFlowTemplateNode::getPid).collect(Collectors.toList());
            for (TbFlowTemplateNode node : templateNodeList) {
                node.setText(node.getNodeName());
                if (allChildPidList.contains(node.getId())) {
                    node.setState("closed");
                }
            }
        }
        template.setTemplateNodeList(templateNodeList);
        return template;
    }

    @Override
    public PageList<TbFlowTemplate> searchTemplate(FlowTemplateRequest param) throws Exception {
        return flowTemplateRepositoryCustom.list(param.getFlowTemplateName(), param.getStatus(), param.getPage(), param.getRows());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public TbFlowTemplate save(TbFlowTemplate param) {
        TbFlowTemplate template = flowTemplateRepository.findByTemplateName(param.getTemplateName());
        if (template != null) {
            throw new BusinessException("模板名称重复！");
        }

        param.setId(null);
        Date now = new Date();
        param.setCreateDate(now);
        param.setLastModified(now);
        param.setStatus(1);
        return flowTemplateRepository.save(param);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void operateTemplateState(Long id, Integer type) {
        TbFlowTemplate template = flowTemplateRepository.findOne(id);
        if (template == null) {
            throw new BusinessException(ResponseResultCode.NO_DATA_RECORD_ERROR);
        }
        if (type != template.getStatus()) {
            switch (type) {
                case 0: { // 启用
                    long c = flowTemplateNodeRepository.countByTemplateId(id);
                    if (c <= 0) {
                        throw new BusinessException("无节点模板不能启用！");
                    }
                    flowTemplateRepository.updateStatus(id, 0, template.getStatus());
                    break;
                }
                case 1: { // 停用
                    flowTemplateRepository.updateStatus(id, 1, template.getStatus());
                    break;
                }
                case 2: { // 删除
                    if (template.getStatus() != 1) {
                        throw new BusinessException("请先停用模板！");
                    }

                    long c = flowInstanceRepository.countByTemplateId(id);
                    if (c > 0) {
                        throw new BusinessException("不能删除还有流程实例的流程模板！");
                    }
                    flowTemplateRepository.delete(id);
                    flowTemplateNodeRepository.deleteByTemplateId(id);
                    flowTemplateNodeUserTaskRepository.deleteByTmeplateId(id);
                    break;
                }
            }
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public TbFlowTemplateNode saveTemplateNode(TbFlowTemplateNode param) {
        if (param == null || StringUtil.isEmpty(param.getNodeName()) || param.getTemplateId() == null
                || param.getOperateType() == null || (param.getOperateType() != 0 && param.getOperateType() != 1)) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        TbFlowTemplate template = flowTemplateRepository.findOne(param.getTemplateId());
        if (template.getStatus() != 1) {
            throw new BusinessException("请先停用模板！");
        }

        Date now = new Date();
        if (param.getId() == null) { // 新增
            if (param.getPid() == null) {
                throw new BusinessException(ResponseResultCode.PARAM_ERROR);
            }
            if (param.getUserIdList() == null || param.getUserIdList().size() == 0) {
                throw new BusinessException("未设置执行用户！");
            }

            List<TbFlowTemplateNode> nodeListByNodeName = flowTemplateNodeRepository.listByTemplateIdAndNodeName(param.getTemplateId(), param.getNodeName());
            if (nodeListByNodeName != null && nodeListByNodeName.size() > 0) {
                throw new BusinessException("节点名称重复！");
            }

            param.setCreateDate(now);
            param.setLastModified(now);

            String parentTotalCode = "";
            if (param.getPid() == 0) { // 新增一级节点
                List<TbFlowTemplateNode> nodeList = flowTemplateNodeRepository.listByTemplateIdAndPid(param.getTemplateId(), 0L);
                if (nodeList != null && nodeList.size() > 0) {
                    throw new BusinessException("只允许拥有一个一级节点！");
                }
                param.setNodeLevel(0);
            } else {
                TbFlowTemplateNode parentNode = flowTemplateNodeRepository.findOne(param.getPid());
                if (parentNode == null) {
                    throw new BusinessException("父级节点不存在！");
                }
                param.setNodeLevel(parentNode.getNodeLevel() + 1);
                parentTotalCode = parentNode.getTotalCode();
            }

            TbFlowTemplateNode res = flowTemplateNodeRepository.save(param);
            if (StringUtil.isEmpty(parentTotalCode)) {
                res.setTotalCode(res.getId() + "");
            } else {
                res.setTotalCode(parentTotalCode + "," + res.getId());
            }

            List<TbFlowTemplateNodeUserTask> userTaskList = new ArrayList<>();
            TbFlowTemplateNodeUserTask task = null;
            for (Long taskUserId : param.getUserIdList()) {
                task = new TbFlowTemplateNodeUserTask();
                task.setId(null);
                task.setCreateDate(now);
                task.setLastModified(now);
                task.setUserId(taskUserId);
                task.setTemplateId(param.getTemplateId());
                task.setTemplateNodeId(res.getId());
                userTaskList.add(task);
            }
            flowTemplateNodeUserTaskRepository.save(userTaskList);

            return res;
        } else { // 修改
            TbFlowTemplateNode node = flowTemplateNodeRepository.findByIdAndTemplateId(param.getId(), param.getTemplateId());
            if (node == null) {
                throw new BusinessException("模板节点不存在！");
            }

            List<TbFlowTemplateNode> nodeListByNodeName = flowTemplateNodeRepository.listByTemplateIdAndNodeName(param.getTemplateId(), param.getNodeName(), param.getId());
            if (nodeListByNodeName != null && nodeListByNodeName.size() > 0) {
                throw new BusinessException("节点名称重复！");
            }

            node.setLastModified(now);
            node.setNodeName(param.getNodeName());
            node.setInstruction(param.getInstruction());
            node.setOperateType(param.getOperateType());

            if (param.getUserUplateFlag() == 1) {
                if (param.getUserIdList() == null || param.getUserIdList().size() == 0) {
                    throw new BusinessException("未设置执行用户！");
                }

                flowTemplateNodeUserTaskRepository.deleteByTmeplateIdAndNodeId(param.getTemplateId(), param.getId());
                List<TbFlowTemplateNodeUserTask> userTaskList = new ArrayList<>();
                TbFlowTemplateNodeUserTask task = null;
                for (Long taskUserId : param.getUserIdList()) {
                    task = new TbFlowTemplateNodeUserTask();
                    task.setId(null);
                    task.setCreateDate(now);
                    task.setLastModified(now);
                    task.setUserId(taskUserId);
                    task.setTemplateId(param.getTemplateId());
                    task.setTemplateNodeId(param.getId());
                    userTaskList.add(task);
                }
                flowTemplateNodeUserTaskRepository.save(userTaskList);
            }

            return flowTemplateNodeRepository.save(node);
        }
    }

    @Override
    public TbFlowTemplateNode getTemplateNodeDetail(Long id) {
        TbFlowTemplateNode node = flowTemplateNodeRepository.findOne(id);

        List<EasyuiTreeResponse> userTreeList = new ArrayList<>();
        List<TbFlowTemplateNodeUserTask> userTaskList = flowTemplateNodeUserTaskRepositoryCustom.queryNodeUserList(id);
        if (userTaskList != null && userTaskList.size() > 0) {
            EasyuiTreeResponse resp = null;
            for (TbFlowTemplateNodeUserTask task : userTaskList) {
                resp = new EasyuiTreeResponse();
                resp.setId(task.getUserId());
                resp.setText(task.getLoginName() + "（" + task.getUserName() + "）");
                userTreeList.add(resp);
            }
        }
        node.setUserTreeResponse(userTreeList);

        return node;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public TbFlowTemplateNode deleteTemplateNodeAndReturnParentNode(Long nodeId, Long templateId) {
        TbFlowTemplate template = flowTemplateRepository.findOne(templateId);
        if (template.getStatus() != 1) {
            throw new BusinessException("请先停用模板！");
        }
        TbFlowTemplateNode node = flowTemplateNodeRepository.findByIdAndTemplateId(nodeId, templateId);
        if (node == null) {
            throw new BusinessException("节点不存在！");
        }

        List<Long> nodeIdList = flowTemplateNodeRepository.listNodeAndChildId(nodeId, node.getTotalCode() + ",%");

        flowTemplateNodeRepository.deleteByIdList(nodeIdList);
        flowTemplateNodeUserTaskRepository.deleteByTmeplateIdAndNodeIdList(templateId, nodeIdList);

        if (node.getPid() != 0L) {
            return flowTemplateNodeRepository.findOne(node.getPid());
        } else { // 无父级节点，返回 null
            return null;
        }
    }

//    @Transactional(rollbackFor = Exception.class)
//    @Override
//    public void deleteTemplateNodeUser(Long id, Long templateId, Long nodeId) {
//        TbFlowTemplate template = flowTemplateRepository.findOne(templateId);
//        if (template.getStatus() != 1) {
//            throw new BusinessException("请先停用模板！");
//        }
//        TbFlowTemplateNode node = flowTemplateNodeRepository.findByIdAndTemplateId(nodeId, templateId);
//        if (node == null) {
//            throw new BusinessException("节点不存在！");
//        }
//        int c = flowTemplateNodeUserTaskRepository.deleteByIdAndTmeplateIdAndNodeId(id, templateId, nodeId);
//        if (c <= 0) {
//            throw new BusinessException(ResponseResultCode.OPERT_ERROR);
//        }
//    }

//    @Transactional(rollbackFor = Exception.class)
//    @Override
//    public TbFlowTemplateNodeUserTask addTemplateNodeUser(TbFlowTemplateNodeUserTask param) {
//        Long templateId = param.getTemplateId();
//        Long nodeId = param.getTemplateNodeId();
//        String loginName = param.getLoginName();
//
//        if (StringUtil.isEmpty(loginName)) {
//            throw new BusinessException("用户登陆名不能为空！");
//        }
//        TbSysUser user = sysUserRepository.findByLoginName(loginName);
//        if (user == null) {
//            throw new BusinessException("查无对应用户！");
//        }
//        TbFlowTemplate template = flowTemplateRepository.findOne(templateId);
//        if (template.getStatus() != 1) {
//            throw new BusinessException("请先停用模板！");
//        }
//        TbFlowTemplateNode node = flowTemplateNodeRepository.findByIdAndTemplateId(nodeId, templateId);
//        if (node == null) {
//            throw new BusinessException("节点不存在！");
//        }
//
//        List<TbFlowTemplateNodeUserTask> userTaskList = flowTemplateNodeUserTaskRepository.findByTmeplateIdAndNodeIdAndUserId(templateId, nodeId, user.getId());
//        if (userTaskList != null && userTaskList.size() > 0) {
//            throw new BusinessException("节点下已关联过了该用户！");
//        }
//
//        param.setId(null);
//        Date now = new Date();
//        param.setCreateDate(now);
//        param.setLastModified(now);
//        param.setUserId(user.getId());
//
//        TbFlowTemplateNodeUserTask res = flowTemplateNodeUserTaskRepository.save(param);
//        res.setLoginName(user.getLoginName());
//        res.setUserName(user.getUserName());
//
//        return res;
//    }

    @Override
    public FlowChartResponse getTemplateFlowChart(Long id) {
        TbFlowTemplate template = flowTemplateRepository.findOne(id);
        if (template == null) {
            throw new BusinessException("模板不存在！");
        }
        Map<Integer, List<TbFlowTemplateNode>> map = new HashMap<>();
        List<TbFlowTemplateNode> nodeListTemp = null;
        List<TbFlowTemplateNode> templateNodeList = flowTemplateNodeRepository.listByTemplateId(id);
        if (templateNodeList != null && templateNodeList.size() > 0) {
            for (TbFlowTemplateNode node : templateNodeList) {
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
        List<TbFlowTemplateNodeUserTask> userList = flowTemplateNodeUserTaskRepositoryCustom.queryTemplateNodeUserList(id);
        if (userList != null && userList.size() > 0) {
            for (TbFlowTemplateNodeUserTask t : userList) {
                userNameListTemp = nodeUserMap.get(t.getTemplateNodeId());
                if (userNameListTemp == null) {
                    userNameListTemp = new ArrayList<>();
                    nodeUserMap.put(t.getTemplateNodeId(), userNameListTemp);
                }
                userNameListTemp.add(t.getUserName());
            }
        }

        FlowChartResponse flowChart = new FlowChartResponse();

        Integer level = null;
        TbFlowTemplateNode nodeTemp = null;
        List<FlowChartResponse> children = null;
        FlowChartResponse flowChartTemp = null;
        for (Map.Entry<Integer, List<TbFlowTemplateNode>> entry : map.entrySet()) {
            level = entry.getKey();
            nodeListTemp = entry.getValue();
            if (level != null && nodeListTemp != null) {
                if (level == 0) {
                    nodeTemp = nodeListTemp.get(0);
                    flowChart.setName(nodeTemp.getNodeName());

                    userNameListTemp = nodeUserMap.get(nodeTemp.getId());
                    if (userNameListTemp != null) {
                        flowChart.setContent(StringUtil.getListStr(userNameListTemp));
                    }

                    flowChart.setChildren(new ArrayList<FlowChartResponse>());
                } else if (level == 1) {
                    children = flowChart.getChildren();
                    for (TbFlowTemplateNode node : nodeListTemp) {
                        flowChartTemp = new FlowChartResponse();
                        flowChartTemp.setName(node.getNodeName());

                        userNameListTemp = nodeUserMap.get(node.getId());
                        if (userNameListTemp != null) {
                            flowChartTemp.setContent(StringUtil.getListStr(userNameListTemp));
                        }

                        flowChartTemp.setChildren(new ArrayList<FlowChartResponse>());
                        children.add(flowChartTemp);
                        node.setChildren(flowChartTemp.getChildren());
                    }
                } else {
                    List<TbFlowTemplateNode> upperList = map.get(level - 1);
                    Map<Long, TbFlowTemplateNode> upperMap = upperList.stream().collect(Collectors.toMap(TbFlowTemplateNode::getId, TbFlowTemplateNode -> TbFlowTemplateNode));

                    for (TbFlowTemplateNode node : nodeListTemp) {
                        flowChartTemp = new FlowChartResponse();
                        flowChartTemp.setName(node.getNodeName());

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

    @Override
    public List<Long> getIdList(String templateName, Integer state) {
        List<TbFlowTemplate> list = null;
        if (state == null) {
            list = flowTemplateRepository.listByName(templateName);
        } else {
            list = flowTemplateRepository.listByNameAndStatus(templateName, state);
        }

        List<Long> idList = new ArrayList<>();
        if (list != null && list.size() > 0) {
            idList = list.stream().map(TbFlowTemplate::getId).collect(Collectors.toList());
        }

        return idList;
    }

    @Override
    public TbSysUser getUserInfo(String loginName) {
        if (StringUtil.isEmpty(loginName)) {
            throw new BusinessException("用户登陆名不能为空！");
        }
        TbSysUser user = sysUserRepository.findByLoginName(loginName);
        if (user == null) {
            throw new BusinessException("查无对应用户！");
        }
        return user;
    }
}