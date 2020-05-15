package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

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
    @Column(name = "state", columnDefinition = "TINYINT DEFAULT 0 COMMENT '状态'")
    private Integer state;

    @Column(name = "remark_info", columnDefinition = "VARCHAR(500) COMMENT '备注信息'")
    private String remarkInfo;
}