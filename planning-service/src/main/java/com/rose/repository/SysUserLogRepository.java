package com.rose.repository;

import com.rose.data.entity.TbSysUserLog;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface SysUserLogRepository extends CrudRepository<TbSysUserLog, Long> {

    @Query(value = "select * from tb_sys_user_log where id = :id", nativeQuery = true)
    TbSysUserLog findOne(@Param(value = "id") Long id);
}