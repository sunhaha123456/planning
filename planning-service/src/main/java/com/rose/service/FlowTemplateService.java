package com.rose.service;

import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.entity.TbFlowTemplateNode;
import com.rose.data.entity.TbFlowTemplateNodeUserTask;
import com.rose.data.to.response.FlowChartResponse;

import java.util.List;

public interface FlowTemplateService {
    List<TbFlowTemplate> getTemplateTree();
    TbFlowTemplate getTemplateNodeTree(Long templateId, Long nodePid);
    TbFlowTemplate save(TbFlowTemplate param);
    void operateTemplateState(Long id, Integer type);
    TbFlowTemplateNode saveTemplateNode(TbFlowTemplateNode param);
    TbFlowTemplateNode getTemplateNodeDetail(Long id);
    TbFlowTemplateNode deleteTemplateNodeAndReturnParentNode(Long nodeId, Long templateId);
    void deleteTemplateNodeUser(Long id, Long templateId, Long nodeId);
    TbFlowTemplateNodeUserTask addTemplateNodeUser(TbFlowTemplateNodeUserTask param);
    FlowChartResponse getTemplateFlowChart(Long id);
}