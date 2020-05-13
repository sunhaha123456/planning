package com.rose.data.to.request;

import com.rose.data.base.PageParam;
import lombok.Data;

@Data
public class FlowInstanceRequest extends PageParam {
    private Long templateId;
    private String flowInstanceName;
}