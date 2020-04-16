package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_flow_template_node_form")
public class TbFlowTemplateNodeForm extends BaseDataIdLong {

    @Column(name = "template_id", columnDefinition = "BIGINT COMMENT '模板id'")
    private Long templateId;

    @Column(name = "template_node_id", columnDefinition = "BIGINT COMMENT '模板节点id'")
    private Long templateNodeId;

    @Column(name = "form_id", columnDefinition = "BIGINT COMMENT '表单id'")
    private Long formId;
}