package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_flow_instance_user_task")
public class TbFlowInstanceUserTask extends BaseDataIdLong {

    @Column(name = "instance_id", columnDefinition = "BIGINT COMMENT '实例id'")
    private Long instanceId;

    @Column(name = "instance_node_id", columnDefinition = "BIGINT COMMENT '实例节点id'")
    private Long instanceNodeId;

    @Column(name = "user_id", columnDefinition = "BIGINT COMMENT '用户id'")
    private Long userId;

    // 执行状态 0待操作 1不需要操作（已操作 或 该节点已被走过）
    @Column(name = "state", columnDefinition = "TINYINT DEFAULT 0 COMMENT '状态'")
    private Integer state;
}