package com.rose.repository;

import com.rose.common.data.base.PageList;
import com.rose.common.repository.BaseRepository;
import com.rose.data.entity.TbEmployer;

public interface EmployerRepositoryCustom extends BaseRepository {

    PageList<TbEmployer> list(String employerName, String phone, Integer employerType, Integer onJobState, Integer pageNo, Integer pageSize) throws Exception;
}