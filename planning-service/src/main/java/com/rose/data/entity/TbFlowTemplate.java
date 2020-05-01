package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_flow_template")
public class TbFlowTemplate extends BaseDataIdLong {

    @Column(name = "template_name", columnDefinition = "VARCHAR(255) COMMENT '模板名称'")
    private String templateName;

    // 模板状态 0：正常 1：冻结
    @Column(name = "state", columnDefinition = "TINYINT DEFAULT 0 COMMENT '模板状态'")
    private Integer state;
}