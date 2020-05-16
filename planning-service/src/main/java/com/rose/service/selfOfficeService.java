package com.rose.service;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.to.request.FlowTemplateRequest;

/**
 * 描述：自助办公 service
 * @author sunpeng
 */
public interface SelfOfficeService {
    PageList<TbFlowTemplate> searchTemplate(FlowTemplateRequest param) throws Exception;
}