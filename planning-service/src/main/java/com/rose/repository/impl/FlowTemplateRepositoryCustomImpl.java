package com.rose.repository.impl;

import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.entity.TbMenu;
import com.rose.repository.FlowTemplateRepositoryCustom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class FlowTemplateRepositoryCustomImpl extends BaseRepositoryImpl implements FlowTemplateRepositoryCustom {

    @Override
    public List<TbFlowTemplate> queryByFormId(Long formId) {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT b.template_name templateName ");
        sql.append(" FROM tb_flow_template_node_form a JOIN tb_flow_template b ON a.template_id = b.id AND a.form_id = ? ");
        return queryList(sql.toString(), TbFlowTemplate.class, new Object[]{formId});
    }
}