package com.rose.repository.impl;

import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.data.entity.TbFlowInstanceNodeUserTask;
import com.rose.repository.FlowInstanceNodeUserTaskRepositoryCustom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class FlowInstanceNodeUserTaskRepositoryCustomImpl extends BaseRepositoryImpl implements FlowInstanceNodeUserTaskRepositoryCustom {

    @Override
    public List<TbFlowInstanceNodeUserTask> queryTemplateNodeUserList(Long instanceId) {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT a.id, a.instance_node_id instanceNodeId, a.state, b.login_name loginName, b.user_name userName ");
        sql.append(" FROM tb_flow_instance_node_user_task a JOIN tb_sys_user b ");
        sql.append(" ON a.user_id = b.id AND a.instance_id = ? order by a.id asc ");
        return queryList(sql.toString(), TbFlowInstanceNodeUserTask.class, new Object[]{instanceId});
    }
}