package com.rose.service;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.to.request.FlowInstanceRequest;
import com.rose.data.to.response.FlowChartResponse;

public interface FlowInstanceService {

    PageList<TbFlowInstance> searchFlowInstance(FlowInstanceRequest param) throws Exception;

    void operateInstance(Long id, Integer type);

    TbFlowInstance getFlowInstanceDetail(Long id);

    FlowChartResponse getFlowInstanceFlowChart(Long id);
}