package com.rose.repository;

import com.rose.data.entity.TbFlowTemplateNode;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FlowTemplateNodeRepository extends CrudRepository<TbFlowTemplateNode, Long> {

    @Query(value = "select * from tb_flow_template_node where template_id = templateId and pid = :pid order by id asc", nativeQuery = true)
    List<TbFlowTemplateNode> listByTemplateIdAndPid(@Param(value = "templateId") Long templateId, @Param(value = "pid") Long pid);
}