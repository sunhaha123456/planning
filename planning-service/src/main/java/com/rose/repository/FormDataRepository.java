package com.rose.repository;

import com.rose.data.entity.TbFormData;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FormDataRepository extends CrudRepository<TbFormData, Long> {
    @Modifying
    @Query(value = "delete from tb_form_data where form_id = :formId and row_dim_id in :rowDimIdList", nativeQuery = true)
    int deleteByRowDimId(@Param(value = "formId") Long formId, @Param(value = "rowDimIdList") List<Long> rowDimIdList);

    @Modifying
    @Query(value = "delete from tb_form_data where form_id = :formId and col_dim_id in :colDimIdList", nativeQuery = true)
    int deleteByColDimId(@Param(value = "formId") Long formId, @Param(value = "colDimIdList") List<Long> colDimIdList);
}