package com.rose.repository.impl;

import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.data.entity.TbFlowTemplateNodeUserTask;
import com.rose.repository.FlowTemplateNodeUserTaskRepositoryCustom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class FlowTemplateNodeUserTaskRepositoryCustomImpl extends BaseRepositoryImpl implements FlowTemplateNodeUserTaskRepositoryCustom {

    @Override
    public List<TbFlowTemplateNodeUserTask> queryNodeUserList(Long nodeId) {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT a.id, b.id userId, b.login_name loginName, b.user_name userName ");
        sql.append(" FROM tb_flow_template_node_user_task a JOIN tb_sys_user b ");
        sql.append(" ON a.user_id = b.id AND a.template_node_id = ? order by a.id asc ");
        return queryList(sql.toString(), TbFlowTemplateNodeUserTask.class, new Object[]{nodeId});
    }

    @Override
    public List<TbFlowTemplateNodeUserTask> queryTemplateNodeUserList(Long templateId) {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT a.id, a.template_node_id templateNodeId, b.login_name loginName, b.user_name userName ");
        sql.append(" FROM tb_flow_template_node_user_task a JOIN tb_sys_user b ");
        sql.append(" ON a.user_id = b.id AND a.template_id = ? order by a.id asc ");
        return queryList(sql.toString(), TbFlowTemplateNodeUserTask.class, new Object[]{templateId});
    }
}