package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLongDelFlag;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_employer_adjust_history")
public class TbEmployerAdjustHistory extends BaseDataIdLongDelFlag implements Serializable {

    @Column(name = "employer_id", columnDefinition = "BIGINT COMMENT '员工id'")
    private Long employerId;

    @Column(name = "operate_user_id", columnDefinition = "BIGINT COMMENT '操作用户id'")
    private Long operateUserId;

    @Column(name = "operate_info", columnDefinition = "VARCHAR(600) COMMENT '操作信息'")
    private String operateInfo;
}