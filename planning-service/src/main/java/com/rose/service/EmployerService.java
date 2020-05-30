package com.rose.service;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbEmployer;
import com.rose.data.to.request.EmployerSearchRequest;

/**
 * 描述：employer service
 * @author sunpeng
 */
public interface EmployerService {
    PageList<TbEmployer> search(EmployerSearchRequest param) throws Exception;
}