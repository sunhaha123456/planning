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

    @Query(value = "select * from tb_dimension where total_code like :totalCode", nativeQuery = true)
    List<TbDimension> listChilds(@Param("totalCode") String totalCode);

    @Modifying
    @Query(value = "update tb_dimension set data_type = :dataType where id = :id", nativeQuery = true)
    int updateDataType(@Param(value = "id") Long id, @Param(value = "dataType") Integer dataType);


//    @Query(value = "select * from tb_dimension where dimension_level != 0", nativeQuery = true)
//    List<TbDimension> listDimMember();
}