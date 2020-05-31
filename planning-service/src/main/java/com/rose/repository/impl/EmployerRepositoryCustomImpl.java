package com.rose.repository.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.base.PageUtil;
import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbEmployer;
import com.rose.data.entity.TbSysUser;
import com.rose.repository.EmployerRepositoryCustom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class EmployerRepositoryCustomImpl extends BaseRepositoryImpl implements EmployerRepositoryCustom {

    @Override
    public PageList<TbEmployer> list(String employerName, String phone, Integer employerType, Integer onJobState, Integer pageNo, Integer pageSize) throws Exception {
        StringBuilder sql = new StringBuilder();
        List<Object> paramList = new ArrayList();
        sql.append(" SELECT id, employer_name employerName, gender, phone, position, employer_type employerType, on_job_state onJobState ");
        sql.append(" FROM tb_employer ");
        sql.append(" WHERE del_flag = 0 ");
        if (StringUtil.isNotEmpty(employerName)) {
            sql.append(" AND instr(employer_name, ?) > 0 ");
            paramList.add(employerName);
        }
        if (StringUtil.isNotEmpty(phone)) {
            sql.append(" AND instr(phone, ?) > 0 ");
            paramList.add(phone);
        }
        if (employerType != null) {
            sql.append(" AND employer_type = ? ");
            paramList.add(employerType);
        }
        if (onJobState != null) {
            sql.append(" AND on_job_state = ? ");
            paramList.add(onJobState);
        }
        return queryPage(sql.toString(), TbEmployer.class, new PageUtil(pageNo, pageSize), null, paramList.toArray());
    }
}