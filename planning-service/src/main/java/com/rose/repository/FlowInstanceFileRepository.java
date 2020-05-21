package com.rose.repository;

import com.rose.data.entity.TbFlowInstanceFile;
import com.rose.data.entity.TbFlowInstanceNode;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FlowInstanceFileRepository extends CrudRepository<TbFlowInstanceFile, Long> {

    @Query(value = "select * from tb_flow_instance_file where instance_id = :instanceId order by id asc", nativeQuery = true)
    List<TbFlowInstanceFile> listByInstanceId(@Param(value = "instanceId") Long instanceId);

    @Modifying
    @Query(value = "delete from tb_flow_instance_file where instance_id = :instanceId", nativeQuery = true)
    int deleteByInstanceId(@Param(value = "instanceId") Long instanceId);
}