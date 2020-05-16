package com.rose.repository;

import com.rose.common.data.base.PageList;
import com.rose.common.repository.BaseRepository;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbFlowTemplate;

public interface FlowTemplateRepositoryCustom extends BaseRepository {

    /**
     * 功能：流程模板条件分页查询
     * @param templateName
     * @param templateState
     * @param pageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    PageList<TbFlowTemplate> list(String templateName, Integer templateState, Integer pageNo, Integer pageSize) throws Exception;
}