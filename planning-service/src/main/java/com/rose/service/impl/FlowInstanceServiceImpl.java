package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.to.request.FlowInstanceRequest;
import com.rose.repository.FlowInstanceRepositoryCustom;
import com.rose.service.FlowInstanceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Slf4j
@Service
public class FlowInstanceServiceImpl implements FlowInstanceService {

    @Inject
    private FlowInstanceRepositoryCustom flowInstanceRepositoryCustom;

    @Override
    public PageList<TbFlowInstance> searchFlowInstance(FlowInstanceRequest param) throws Exception {
        return flowInstanceRepositoryCustom.list(param.getTemplateId(), param.getFlowInstanceName(), param.getStartUserId(), param.getPage(), param.getRows());
    }
}