package com.rose.repository;

import com.rose.common.data.base.PageList;
import com.rose.common.repository.BaseRepository;
import com.rose.data.entity.TbNotice;

public interface NoticeRepositoryCustom extends BaseRepository {

    PageList<TbNotice> list(Integer pageNo, Integer pageSize) throws Exception;

}