package com.rose.data.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_flow_instance_node_user_task")
public class TbFlowInstanceNodeUserTask extends BaseDataIdLong {

    @Column(name = "instance_id", columnDefinition = "BIGINT COMMENT '实例id'")
    private Long instanceId;

    @Column(name = "instance_node_id", columnDefinition = "BIGINT COMMENT '实例节点id'")
    private Long instanceNodeId;

    @Column(name = "user_id", columnDefinition = "BIGINT COMMENT '用户id'")
    private Long userId;

    @Transient
    private String loginName;

    @Transient
    private String userName;

    // 执行状态
    // 0待操作（需要操作，但未操作）
    // 1已操作（需要操作，且已操作）
    // 2已被抢占（抢占模式下，需要操作，但被别人抢到操作了）
    // 3未到达（需要操作，但未到达）
    @Column(name = "state", columnDefinition = "TINYINT DEFAULT 0 COMMENT '状态'")
    private Integer state;

    // 审批类型 0不同意 1同意
    @Column(name = "approval_type", columnDefinition = "TINYINT DEFAULT 0 COMMENT '审批类型'")
    private Integer approvalType;

    @Column(name = "approval_content", columnDefinition = "VARCHAR(800) COMMENT '审批内容'")
    private String approvalContent;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "approval_date", columnDefinition="datetime COMMENT '审批时间'")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date approvalDate;
}