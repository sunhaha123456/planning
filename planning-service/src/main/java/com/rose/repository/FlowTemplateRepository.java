package com.rose.repository;

import com.rose.data.entity.TbFlowTemplate;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FlowTemplateRepository extends CrudRepository<TbFlowTemplate, Long> {

    @Query(value = "select * from tb_flow_template where id = :id", nativeQuery = true)
    TbFlowTemplate findOne(@Param(value = "id") Long id);

    @Query(value = "select * from tb_flow_template where template_name = :templateName", nativeQuery = true)
    TbFlowTemplate findByTemplateName(@Param(value = "templateName") String templateName);

    @Query(value = "select * from tb_flow_template order by id asc", nativeQuery = true)
    List<TbFlowTemplate> listAll();

    @Query(value = "select * from tb_flow_template where instr(template_name, :templateName) > 0 order by id asc", nativeQuery = true)
    List<TbFlowTemplate> listByName(@Param(value = "templateName") String templateName);

    @Query(value = "select * from tb_flow_template where instr(template_name, :templateName) > 0 and status = :status order by id asc", nativeQuery = true)
    List<TbFlowTemplate> listByNameAndStatus(@Param(value = "templateName") String templateName, @Param(value = "status") Integer status);

    @Modifying
    @Query(value = "update tb_flow_template set status = :newStatus where id = :id and status = :oldStatus", nativeQuery = true)
    int updateStatus(@Param(value = "id") Long id, @Param(value = "newStatus") Integer newStatus, @Param(value = "oldStatus") Integer oldStatus);
}