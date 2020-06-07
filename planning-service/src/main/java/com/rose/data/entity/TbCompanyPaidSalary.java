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
 * 描述：公司工资支付详情
 * @author sunpeng
 */
@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_company_paid_salary")
public class TbCompanyPaidSalary extends BaseDataIdLongDelFlag implements Serializable {

    @Column(name = "entry_user_id", columnDefinition = "BIGINT COMMENT '录入用户id'")
    private Long entryUserId;

    @Transient
    private String employerName;

    @Transient
    private String phone;

    @Transient
    private String idCardNo;

    @Column(name = "entry_user_remark", columnDefinition = "varchar(500) COMMENT '录入用户备注'")
    private String entryUserRemark;

    @Column(name = "employer_id", columnDefinition = "BIGINT COMMENT '员工id'")
    private Long employerId;

    @DateTimeFormat(pattern = "yyyy-MM")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "salary_date", columnDefinition="datetime COMMENT '工资日期'")
    @JsonFormat(pattern = "yyyy-MM", timezone = "GMT+8")
    private Date salaryDate;

    @Column(name = "department", columnDefinition = "varchar(255) COMMENT '部门'")
    private String department;

    @Column(name = "position", columnDefinition = "varchar(255) COMMENT '职位'")
    private String position;

    @Column(name = "total_paid_amount", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '总支付金额'")
    private BigDecimal totalPaidAmount;

    @Column(name = "salary_amount", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '职位工资金额'")
    private BigDecimal salaryAmount;

    @Column(name = "subsidy_amount", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '职位补贴金额'")
    private BigDecimal subsidyAmount;

    @Column(name = "paid_salary_amount", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '支付工资金额'")
    private BigDecimal paidSalaryAmount;

    @Column(name = "paid_subsidy_amount", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '支付补贴金额'")
    private BigDecimal paidSubsidyAmount;

    @Column(name = "deduction_amount", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '扣款金额'")
    private BigDecimal deductionAmount;

    @Column(name = "deduction_remark", columnDefinition = "varchar(500) COMMENT '扣款原因'")
    private String deductionRemark;

    @Column(name = "social_personal_paid", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '社保个人承担金额'")
    private BigDecimal socialPersonalPaid;

    @Column(name = "social_company_paid", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '社保企业承担金额'")
    private BigDecimal socialCompanyPaid;

    @Column(name = "accumulation_personal_paid", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '公积金个人承担金额'")
    private BigDecimal accumulationPersonalPaid;

    @Column(name = "accumulation_company_paid", columnDefinition = "decimal(19,2) DEFAULT 0.00 COMMENT '公积金企业承担金额'")
    private BigDecimal accumulatioCompanyPaid;

    @Transient
    private TbEmployer employer;
}