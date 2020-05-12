package com.rose.service;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.to.request.FlowInstanceRequest;

public interface FlowInstanceService {

    PageList<TbFlowInstance> searchFlowInstance(FlowInstanceRequest param) throws Exception;

}