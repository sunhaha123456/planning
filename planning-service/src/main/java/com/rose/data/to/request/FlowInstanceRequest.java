package com.rose.data.to.request;

import com.rose.data.base.PageParam;
import lombok.Data;

@Data
public class FlowInstanceRequest extends PageParam {
    private Long templateId;
    private String flowInstanceName;
    private Long startUserId; // 启动流程的用户id，其中 0：表示查全部
}