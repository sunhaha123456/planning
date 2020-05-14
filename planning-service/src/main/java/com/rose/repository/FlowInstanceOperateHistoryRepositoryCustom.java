package com.rose.repository;

import com.rose.common.data.base.PageList;
import com.rose.common.repository.BaseRepository;
import com.rose.data.entity.TbFlowInstanceOperateHistory;

public interface FlowInstanceOperateHistoryRepositoryCustom extends BaseRepository {
    /**
     * 功能：流程操作历史信息条件分页查询
     * @param instanceId
     * @param pageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    PageList<TbFlowInstanceOperateHistory> list(Long instanceId, Integer pageNo, Integer pageSize) throws Exception;
}