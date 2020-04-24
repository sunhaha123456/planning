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
@Table(name = "tb_dimension")
public class TbDimension extends BaseDataIdLong {

    // 表单id：表示该维度是属于某表单
    @Column(name = "form_id", columnDefinition = "BIGINT COMMENT '表单id'")
    private Long formId;

    @Column(name = "dimension_name", columnDefinition = "VARCHAR(255) COMMENT '名称'")
    private String dimensionName;

    // easyui中的菜单名称
    @Transient
    private String text;

    // 是否打开 open 打开 closed 关闭
    @Transient
    private String state;

    @Transient
    private List<TbDimension> children;

    // 维度深度
    // 从0 开始，0：维度   1：第一层维度成员
    @Column(name = "dimension_level", columnDefinition = "INT DEFAULT 0 COMMENT '维度深度'")
    private Integer dimensionLevel;

    // 父级id     维度的父级id：0
    @Column(name = "pid", columnDefinition = "BIGINT DEFAULT 0 COMMENT '父级id'")
    private Long pid;

    // 数据类型 0聚集 1数值 2文本
    // 维度成员的数据类型用0 代替
    @Column(name = "data_type", columnDefinition = "TINYINT DEFAULT 0 COMMENT '维度类型'")
    private Integer dataType;

    // 编码   维度编码是idself，维度成员编码：id1,id2,idself
    @Column(name = "total_code", columnDefinition = "VARCHAR(1000) COMMENT '编码'")
    private String totalCode;

    // 0新增维度 1新增维度成员 2编辑
    @Transient
    private Integer saveType;
}