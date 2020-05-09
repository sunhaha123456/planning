package com.rose.service.impl;

import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.entity.TbFlowTemplateNode;
import com.rose.data.to.response.FlowChartResponse;
import com.rose.repository.FlowInstanceRepository;
import com.rose.repository.FlowTemplateNodeRepository;
import com.rose.repository.FlowTemplateRepository;
import com.rose.service.FlowTemplateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
public class FlowTemplateServiceImpl implements FlowTemplateService {

    @Inject
    private FlowTemplateRepository flowTemplateRepository;
    @Inject
    private FlowTemplateNodeRepository flowTemplateNodeRepository;
    @Inject
    private FlowInstanceRepository flowInstanceRepository;

    @Override
    public List<TbFlowTemplate> getTemplateTree() {
        List<TbFlowTemplate> list = flowTemplateRepository.listAll();
        if (list != null && list.size() > 0) {
            for (TbFlowTemplate t : list) {
                t.setText(t.getTemplateName());
                t.setState("close");
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
                    flowTemplateRepository.updateStatus(id, 0, template.getStatus());
                    break;
                }
                case 1: { // 冻结
                    flowTemplateRepository.updateStatus(id, 1, template.getStatus());
                    break;
                }
                case 2: { // 删除
                    if (template.getStatus() != 1) {
                        throw new BusinessException("请先冻结模板！");
                    }

                    long c = flowInstanceRepository.countByTemplateId(id);
                    if (c > 0) {
                        throw new BusinessException("不能删除还有流程实例的流程模板！");
                    }
                    flowTemplateRepository.delete(id);
                    flowTemplateNodeRepository.deleteByTemplateId(id);
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
            throw new BusinessException("请先冻结模板！");
        }

        Date now = new Date();
        if (param.getId() == null) { // 新增
            if (param.getPid() == null) {
                throw new BusinessException(ResponseResultCode.PARAM_ERROR);
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

            return flowTemplateNodeRepository.save(node);
        }
    }

    @Override
    public TbFlowTemplateNode getTemplateNodeDetail(Long id) {
        return flowTemplateNodeRepository.findOne(id);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public TbFlowTemplateNode deleteTemplateNodeAndReturnParentNode(Long nodeId, Long templateId) {
        TbFlowTemplate template = flowTemplateRepository.findOne(templateId);
        if (template.getStatus() != 1) {
            throw new BusinessException("请先冻结模板！");
        }
        TbFlowTemplateNode node = flowTemplateNodeRepository.findByIdAndTemplateId(nodeId, templateId);
        flowTemplateNodeRepository.deleteNodeAndNodeChild(nodeId, node.getTotalCode() + ",%");
        if (node.getPid() != 0L) {
            return flowTemplateNodeRepository.findOne(node.getPid());
        } else { // 无父级节点，返回 null
            return null;
        }
    }

    @Override
    public FlowChartResponse getTemplateFlowChart(Long id) {
        FlowChartResponse flowChart = new FlowChartResponse();

        flowChart.setName("项目经理审批");
        flowChart.setContent("啥快递焚枯食淡附近就克里斯多夫接口了接口了发动机克里斯多夫了愧疚");







        return flowChart;
    }
}