package com.rose.repository;

import com.rose.data.entity.TbFlowInstance;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FlowInstanceRepository extends CrudRepository<TbFlowInstance, Long> {

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
    @Query(value = "update tb_flow_instance set handing_instance_node_ids = :handingInstanceNodeIds where id = :id and state = :oldState", nativeQuery = true)
    int updateHandingInstanceNodeIds(@Param(value = "id") Long id, @Param(value = "handingInstanceNodeIds") String handingInstanceNodeIds, @Param(value = "oldState") Integer oldState);
}