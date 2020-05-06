package com.rose.repository;

import com.rose.data.entity.TbFlowTemplate;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FlowTemplateRepository extends CrudRepository<TbFlowTemplate, Long> {

    @Query(value = "select * from tb_flow_template order by id asc", nativeQuery = true)
    List<TbFlowTemplate> listAll();

    @Modifying
    @Query(value = "update tb_flow_template set status = :newStatus where id = :id and status = :oldStatus", nativeQuery = true)
    int updateStatus(@Param(value = "id") Long id, @Param(value = "newStatus") Integer newStatus, @Param(value = "oldStatus") Integer oldStatus);
}