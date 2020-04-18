package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_dimension")
public class TbDimension extends BaseDataIdLong {

    @Column(name = "dimension_name", columnDefinition = "VARCHAR(255) COMMENT '流程名称'")
    private String dimensionName;

    // 是否是维度成员 0维度 1维度成员
    @Column(name = "dimension_member_flag", columnDefinition = "TINYINT DEFAULT 0 COMMENT '是否是维度成员'")
    private Integer dimensionMemberFlag;

    // 维度成员数据类型 0数值 1聚集 2文本
    @Column(name = "dimension_member_data_type", columnDefinition = "TINYINT DEFAULT 0 COMMENT '维度类型'")
    private Integer dimensionMemberDataType;
}