package com.rose.service;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbCompanyInOut;
import com.rose.data.to.request.CompanyInOutSearchRequest;

/**
 * 描述：公司收支 service
 * @author sunpeng
 */
public interface CompanyInOutService {

    PageList<TbCompanyInOut> search(CompanyInOutSearchRequest param) throws Exception;

    void add(TbCompanyInOut param);

    TbCompanyInOut getDetail(Long id);

    void delete(Long id);
}