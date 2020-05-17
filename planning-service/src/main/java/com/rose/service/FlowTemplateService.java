package com.rose.service;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.entity.TbFlowTemplateNode;
import com.rose.data.entity.TbFlowTemplateNodeUserTask;
import com.rose.data.to.request.FlowTemplateRequest;
import com.rose.data.to.response.FlowChartResponse;

import java.util.List;

public interface FlowTemplateService {

    List<TbFlowTemplate> getTemplateTree();

    TbFlowTemplate getTemplateNodeTree(Long templateId, Long nodePid);

    PageList<TbFlowTemplate> searchTemplate(FlowTemplateRequest param) throws Exception;

    TbFlowTemplate save(TbFlowTemplate param);

    void operateTemplateState(Long id, Integer type);

    TbFlowTemplateNode saveTemplateNode(TbFlowTemplateNode param);

    TbFlowTemplateNode getTemplateNodeDetail(Long id);

    TbFlowTemplateNode deleteTemplateNodeAndReturnParentNode(Long nodeId, Long templateId);

    void deleteTemplateNodeUser(Long id, Long templateId, Long nodeId);

    TbFlowTemplateNodeUserTask addTemplateNodeUser(TbFlowTemplateNodeUserTask param);

    FlowChartResponse getTemplateFlowChart(Long id);

    /**
     * 功能：获取模板id
     * @param templateName
     * @param state 0：正常 1：停用
     * @return
     */
    List<Long> getIdList(String templateName, Integer state);
}