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

    @Column(name = "form_id", columnDefinition = "BIGINT COMMENT '表单id'")
    private Long formId;

    // 0行 1列
    @Column(name = "layout_type", columnDefinition = "TINYINT DEFAULT 0 COMMENT '布局类型'")
    private Integer layoutType;

    // 维度id，注意：不是维度成员id
    @Column(name = "dim_id", columnDefinition = "BIGINT COMMENT '维度id'")
    private Long dimId;

    // 维度成员表达式  维度成员id1,维度成员id2
    @Column(name = "dim_member_expression", columnDefinition = "text COMMENT '维度成员表达式'")
    private String dimMemberExpression;
}