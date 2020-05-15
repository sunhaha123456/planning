package com.rose.repository;

import com.rose.data.entity.TbFlowInstanceNode;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FlowInstanceNodeRepository extends CrudRepository<TbFlowInstanceNode, Long> {

    @Modifying
    @Query(value = "delete from tb_flow_instance_node where instance_id = :instanceId", nativeQuery = true)
    int deleteByInstanceId(@Param(value = "instanceId") Long instanceId);

    @Query(value = "select * from tb_flow_instance_node where id = :idList order by id asc", nativeQuery = true)
    List<TbFlowInstanceNode> listByIdList(@Param(value = "idList") List<Long> idList);

    @Query(value = "select * from tb_flow_instance_node where instance_id = :instanceId order by id asc", nativeQuery = true)
    List<TbFlowInstanceNode> listByInstanceId(@Param(value = "instanceId") Long instanceId);
}