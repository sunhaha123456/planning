package com.rose.repository;

import com.rose.data.entity.TbCompanyPaidSalary;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Date;

public interface CompanyPaidSalaryRepository extends CrudRepository<TbCompanyPaidSalary, Long> {

    @Query(value = "select * from tb_company_paid_salary where id = :id and del_flag = 0", nativeQuery = true)
    TbCompanyPaidSalary findOne(@Param(value = "id") Long id);

    @Modifying
    @Query(value = "update tb_company_paid_salary set del_flag = 1, last_modified = :lastModified where id = :id", nativeQuery = true)
    int updateDelFlag(@Param(value = "id") Long id, @Param(value = "lastModified") Date lastModified);
}