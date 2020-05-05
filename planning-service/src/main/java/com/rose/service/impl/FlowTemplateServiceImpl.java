package com.rose.service.impl;

import com.rose.data.entity.TbFlowTemplate;
import com.rose.repository.FlowTemplateRepository;
import com.rose.service.FlowTemplateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class FlowTemplateServiceImpl implements FlowTemplateService {

    @Inject
    private FlowTemplateRepository flowTemplateRepository;

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
    public TbFlowTemplate getTemplateNodeTree(Long id) {
        TbFlowTemplate template = flowTemplateRepository.findOne(id);

        template.setNodeList(new ArrayList<>());

        return template;
    }
}