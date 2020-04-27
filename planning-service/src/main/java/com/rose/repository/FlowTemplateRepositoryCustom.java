package com.rose.repository;

import com.rose.common.repository.BaseRepository;
import com.rose.data.entity.TbFlowTemplate;

import java.util.List;

public interface FlowTemplateRepositoryCustom extends BaseRepository {

    List<TbFlowTemplate> queryByFormId(Long formId);

}