package com.rose.repository;

import com.rose.data.entity.TbNotice;
import org.springframework.data.repository.CrudRepository;

public interface NoticeRepository extends CrudRepository<TbNotice, Long> {

}