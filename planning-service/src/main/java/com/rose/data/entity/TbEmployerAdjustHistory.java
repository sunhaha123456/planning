package com.rose.data.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rose.common.data.base.BaseDataIdLong;
import com.rose.common.util.excel.ExcelImport;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_employer_adjust_history")
public class TbEmployerAdjustHistory extends BaseDataIdLong implements Serializable {

    @Column(name = "operate_user_id", columnDefinition = "BIGINT COMMENT '操作用户id'")
    private Long operateUserId;

    @Transient
    private String operateUserName;

    @Column(name = "operate_info", columnDefinition = "VARCHAR(255) COMMENT '操作信息'")
    private String operateInfo;

    @Column(name = "employer_id", columnDefinition = "BIGINT COMMENT '员工id'")
    private Long employerId;

    @ExcelImport(group = {"userImport"})
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "entry_company_time", columnDefinition="datetime COMMENT '入职时间'")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date entryCompanyTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "become_regular_time", columnDefinition="datetime COMMENT '转正日期'")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date becomeRegularTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "quit_time", columnDefinition="datetime COMMENT '离职时间'")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date quitTime;

    @Column(name = "department", columnDefinition = "varchar(255) COMMENT '部门'")
    private String department;

    @Column(name = "position", columnDefinition = "varchar(255) COMMENT '职位'")
    private String position;

    // 员工类别     0正式员工   1试用期员工  2实习期员工  3临时雇员
    @Column(name = "employer_type", columnDefinition = "TINYINT DEFAULT 0 COMMENT '员工类别'")
    private Integer employerType;

    @Transient
    private String employerTypeStr;

    // 在职状态     0在职  1离职中  2已离职
    @Column(name = "on_job_state", columnDefinition = "TINYINT DEFAULT 0 COMMENT '在职状态'")
    private Integer onJobState;

    @Transient
    private String onJobStateStr;

    @Column(name = "salary_amount", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '工资金额'")
    private BigDecimal salaryAmount;

    @Column(name = "subsidy_amount", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '补贴'")
    private BigDecimal subsidyAmount;

    @Column(name = "social_security_amount_personal", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '社保金额个人部分'")
    private BigDecimal socialSecurityAmountPersonal;

    @Column(name = "social_security_amount_company", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '社保金额企业部分'")
    private BigDecimal socialSecurityAmountCompany;

    @Column(name = "accumulation_fund_amount_personal", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '公积金金额个人部分'")
    private BigDecimal accumulationFundAmountPersonal;

    @Column(name = "accumulation_fund_amount_company", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '公积金金额企业部分'")
    private BigDecimal accumulationFundAmountCompany;

    @Column(name = "income_desc", columnDefinition = "varchar(500) COMMENT '补贴描述'")
    private String incomeDesc;

    @Column(name = "employer_remark", columnDefinition = "varchar(600) COMMENT '备注'")
    private String employerRemark;
}