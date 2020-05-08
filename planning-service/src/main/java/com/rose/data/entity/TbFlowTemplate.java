package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.List;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_flow_template")
public class TbFlowTemplate extends BaseDataIdLong {

    @Column(name = "template_name", columnDefinition = "VARCHAR(255) COMMENT '模板名称'")
    private String templateName;

    // 模板状态 0：正常 1：停用
    @Column(name = "status", columnDefinition = "TINYINT DEFAULT 1 COMMENT '模板状态'")
    private Integer status;

    // easyui中的菜单名称
    @Transient
    private String text;

    // 是否打开 open 打开 closed 关闭
    @Transient
    private String state;

    @Transient
    List<TbFlowTemplateNode> templateNodeList;
}