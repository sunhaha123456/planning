package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_system_setting")
public class TbSystemSetting extends BaseDataIdLong {

    @Column(name = "system_key", columnDefinition = "VARCHAR(255) COMMENT '项'")
    private String systemKey;

    @Column(name = "system_value", columnDefinition = "VARCHAR(255) COMMENT '值'")
    private String systemValue;

    @Column(name = "system_desc", columnDefinition = "VARCHAR(255) COMMENT '描述'")
    private String systemDesc;
}