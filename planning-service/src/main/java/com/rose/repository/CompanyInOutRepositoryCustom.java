package com.rose.repository;

import com.rose.common.data.base.PageList;
import com.rose.common.repository.BaseRepository;
import com.rose.data.entity.TbCompanyInOut;
import com.rose.data.to.request.CompanyInOutSearchRequest;
import com.rose.data.to.vo.MonthEntryVo;

import java.util.List;

public interface CompanyInOutRepositoryCustom extends BaseRepository {

    /**
     * 功能：条件分页查询
     * @param param 保证 != null
     * @return
     * @throws Exception
     */
    PageList<TbCompanyInOut> list(CompanyInOutSearchRequest param) throws Exception;

    List<MonthEntryVo> listByMonth(String year) throws Exception;
}