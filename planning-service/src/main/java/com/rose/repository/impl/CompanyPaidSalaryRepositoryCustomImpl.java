package com.rose.repository.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.base.PageUtil;
import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbCompanyPaidSalary;
import com.rose.repository.CompanyPaidSalaryRepositoryCustom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Repository
public class CompanyPaidSalaryRepositoryCustomImpl extends BaseRepositoryImpl implements CompanyPaidSalaryRepositoryCustom {

    @Override
    public PageList<TbCompanyPaidSalary> list(String employerName, String phone, String idCardNo, Date salaryDate, Integer pageNo, Integer pageSize) throws Exception {
        StringBuilder sql = new StringBuilder();
        List<Object> paramList = new ArrayList();
        sql.append(" select a.id, a.create_date createDate, b.employer_name employerName, b.phone phone, b.id_card_no idCardNo, ");
        sql.append(" a.salary_date salaryDate, a.department department, a.position position, a.total_paid_amount totalPaidAmount, ");
        sql.append(" a.salary_amount salaryAmount, a.subsidy_amount subsidyAmount, a.paid_salary_amount paidSalaryAmount, a.paid_subsidy_amount paidSubsidyAmount, ");
        sql.append(" a.deduction_amount deductionAmount, a.social_personal_paid socialPersonalPaid, a.social_company_paid socialCompanyPaid, ");
        sql.append(" a.accumulation_personal_paid accumulationPersonalPaid, a.accumulation_company_paid accumulatioCompanyPaid ");
        sql.append(" from tb_company_paid_salary a join tb_employer b on a.employer_id = b.id ");
        if (StringUtil.isNotEmpty(employerName)) {
            sql.append(" and instr(b.employer_name, ?) > 0 ");
            paramList.add(employerName);
        }
        if (StringUtil.isNotEmpty(phone)) {
            sql.append(" and instr(b.phone, ?) > 0 ");
            paramList.add(employerName);
        }
        if (StringUtil.isNotEmpty(idCardNo)) {
            sql.append(" and instr(b.id_card_no, ?) > 0 ");
            paramList.add(idCardNo);
        }
        if (salaryDate != null) {
            sql.append(" and a.salary_date = ? ");
            paramList.add(salaryDate);
        }
        sql.append(" join tb_sys_user c on a.entry_user_id = c.id ");
        sql.append(" order by a.salary_date desc ");
        return queryPage(sql.toString(), TbCompanyPaidSalary.class, new PageUtil(pageNo, pageSize), null, paramList.toArray());
    }
}