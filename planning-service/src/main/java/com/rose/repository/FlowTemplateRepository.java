package com.rose.repository;

import com.rose.data.entity.TbFlowTemplate;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface FlowTemplateRepository extends CrudRepository<TbFlowTemplate, Long> {

    @Query(value = "select * from tb_flow_template order by id asc", nativeQuery = true)
    List<TbFlowTemplate> listAll();

}