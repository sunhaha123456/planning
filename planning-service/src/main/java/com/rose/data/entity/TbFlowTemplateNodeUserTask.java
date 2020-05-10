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
@Table(name = "tb_flow_template_node_user_task")
public class TbFlowTemplateNodeUserTask extends BaseDataIdLong {

    @Column(name = "template_id", columnDefinition = "BIGINT COMMENT '模板id'")
    private Long templateId;

    @Column(name = "template_node_id", columnDefinition = "BIGINT COMMENT '模板节点id'")
    private Long templateNodeId;

    @Column(name = "user_id", columnDefinition = "BIGINT COMMENT '用户id'")
    private Long userId;

    @Transient
    private String loginName;

    @Transient
    private String userName;
}