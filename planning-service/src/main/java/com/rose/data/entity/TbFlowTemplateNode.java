package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_flow_template_node")
public class TbFlowTemplateNode extends BaseDataIdLong {

    @Column(name = "node_name", columnDefinition = "VARCHAR(255) COMMENT '节点名称'")
    private String nodeName;

    @Column(name = "template_id", columnDefinition = "BIGINT COMMENT '模板id'")
    private Long templateId;

    @Column(name = "pid", columnDefinition = "BIGINT COMMENT '父节点id'")
    private Long pid;

    // 第一层节点：1，依次类推
    @Column(name = "node_level", columnDefinition = "INT DEFAULT 1 COMMENT '节点级别'")
    private Integer nodeLevel;

    // totalcode：parentNodeId1,parentNodeId2,parentNodeId3
    @Column(name = "total_code", columnDefinition = "VARCHAR(1000) COMMENT '节点编码'")
    private String totalCode;

    @Column(name = "instruction", columnDefinition = "VARCHAR(255) COMMENT '说明'")
    private String instruction;

    // 节点类型 0编制节点 1审批节点
    @Column(name = "node_type", columnDefinition = "TINYINT DEFAULT 0 COMMENT '节点类型'")
    private Integer nodeType;

    // 执行方式 0抢占 1会签
    @Column(name = "operate_type", columnDefinition = "TINYINT DEFAULT 0 COMMENT '执行方式'")
    private Integer operateType;
}