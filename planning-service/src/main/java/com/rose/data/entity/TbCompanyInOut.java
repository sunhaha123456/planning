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
 * 描述：公司收支详情
 * @author sunpeng
 */
@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_company_in_out")
public class TbCompanyInOut extends BaseDataIdLongDelFlag implements Serializable {

    @Column(name = "entry_user_id", columnDefinition = "BIGINT COMMENT '录入用户id'")
    private Long entryUserId;

    @Transient
    private String entryUserName;

    @Column(name = "entry_user_remark", columnDefinition = "varchar(500) COMMENT '录入用户备注'")
    private String entryUserRemark;

    @Column(name = "entry_name", columnDefinition = "varchar(255) COMMENT '录入项名称'")
    private String entryName;

    @Column(name = "entry_desc", columnDefinition = "varchar(500) COMMENT '录入项描述'")
    private String entryDesc;

    @Column(name = "entry_amount", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '录入项金额'")
    private BigDecimal entryAmount;

    // 录入项类别 0支出 1营收 2利润
    @Column(name = "entry_type", columnDefinition = "TINYINT DEFAULT 0 COMMENT '录入项类别'")
    private Integer entryType;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "entry_happen_date", columnDefinition="datetime COMMENT '录入项发生时间'")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date entryHappenDate;
}