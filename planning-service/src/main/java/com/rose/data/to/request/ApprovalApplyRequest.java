package com.rose.data.to.request;

import lombok.Data;

@Data
public class ApprovalApplyRequest {
    private Long id; // instanceId
    private Long userTaskId;
    // 审批类型 0拒绝 1同意
    private Integer approvalApplyOperateType;
    private String approvalApplyContent;
}