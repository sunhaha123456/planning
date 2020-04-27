package com.rose.repository;

import com.rose.data.entity.TbForm;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FormRepository extends CrudRepository<TbForm, Long> {

    @Query(value = "select * from tb_form order by id asc", nativeQuery = true)
    List<TbForm> listAll();

    @Modifying
    @Query(value = "update tb_form set form_name = :formName where id = :id", nativeQuery = true)
    int updateFormName(@Param(value = "id") Long id, @Param(value = "formName") String formName);
}