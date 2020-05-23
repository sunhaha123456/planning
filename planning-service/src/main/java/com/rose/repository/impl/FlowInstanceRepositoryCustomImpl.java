package com.rose.repository.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.base.PageUtil;
import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.enums.FlowInstanceNodeUserTaskStateEnum;
import com.rose.repository.FlowInstanceRepositoryCustom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class FlowInstanceRepositoryCustomImpl extends BaseRepositoryImpl implements FlowInstanceRepositoryCustom {

    @Override
    public PageList<TbFlowInstance> list(Long templateId, String flowInstanceName, Long startUserId, Integer pageNo, Integer pageSize) throws Exception {
        StringBuilder sql = new StringBuilder();
        List<Object> paramList = new ArrayList();
        sql.append(" SELECT a.id, a.instance_name instanceName, b.user_name startUserName, a.start_time startTime, a.state ");
        sql.append(" FROM tb_flow_instance a left join tb_sys_user b on a.start_user_id = b.id ");
        sql.append(" WHERE 1 = 1 ");
        if (templateId != null) {
            sql.append(" and a.template_id = ? ");
            paramList.add(templateId);
        }
        if (startUserId != null) {
            sql.append(" and a.start_user_id = ? ");
            paramList.add(startUserId);
        }
        if (StringUtil.isNotEmpty(flowInstanceName)) {
            sql.append(" and instr(a.instance_name, ?) > 0 ");
            paramList.add(flowInstanceName);
        }
        return queryPage(sql.toString(), TbFlowInstance.class, new PageUtil(pageNo, pageSize), null, paramList.toArray());
    }

    @Override
    public PageList<TbFlowInstance> listApprovalApply(Long approvalUserId, String flowInstanceName, Integer pageNo, Integer pageSize) throws Exception {
        StringBuilder sql = new StringBuilder();
        List<Object> paramList = new ArrayList();
        sql.append(" SELECT a.id, a.instance_name instanceName, c.user_name startUserName, a.start_time startTime, a.state ");
        sql.append(" FROM tb_flow_instance a join tb_flow_instance_node_user_task b on a.id = b.instance_id and b.state = ").append(FlowInstanceNodeUserTaskStateEnum.HAVE_OPERATE.getIndex());
        sql.append(" and b.user_id = ? ");
        paramList.add(approvalUserId);
        sql.append(" left join tb_sys_user c on a.start_user_id = c.id ");
        sql.append(" WHERE 1 = 1 ");
        if (StringUtil.isNotEmpty(flowInstanceName)) {
            sql.append(" and instr(a.instance_name, ?) > 0 ");
            paramList.add(flowInstanceName);
        }
        sql.append(" group by a.id ");
        return queryPage(sql.toString(), TbFlowInstance.class, new PageUtil(pageNo, pageSize), null, paramList.toArray());
    }
}