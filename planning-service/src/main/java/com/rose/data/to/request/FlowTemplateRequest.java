package com.rose.data.to.request;

import com.rose.data.base.PageParam;
import lombok.Data;

@Data
public class FlowTemplateRequest extends PageParam {
    private String flowTemplateName;
    private Integer status;
}