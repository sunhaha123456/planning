package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_flow_instance_node_form")
public class TbFlowInstanceNodeForm extends BaseDataIdLong {

    @Column(name = "instance_id", columnDefinition = "BIGINT COMMENT '流程id'")
    private Long instanceId;

    @Column(name = "instance_node_id", columnDefinition = "BIGINT COMMENT '流程节点id'")
    private Long instanceNodeId;

    @Column(name = "form_id", columnDefinition = "BIGINT COMMENT '表单id'")
    private Long formId;
}