package com.rose.repository;

import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbFlowInstanceOperateHistory;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FlowInstanceRepository extends CrudRepository<TbFlowInstance, Long> {

    @Query(value = "select * from tb_flow_instance where id = :id", nativeQuery = true)
    TbFlowInstance findOne(@Param(value = "id") Long id);

    @Query(value = "select count(1) from tb_flow_instance where template_id = :templateId", nativeQuery = true)
    long countByTemplateId(@Param(value = "templateId") Long templateId);

    @Query(value = "select * from tb_flow_instance where template_id = :templateId order by id asc", nativeQuery = true)
    List<TbFlowInstance> listByTemplateId(@Param(value = "templateId") Long templateId);

    @Modifying
    @Query(value = "update tb_flow_instance set state = :newState where id = :id and state = :oldState", nativeQuery = true)
    int updateState(@Param(value = "id") Long id, @Param(value = "newState") Integer newState, @Param(value = "oldState") Integer oldState);

    @Modifying
    @Query(value = "delete from tb_flow_instance where id = :id and state = :state", nativeQuery = true)
    int deleteByIdAndState(@Param(value = "id") Long id, @Param(value = "state") Integer state);

    @Modifying
    @Query(value = "update tb_flow_instance set handing_instance_node_ids = :newHandingInstanceNodeIds, state = :newState where id = :id and handing_instance_node_ids = :oldHandingInstanceNodeIds and state = :oldState", nativeQuery = true)
    int updateHandingInstanceNodeIdsAndState(@Param(value = "id") Long id, @Param(value = "newHandingInstanceNodeIds") String newHandingInstanceNodeIds, @Param(value = "newState") Integer newState, @Param(value = "oldHandingInstanceNodeIds") String oldHandingInstanceNodeIds, @Param(value = "oldState") Integer oldState);

    @Modifying
    @Query(value = "update tb_flow_instance set handing_instance_node_ids = :newHandingInstanceNodeIds where id = :id and handing_instance_node_ids = :oldHandingInstanceNodeIds and state = :oldState", nativeQuery = true)
    int updateHandingInstanceNodeIds(@Param(value = "id") Long id, @Param(value = "newHandingInstanceNodeIds") String newHandingInstanceNodeIds, @Param(value = "oldHandingInstanceNodeIds") String oldHandingInstanceNodeIds, @Param(value = "oldState") Integer oldState);
}