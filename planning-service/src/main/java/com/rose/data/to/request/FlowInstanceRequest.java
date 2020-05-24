package com.rose.data.to.request;

import com.rose.data.base.PageParam;
import lombok.Data;

@Data
public class FlowInstanceRequest extends PageParam {
    private Long id;
    private Long templateId;
    private Long startUserId;
    private Integer flowInstanceState;
    private String flowInstanceName;
}