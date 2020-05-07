package com.rose.service.impl;

import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.entity.TbFlowTemplateNode;
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
    public TbFlowTemplate getTemplateNodeTree(Long id, Long pid) {
        TbFlowTemplate template = flowTemplateRepository.findOne(id);
        List<TbFlowTemplateNode> templateNodeList = flowTemplateNodeRepository.listByTemplateIdAndPid(id, pid);
        template.setTemplateNodeList(templateNodeList);
        return template;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public TbFlowTemplate save(TbFlowTemplate param) {
        param.setId(null);
        Date now = new Date();
        param.setCreateDate(now);
        param.setLastModified(now);
        param.setStatus(0);
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
                    long c = flowInstanceRepository.countByTemplateId(id);
                    if (c > 0) {
                        throw new BusinessException("不能删除还有流程实例的流程模板！");
                    }
                    flowTemplateRepository.delete(id);
                    break;
                }
            }
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public TbFlowTemplateNode saveTemplateNode(TbFlowTemplateNode param) {
        if (param == null || StringUtil.isEmpty(param.getNodeName()) || param.getTemplateId() == null
                || param.getPid() == null || param.getOperateType() == null || (param.getOperateType() != 0 && param.getOperateType() != 1)) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        Date now = new Date();
        if (param.getId() == null) { // 新增
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
}