package com.rose.data.to.vo;

import com.rose.common.util.excel.ExcelExport;
import com.rose.common.util.excel.ExcelImport;
import lombok.Data;

import java.io.Serializable;

/**
 * 描述：工资模板 vo
 * @author sunpeng
 */
@Data
public class EmployerSalaryTemplateExportVo implements Serializable {

    @ExcelImport
    @ExcelExport(name = "工资日期")
    private String salaryDate;

    @ExcelImport
    @ExcelExport(name = "唯一标志")
    private String id;

    @ExcelImport
    @ExcelExport(name = "姓名")
    private String employerName;

    @ExcelImport
    @ExcelExport(name = "性别")
    private String gender;

    @ExcelImport
    @ExcelExport(name = "手机号")
    private String phone;

    @ExcelImport
    @ExcelExport(name = "部门")
    private String department;

    @ExcelImport
    @ExcelExport(name = "职位")
    private String position;

    @ExcelImport
    @ExcelExport(name = "总支付金额")
    private String totalPaidAmount;

    @ExcelImport
    @ExcelExport(name = "职位工资金额")
    private String salaryAmount;

    @ExcelImport
    @ExcelExport(name = "职位补贴金额")
    private String subsidyAmount;

    @ExcelImport
    @ExcelExport(name = "支付工资金额")
    private String paidSalaryAmount;

    @ExcelImport
    @ExcelExport(name = "支付补贴金额")
    private String paidSubsidyAmount;

    @ExcelImport
    @ExcelExport(name = "社保个人承担金额")
    private String socialPersonalPaid;

    @ExcelImport
    @ExcelExport(name = "社保企业承担金额")
    private String socialCompanyPaid;

    @ExcelImport
    @ExcelExport(name = "公积金个人承担金额")
    private String accumulationPersonalPaid;

    @ExcelImport
    @ExcelExport(name = "公积金企业承担金额")
    private String accumulatioCompanyPaid;

    @ExcelImport
    @ExcelExport(name = "扣款金额")
    private String deductionAmount;

    @ExcelImport
    @ExcelExport(name = "扣款原因")
    private String deductionRemark;

    @ExcelImport
    @ExcelExport(name = "备注")
    private String entryUserRemark;
}