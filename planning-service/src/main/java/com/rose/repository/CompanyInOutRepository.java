package com.rose.repository;

import com.rose.data.entity.TbCompanyInOut;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Date;

public interface CompanyInOutRepository extends CrudRepository<TbCompanyInOut, Long> {

    @Query(value = "select * from tb_company_in_out where id = :id and del_flag = 0", nativeQuery = true)
    TbCompanyInOut findOne(@Param(value = "id") Long id);

    @Modifying
    @Query(value = "update tb_company_in_out set del_flag = 1, last_modified = :lastModified where id = :id", nativeQuery = true)
    int updateDelFlag(@Param(value = "id") Long id, @Param(value = "lastModified") Date lastModified);
}