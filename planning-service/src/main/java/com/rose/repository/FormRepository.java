package com.rose.repository;

import com.rose.data.entity.TbForm;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface FormRepository extends CrudRepository<TbForm, Long> {

    @Query(value = "select * from tb_form order by id asc", nativeQuery = true)
    List<TbForm> listAll();
}