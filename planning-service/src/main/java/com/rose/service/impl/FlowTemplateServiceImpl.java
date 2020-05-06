package com.rose.service.impl;

import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.entity.TbFlowTemplateNode;
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
        return flowTemplateRepository.save(param);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void operateTemplateState(Long id, Integer type) {

    }
}