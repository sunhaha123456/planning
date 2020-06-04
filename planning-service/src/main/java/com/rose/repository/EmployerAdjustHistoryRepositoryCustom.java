package com.rose.repository;

import com.rose.common.data.base.PageList;
import com.rose.common.repository.BaseRepository;
import com.rose.data.entity.TbEmployerAdjustHistory;

public interface EmployerAdjustHistoryRepositoryCustom extends BaseRepository {

    PageList<TbEmployerAdjustHistory> list(Long employerId, Integer pageNo, Integer pageSize) throws Exception;
}