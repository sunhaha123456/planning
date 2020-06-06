package com.rose.service;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbCompanyPaidSalary;
import com.rose.data.to.request.EmployerSalaryPaidSearchRequest;

/**
 * 描述：employer salary paid service
 * @author sunpeng
 */
public interface EmployerSalaryPaidService {

    PageList<TbCompanyPaidSalary> search(EmployerSalaryPaidSearchRequest param) throws Exception;

    /**
     * 功能：获取详情
     * @param id
     * @return
     */
    TbCompanyPaidSalary getEmployer(Long id);

    void delete(Long id);
}