package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_form_data")
public class TbFormData extends BaseDataIdLong {

    @Column(name = "form_id", columnDefinition = "BIGINT COMMENT '表单id'")
    private Long formId;

    @Column(name = "x_index", columnDefinition = "INT DEFAULT 0 COMMENT 'x坐标'")
    private Integer xIndex;

    @Column(name = "y_index", columnDefinition = "INT DEFAULT 0 COMMENT 'y坐标'")
    private Integer yIndex;

    @Column(name = "cell_content", columnDefinition = "VARCHAR(255) COMMENT '单元格内容'")
    private String cellContent;

    // 是否是聚集单元格 0否 1是
    @Column(name = "gather_flag", columnDefinition = "TINYINT DEFAULT 0 COMMENT '是否是聚集单元格'")
    private Integer gatherFlag;

    @Column(name = "gather_expression", columnDefinition = "VARCHAR(1000) COMMENT '聚集达式'")
    private String gatherExpression;
}