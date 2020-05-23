package com.rose.repository;

import com.rose.common.data.base.PageList;
import com.rose.common.repository.BaseRepository;
import com.rose.data.entity.TbFlowInstance;

public interface FlowInstanceRepositoryCustom extends BaseRepository {

    /**
     * 功能：流程实例条件分页查询
     * @param templateId
     * @param flowInstanceName
     * @param startUserId
     * @param pageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    PageList<TbFlowInstance> list(Long templateId, String flowInstanceName, Long startUserId, Integer pageNo, Integer pageSize) throws Exception;
}