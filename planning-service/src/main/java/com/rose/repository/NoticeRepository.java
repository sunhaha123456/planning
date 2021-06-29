package com.rose.repository;

import com.rose.data.entity.TbNotice;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface NoticeRepository extends CrudRepository<TbNotice, Long> {

    @Query(value = "select * from tb_notice where id = :id", nativeQuery = true)
    TbNotice findOne(@Param(value = "id") Long id);
}