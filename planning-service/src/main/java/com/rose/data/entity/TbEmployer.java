package com.rose.data.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rose.common.data.base.BaseDataIdLongDelFlag;
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
@Table(name = "tb_employer")
public class TbEmployer extends BaseDataIdLongDelFlag implements Serializable {

    // 姓名
    @ExcelImport(group = "userImport")
    @Column(name = "employer_name", columnDefinition = "varchar(255) COMMENT '姓名'")
    private String employerName;

    // 性别   0男  1女
    @Column(name = "gender", columnDefinition = "TINYINT DEFAULT 0 COMMENT '性别'")
    private Integer gender;

    @ExcelImport(group = {"userImport"}) 
    @Transient
    private String genderStr;

    @ExcelImport(group = {"userImport"}) 
    @Column(name = "id_card_no", columnDefinition = "varchar(255) COMMENT '身份证号码'")
    private String idCardNo;

    @ExcelImport(group = {"userImport"}) 
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "birthday_date", columnDefinition="datetime COMMENT '生日'")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date birthdayDate;

    // 手机号
    @ExcelImport(group = {"userImport"}) 
    @Column(name = "phone", columnDefinition = "varchar(255) COMMENT '手机号'")
    private String phone;

    @ExcelImport(group = {"userImport"}) 
    @Column(name = "native_place", columnDefinition = "varchar(255) COMMENT '籍贯'")
    private String nativePlace;

    @ExcelImport(group = {"userImport"}) 
    @Column(name = "now_place", columnDefinition = "varchar(255) COMMENT '现住址'")
    private String nowPlace;

    @ExcelImport(group = {"userImport"}) 
    @Column(name = "department", columnDefinition = "varchar(255) COMMENT '部门'")
    private String department;

    // 职位
    @ExcelImport(group = {"userImport"}) 
    @Column(name = "position", columnDefinition = "varchar(255) COMMENT '职位'")
    private String position;

    // 员工类别     0正式员工   1试用期员工  2实习期员工  3临时雇员
    @Column(name = "employer_type", columnDefinition = "TINYINT DEFAULT 0 COMMENT '员工类别'")
    private Integer employerType;

    @ExcelImport(group = {"userImport"}) 
    @Transient
    private String employerTypeStr;

    // 在职状态     0在职  1离职中  2已离职
    @Column(name = "on_job_state", columnDefinition = "TINYINT DEFAULT 0 COMMENT '在职状态'")
    private Integer onJobState;

    @ExcelImport(group = {"userImport"}) 
    @Transient
    private String onJobStateStr;

    @ExcelImport(group = {"userImport"}) 
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "entry_company_time", columnDefinition="datetime COMMENT '入职时间'")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date entryCompanyTime;

    // 最高学历
    // 0小学 1初中 2高中 3中转 4高职 5大专 6本科 7硕士研究生 8博士研究生
    @Column(name = "highest_education ", columnDefinition = "TINYINT DEFAULT 0 COMMENT '最高学历'")
    private Integer highestEducation;

    @ExcelImport(group = {"userImport"}) 
    private String highestEducationStr;

    // 毕业院校
    @ExcelImport(group = {"userImport"}) 
    @Column(name = "graduated_school", columnDefinition = "varchar(255) COMMENT '毕业院校'")
    private String graduatedSchool;

    // 毕业时间
    @ExcelImport(group = {"userImport"}) 
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "graduated_date", columnDefinition="datetime COMMENT '毕业时间'")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date graduatedDate;

    // 紧急联系人
    @ExcelImport(group = {"userImport"}) 
    @Column(name = "emergency_contact_people", columnDefinition = "varchar(255) COMMENT '紧急联系人'")
    private String emergencyContactPeople;

    // 紧急联系人手机号
    @ExcelImport(group = {"userImport"}) 
    @Column(name = "emergency_contact_phone", columnDefinition = "varchar(255) COMMENT '紧急联系人手机号'")
    private String emergencyContactPeoplePhone;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "entry_time", columnDefinition="datetime COMMENT '转正日期'")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date becomeRegularTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "quit_time", columnDefinition="datetime COMMENT '离职时间'")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date quitTime;

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

    @ExcelImport(group = {"userImport"})
    @Column(name = "employer_remark", columnDefinition = "varchar(600) COMMENT '备注'")
    private String employerRemark;
}