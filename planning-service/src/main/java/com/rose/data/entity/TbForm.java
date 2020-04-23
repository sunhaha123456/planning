package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 描述：表单主体对象表
 * @author sunpeng
 */
@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_form")
public class TbForm extends BaseDataIdLong {

    @Column(name = "formName", columnDefinition = "VARCHAR(255) COMMENT '表单名'")
    private String formName;
}