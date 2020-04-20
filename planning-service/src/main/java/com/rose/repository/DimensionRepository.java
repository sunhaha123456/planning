package com.rose.repository;

import com.rose.data.entity.TbDimension;
import org.springframework.data.repository.CrudRepository;

public interface DimensionRepository extends CrudRepository<TbDimension, Long> {

}