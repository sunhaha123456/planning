package com.rose.repository;

import com.rose.data.entity.TbEmployerAdjustHistory;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface EmployerAdjustHistoryRepository extends CrudRepository<TbEmployerAdjustHistory, Long> {

    @Query(value = "select * from tb_employer_adjust_history where id = :id", nativeQuery = true)
    TbEmployerAdjustHistory findOne(@Param(value = "id") Long id);
}