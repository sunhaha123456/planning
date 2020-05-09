package com.rose.repository;

import com.rose.data.entity.TbFlowTemplateNodeUserTask;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FlowTemplateNodeUserTaskRepository extends CrudRepository<TbFlowTemplateNodeUserTask, Long> {
    @Modifying
    @Query(value = "delete from tb_flow_template_node_user_task where template_id = :templateId", nativeQuery = true)
    int deleteByTmeplateId(@Param(value = "templateId") Long templateId);

    @Modifying
    @Query(value = "delete from tb_flow_template_node_user_task where template_id = :templateId and template_node_id in :templateNodeIdList", nativeQuery = true)
    int deleteByTmeplateIdAndNodeIdList(@Param(value = "templateId") Long templateId, @Param(value = "templateNodeIdList") List<Long> templateNodeIdList);
}