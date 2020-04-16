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

    // 0：正常 1：冻结
    @Column(name = "state", columnDefinition = "TINYINT DEFAULT 0 COMMENT '流程模板状态'")
    private Integer state;
}