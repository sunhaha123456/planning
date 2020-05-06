package com.rose.service;

import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.entity.TbFlowTemplateNode;

import java.util.List;

public interface FlowTemplateService {
    List<TbFlowTemplate> getTemplateTree();
    TbFlowTemplate getTemplateNodeTree(Long id, Long pid);
    TbFlowTemplate save(TbFlowTemplate param);
    void operateTemplateState(Long id, Integer type);
    TbFlowTemplateNode saveTemplateNode(TbFlowTemplateNode param);
}