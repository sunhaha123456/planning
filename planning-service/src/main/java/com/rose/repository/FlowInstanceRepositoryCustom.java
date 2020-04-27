package com.rose.repository;

import com.rose.common.repository.BaseRepository;
import com.rose.data.entity.TbFlowInstance;

import java.util.List;

public interface FlowInstanceRepositoryCustom extends BaseRepository {

    List<TbFlowInstance> queryByFormId(Long formId);

}