package com.rose.repository;

import com.rose.common.data.base.PageList;
import com.rose.common.repository.BaseRepository;
import com.rose.data.entity.TbCompanyPaidSalary;

import java.util.Date;

public interface CompanyPaidSalaryRepositoryCustom extends BaseRepository {

    PageList<TbCompanyPaidSalary> list(String employerName, String phone, String idCardNo, Date salaryDate, Integer pageNo, Integer pageSize) throws Exception;
}