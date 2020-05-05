package com.rose.service;

import com.rose.data.entity.TbFlowTemplate;

import java.util.List;

public interface FlowTemplateService {
    List<TbFlowTemplate> getTemplateTree();
    TbFlowTemplate getTemplateNodeTree(Long id);
}