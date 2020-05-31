package com.rose.service;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbEmployer;
import com.rose.data.to.request.EmployerSearchRequest;

import java.util.List;

/**
 * 描述：employer service
 * @author sunpeng
 */
public interface EmployerService {

    PageList<TbEmployer> search(EmployerSearchRequest param) throws Exception;

    void save(TbEmployer param);

    /**
     * 功能：获取详情
     * @param id
     * @param salaryFlag true返回全部信息 false不返回工资等敏感信息
     * @return
     */
    TbEmployer getEmployer(Long id, boolean salaryFlag);

    void importFile(List<TbEmployer> list);
}