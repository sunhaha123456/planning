package com.rose.repository.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.base.PageUtil;
import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbEmployer;
import com.rose.data.entity.TbEmployerAdjustHistory;
import com.rose.repository.EmployerAdjustHistoryRepositoryCustom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class EmployerAdjustHistoryRepositoryCustomImpl extends BaseRepositoryImpl implements EmployerAdjustHistoryRepositoryCustom {

    @Override
    public PageList<TbEmployerAdjustHistory> list(Long employerId, Integer pageNo, Integer pageSize) throws Exception {
        StringBuilder sql = new StringBuilder();
        List<Object> paramList = new ArrayList();
        sql.append(" select a.id, a.create_date createDate, b.user_name operateUserName, a.operate_info operateInfo, ");
        sql.append(" a.entry_company_time entryCompanyTime, a.become_regular_time becomeRegularTime, a.quit_time quitTime, ");
        sql.append(" a.department department, a.position position, a.employer_type employerType, a.on_job_state onJobState, ");
        sql.append(" a.salary_amount salaryAmount, a.subsidy_amount subsidyAmount, a.social_security_amount_personal socialSecurityAmountPersonal, ");
        sql.append(" a.social_security_amount_company socialSecurityAmountCompany, a.accumulation_fund_amount_personal accumulationFundAmountPersonal, ");
        sql.append(" a.accumulation_fund_amount_company accumulationFundAmountCompany, a.income_desc incomeDesc, a.employer_remark employerRemark ");
        sql.append(" from tb_employer_adjust_history a left join tb_sys_user b on a.operate_user_id = b.id ");
        sql.append(" where a.employer_id = ? ");
        paramList.add(employerId);
        return queryPage(sql.toString(), TbEmployerAdjustHistory.class, new PageUtil(pageNo, pageSize), null, paramList.toArray());
    }
}