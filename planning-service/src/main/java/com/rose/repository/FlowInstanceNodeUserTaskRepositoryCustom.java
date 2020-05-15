package com.rose.repository;

import com.rose.common.repository.BaseRepository;
import com.rose.data.entity.TbFlowInstanceNodeUserTask;

import java.util.List;

public interface FlowInstanceNodeUserTaskRepositoryCustom extends BaseRepository {
    List<TbFlowInstanceNodeUserTask> queryTemplateNodeUserList(Long templateId);
}