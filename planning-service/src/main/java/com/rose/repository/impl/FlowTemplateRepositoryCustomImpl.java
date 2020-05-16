package com.rose.repository.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.base.PageUtil;
import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.repository.FlowTemplateRepositoryCustom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class FlowTemplateRepositoryCustomImpl extends BaseRepositoryImpl implements FlowTemplateRepositoryCustom {

    @Override
    public PageList<TbFlowTemplate> list(String templateName, Integer templateState, Integer pageNo, Integer pageSize) throws Exception {
        StringBuilder sql = new StringBuilder();
        List<Object> paramList = new ArrayList();
        sql.append(" SELECT id, template_name templateName ");
        sql.append(" FROM tb_flow_template ");
        sql.append(" WHERE 1 = 1 ");
        if (StringUtil.isNotEmpty(templateName)) {
            sql.append(" and instr(template_name, ?) > 0 ");
            paramList.add(templateName);
        }
        if (templateState != null) {
            sql.append(" and status = ? ");
            paramList.add(templateState);
        }
        return queryPage(sql.toString(), TbFlowTemplate.class, new PageUtil(pageNo, pageSize), null, paramList.toArray());
    }
}