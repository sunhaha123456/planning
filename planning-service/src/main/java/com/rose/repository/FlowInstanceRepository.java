package com.rose.repository;

import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbFlowTemplate;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FlowInstanceRepository extends CrudRepository<TbFlowInstance, Long> {

    @Query(value = "select count(1) from tb_flow_instance where template_id = :templateId", nativeQuery = true)
    long countByTemplateId(@Param(value = "templateId") Long templateId);

    @Query(value = "select * from tb_flow_instance where template_id = :templateId order by id asc", nativeQuery = true)
    List<TbFlowInstance> listByTemplateId(@Param(value = "templateId") Long templateId);
}