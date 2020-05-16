package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.util.ValueHolder;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.to.request.FlowTemplateRequest;
import com.rose.repository.FlowTemplateRepository;
import com.rose.repository.FlowTemplateRepositoryCustom;
import com.rose.repository.SysUserRepository;
import com.rose.service.SelfOfficeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Slf4j
@Service
public class SelfOfficeServiceImpl implements SelfOfficeService {
    @Inject
    private FlowTemplateRepository flowTemplateRepository;
    @Inject
    private FlowTemplateRepositoryCustom flowTemplateRepositoryCustom;
    @Inject
    private SysUserRepository sysUserRepository;
    @Inject
    private ValueHolder valueHolder;

    @Override
    public PageList<TbFlowTemplate> searchTemplate(FlowTemplateRequest param) throws Exception {
        return flowTemplateRepositoryCustom.list(param.getFlowTemplateName(), param.getStatus(), param.getPage(), param.getRows());
    }
}