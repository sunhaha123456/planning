package com.rose.repository;

import com.rose.common.repository.BaseRepository;
import com.rose.data.entity.TbFlowTemplateNodeUserTask;

import java.util.List;

public interface FlowTemplateNodeUserTaskRepositoryCustom extends BaseRepository {
    List<TbFlowTemplateNodeUserTask> queryNodeUserList(Long nodeId);
}