package com.rose.repository;

import com.rose.data.entity.TbEmployer;
import org.springframework.data.repository.CrudRepository;

public interface EmployerRepository extends CrudRepository<TbEmployer, Long> {

}