package com.rose.repository;

import com.rose.data.entity.TbFlowTemplateNode;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FlowTemplateNodeRepository extends CrudRepository<TbFlowTemplateNode, Long> {

    @Query(value = "select * from tb_flow_template_node where template_id = :templateId and pid = :pid order by id asc", nativeQuery = true)
    List<TbFlowTemplateNode> listByTemplateIdAndPid(@Param(value = "templateId") Long templateId, @Param(value = "pid") Long pid);

    @Query(value = "select * from tb_flow_template_node where id = :id and template_id = :templateId", nativeQuery = true)
    TbFlowTemplateNode findByIdAndTemplateId(@Param(value = "id") Long id, @Param(value = "templateId") Long templateId);

    @Modifying
    @Query(value = "delete from tb_flow_template_node where template_id = :templateId", nativeQuery = true)
    int deleteByTemplateId(@Param(value = "templateId") Long templateId);

    @Modifying
    @Query(value = "delete from tb_flow_template_node where id = :id or total_code like :childTotalCode", nativeQuery = true)
    int deleteNodeAndNodeChild(@Param(value = "id") Long id, @Param(value = "childTotalCode") String childTotalCode);

    @Query(value = "select * from tb_flow_template_node where pid in :pidList order by id asc", nativeQuery = true)
    List<TbFlowTemplateNode> listByPid(@Param(value = "pidList") List<Long> pidList);
}