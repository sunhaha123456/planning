package com.rose.repository;

import com.rose.data.entity.TbFlowTemplateNode;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FlowTemplateNodeRepository extends CrudRepository<TbFlowTemplateNode, Long> {

    @Query(value = "select * from tb_flow_template_node where id = :id", nativeQuery = true)
    TbFlowTemplateNode findOne(@Param(value = "id") Long id);

    @Query(value = "select * from tb_flow_template_node where template_id = :templateId and pid = :pid order by id asc", nativeQuery = true)
    List<TbFlowTemplateNode> listByTemplateIdAndPid(@Param(value = "templateId") Long templateId, @Param(value = "pid") Long pid);

    @Query(value = "select * from tb_flow_template_node where id = :id and template_id = :templateId", nativeQuery = true)
    TbFlowTemplateNode findByIdAndTemplateId(@Param(value = "id") Long id, @Param(value = "templateId") Long templateId);

    @Modifying
    @Query(value = "delete from tb_flow_template_node where template_id = :templateId", nativeQuery = true)
    int deleteByTemplateId(@Param(value = "templateId") Long templateId);

    @Query(value = "select id from tb_flow_template_node where id = :id or total_code like :totalCode order by id asc", nativeQuery = true)
    List<Long> listNodeAndChildId(@Param(value = "id") Long id, @Param(value = "totalCode") String totalCode);

    @Query(value = "select * from tb_flow_template_node where pid in :pidList order by id asc", nativeQuery = true)
    List<TbFlowTemplateNode> listByPid(@Param(value = "pidList") List<Long> pidList);

    @Query(value = "select * from tb_flow_template_node where template_id = :templateId and node_name = :nodeName order by id asc", nativeQuery = true)
    List<TbFlowTemplateNode> listByTemplateIdAndNodeName(@Param(value = "templateId") Long templateId, @Param(value = "nodeName") String nodeName);

    @Query(value = "select * from tb_flow_template_node where template_id = :templateId and node_name = :nodeName and id != :id order by id asc", nativeQuery = true)
    List<TbFlowTemplateNode> listByTemplateIdAndNodeName(@Param(value = "templateId") Long templateId, @Param(value = "nodeName") String nodeName, @Param(value = "id") Long id);

    @Query(value = "select * from tb_flow_template_node where template_id = :templateId order by id asc", nativeQuery = true)
    List<TbFlowTemplateNode> listByTemplateId(@Param(value = "templateId") Long templateId);

    @Query(value = "select count(1) from tb_flow_template_node where template_id = :templateId", nativeQuery = true)
    long countByTemplateId(@Param(value = "templateId") Long templateId);

    @Modifying
    @Query(value = "delete from tb_flow_template_node where id in :idList", nativeQuery = true)
    int deleteByIdList(@Param(value = "idList") List<Long> idList);
}