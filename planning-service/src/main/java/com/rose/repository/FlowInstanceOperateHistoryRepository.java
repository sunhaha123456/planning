package com.rose.repository;

import com.rose.data.entity.TbFlowInstanceOperateHistory;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface FlowInstanceOperateHistoryRepository extends CrudRepository<TbFlowInstanceOperateHistory, Long> {

    @Query(value = "select * from tb_flow_instance_operate_history where id = :id", nativeQuery = true)
    TbFlowInstanceOperateHistory findOne(@Param(value = "id") Long id);
}