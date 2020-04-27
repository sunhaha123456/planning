package com.rose.repository;

import com.rose.data.entity.TbDimension;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DimensionRepository extends CrudRepository<TbDimension, Long> {

    @Query(value = "select * from tb_dimension where pid = :pid order by id asc", nativeQuery = true)
    List<TbDimension> listByPid(@Param("pid") Long pid);

    @Modifying
    @Query(value = "update tb_dimension set data_type = :dataType where id = :id", nativeQuery = true)
    int updateDataType(@Param(value = "id") Long id, @Param(value = "dataType") Integer dataType);

    @Query(value = "select * from tb_dimension where total_code like :totalCode", nativeQuery = true)
    List<TbDimension> listByTotalCode(@Param("totalCode") String totalCode);

    @Modifying
    @Query(value = "delete from tb_dimension where id in :idList", nativeQuery = true)
    int deleteByIdList(@Param(value = "idList") List<Long> idList);

    @Modifying
    @Query(value = "delete from tb_dimension where total_code like :totalCode", nativeQuery = true)
    int deleteByTotalCode(@Param(value = "totalCode") String totalCode);

    @Query(value = "select id from tb_dimension where total_code like :totalCode", nativeQuery = true)
    List<Long> findByTotalCode(@Param(value = "totalCode") String totalCode);

    @Query(value = "select * from tb_dimension where form_id = :formId and dimension_level = 0 and layout_type = 0 order by id asc", nativeQuery = true)
    List<TbDimension> listFormRowDim(@Param("formId") Long formId);

    @Query(value = "select * from tb_dimension where form_id = :formId and dimension_level = 0 and layout_type = 1 order by id asc", nativeQuery = true)
    List<TbDimension> listFormColDim(@Param("formId") Long formId);

    @Modifying
    @Query(value = "delete from tb_dimension where form_id = :formId", nativeQuery = true)
    int deleteByFormId(@Param(value = "formId") Long formId);

//    @Query(value = "select * from tb_dimension where dimension_level != 0", nativeQuery = true)
//    List<TbDimension> listDimMember();
}