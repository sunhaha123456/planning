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
 * 描述：公司支出详情
 * @author sunpeng
 */
@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_company_paid")
public class TbCompanyPaid extends BaseDataIdLongDelFlag implements Serializable {

    @Column(name = "entry_user_id", columnDefinition = "BIGINT COMMENT '录入用户id'")
    private Long entryUserId;

    @Column(name = "entry_user_remark", columnDefinition = "varchar(500) COMMENT '录入用户备注'")
    private String entryUserRemark;

    @Column(name = "paid_name", columnDefinition = "varchar(255) COMMENT '支出项名称'")
    private String paidName;

    @Column(name = "paid_desc", columnDefinition = "varchar(255) COMMENT '支出项描述'")
    private String paidDesc;

    @Column(name = "paid_amount", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '支出金额'")
    private BigDecimal paidAmount;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "paid_date", columnDefinition="datetime COMMENT '支付时间'")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date paidDate;
}