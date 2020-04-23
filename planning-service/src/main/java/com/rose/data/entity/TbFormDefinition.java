package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_form_definition")
public class TbFormDefinition extends BaseDataIdLong {

    @Column(name = "formName", columnDefinition = "VARCHAR(255) COMMENT '表单名'")
    private String formName;

    @Column(name = "row_expression", columnDefinition = "VARCHAR(1000) COMMENT '行表达式'")
    private String rowExpression;

    @Column(name = "column_expression", columnDefinition = "VARCHAR(1000) COMMENT '列表达式'")
    private String columnExpression;
}