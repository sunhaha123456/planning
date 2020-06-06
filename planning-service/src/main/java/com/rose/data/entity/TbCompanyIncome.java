package com.rose.data.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rose.common.data.base.BaseDataIdLongDelFlag;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 描述：公司营业收入详情
 * @author sunpeng
 */
@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_company_income")
public class TbCompanyIncome extends BaseDataIdLongDelFlag implements Serializable {

    @Column(name = "entry_user_id", columnDefinition = "BIGINT COMMENT '录入用户id'")
    private Long entryUserId;

    @Column(name = "entry_user_remark", columnDefinition = "varchar(500) COMMENT '录入用户备注'")
    private String entryUserRemark;

    @Column(name = "income_name", columnDefinition = "varchar(255) COMMENT '收入项名称'")
    private String incomeName;

    @Column(name = "income_desc", columnDefinition = "varchar(255) COMMENT '收入项描述'")
    private String incomeDesc;

    @Column(name = "income_amount", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '收入金额'")
    private BigDecimal incomeAmount;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "income_date", columnDefinition="datetime COMMENT '收入时间'")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date incomeDate;
}