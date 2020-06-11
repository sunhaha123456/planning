package com.rose.repository.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.base.PageUtil;
import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbCompanyInOut;
import com.rose.data.to.request.CompanyInOutSearchRequest;
import com.rose.data.to.vo.MonthEntryVo;
import com.rose.repository.CompanyInOutRepositoryCustom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class CompanyInOutRepositoryCustomImpl extends BaseRepositoryImpl implements CompanyInOutRepositoryCustom {

    @Override
    public PageList<TbCompanyInOut> list(CompanyInOutSearchRequest param) throws Exception {
        StringBuilder sql = new StringBuilder();
        List<Object> paramList = new ArrayList();
        sql.append(" select a.id, a.create_date createDate, a.entry_name entryName, a.entry_amount entryAmount, a.entry_type entryType, ");
        sql.append(" a.entry_happen_date entryHappenDate, b.user_name entryUserName ");
        sql.append(" from tb_company_in_out a join tb_sys_user b on a.entry_user_id = b.id and a.del_flag = 0 ");
        if (param.getEntryType() != null) {
            sql.append(" and a.entry_type = ? ");
            paramList.add(param.getEntryType());
        }
        if (param.getStartDate() != null) {
            sql.append(" and a.entry_happen_date >= ? ");
            paramList.add(param.getStartDate());
        }
        if (param.getEndDate() != null) {
            sql.append(" and a.entry_happen_date <= ? ");
            paramList.add(param.getEndDate());
        }
        if (StringUtil.isNotEmpty(param.getChartDate())) {
            sql.append(" and DATE_FORMAT(a.entry_happen_date,'%Y-%m') = ? ");
            paramList.add(param.getChartDate());
        }
        sql.append(" order by a.entry_happen_date desc ");
        return queryPage(sql.toString(), TbCompanyInOut.class, new PageUtil(param.getPage(), param.getRows()), null, paramList.toArray());
    }

    @Override
    public List<MonthEntryVo> listByMonth(String year) throws Exception {
        StringBuilder sql = new StringBuilder();
        List<Object> paramList = new ArrayList();
        sql.append(" select CONCAT(DATE_FORMAT(entry_happen_date# '%m')# entry_type) monthTypeFlag, DATE_FORMAT(entry_happen_date# '%m') month, entry_type type, SUM(entry_amount) amount ");
        sql.append(" from tb_company_in_out ");
        sql.append(" where del_flag = 0 and DATE_FORMAT(entry_happen_date,'%Y') = ? ");
        paramList.add(year);
        sql.append(" GROUP BY DATE_FORMAT(entry_happen_date,'%Y-%m'),entry_type ");
        return queryList(sql.toString(), MonthEntryVo.class, paramList.toArray());
    }
}