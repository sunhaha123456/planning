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
@Table(name = "tb_dimension")
public class TbDimension extends BaseDataIdLong {

    @Column(name = "dimension_name", columnDefinition = "VARCHAR(255) COMMENT '名称'")
    private String dimensionName;

    // easyui中的菜单名称
    @Transient
    private String text;

    // 维度深度
    // 从0 开始，0：维度   1：第一层维度成员
    @Column(name = "dimension_level", columnDefinition = "INT DEFAULT 0 COMMENT '维度深度'")
    private Integer dimensionLevel;

    // 维度成员数据类型 0数值 1聚集 2文本
    @Column(name = "dimension_member_data_type", columnDefinition = "TINYINT DEFAULT 0 COMMENT '维度类型'")
    private Integer dimensionMemberDataType;
}