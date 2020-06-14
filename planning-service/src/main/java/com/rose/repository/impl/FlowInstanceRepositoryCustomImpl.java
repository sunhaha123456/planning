package com.rose.repository.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.base.PageUtil;
import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.enums.FlowInstanceNodeUserTaskStateEnum;
import com.rose.data.enums.FlowInstanceStateEnum;
import com.rose.repository.FlowInstanceRepositoryCustom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Repository
public class FlowInstanceRepositoryCustomImpl extends BaseRepositoryImpl implements FlowInstanceRepositoryCustom {

    @Override
    public PageList<TbFlowInstance> list(Long templateId, String flowInstanceName, Integer state, Long startUserId, Integer pageNo, Integer pageSize) throws Exception {
        StringBuilder sql = new StringBuilder();
        List<Object> paramList = new ArrayList();
        sql.append(" SELECT a.id, a.instance_name instanceName, b.user_name startUserName, a.start_time startTime, a.state ");
        sql.append(" FROM tb_flow_instance a left join tb_sys_user b on a.start_user_id = b.id ");
        sql.append(" WHERE 1 = 1 ");
        if (templateId != null) {
            sql.append(" and a.template_id = ? ");
            paramList.add(templateId);
        }
        if (state != null) {
            sql.append(" and a.state = ? ");
            paramList.add(state);
        }
        if (startUserId != null) {
            sql.append(" and a.start_user_id = ? ");
            paramList.add(startUserId);
        }
        if (StringUtil.isNotEmpty(flowInstanceName)) {
            sql.append(" and instr(a.instance_name, ?) > 0 ");
            paramList.add(flowInstanceName);
        }
        sql.append(" order by a.id desc ");
        return queryPage(sql.toString(), TbFlowInstance.class, new PageUtil(pageNo, pageSize), null, paramList.toArray());
    }

    @Override
    public PageList<TbFlowInstance> listApprovalApply(Long approvalUserId, String flowInstanceName, Date approvalStartDate, Date approvalEndDate, Integer pageNo, Integer pageSize) throws Exception {
        StringBuilder sqlCount = new StringBuilder();
        List<Object> paramListCount = new ArrayList();
        sqlCount.append(" SELECT count(distinct a.id# b.id) ");
        sqlCount.append(" FROM tb_flow_instance a join tb_flow_instance_node_user_task b on a.id = b.instance_id and b.state = ").append(FlowInstanceNodeUserTaskStateEnum.HAVE_OPERATE.getIndex());
        sqlCount.append(" and b.user_id = ? ");
        paramListCount.add(approvalUserId);
        sqlCount.append(" left join tb_sys_user c on a.start_user_id = c.id ");
        sqlCount.append(" WHERE 1 = 1 ");
        if (StringUtil.isNotEmpty(flowInstanceName)) {
            sqlCount.append(" and instr(a.instance_name, ?) > 0 ");
            paramListCount.add(flowInstanceName);
        }
        if (approvalStartDate != null) {
            sqlCount.append(" and b.approval_date >= ? ");
            paramListCount.add(approvalStartDate);
        }
        if (approvalEndDate != null) {
            sqlCount.append(" and b.approval_date <= ? ");
            paramListCount.add(approvalEndDate);
        }
        Long c = getCount(sqlCount.toString(), paramListCount.toArray());
        if (c <= 0) {
            return new PageList(0, new ArrayList<>());
        }

        StringBuilder sqlSelect = new StringBuilder();
        List<Object> paramListSelect = new ArrayList();
        sqlSelect.append(" SELECT a.id, a.instance_name instanceName, b.approval_date approvalDate, c.user_name startUserName, a.start_time startTime, a.state ");
        sqlSelect.append(" FROM tb_flow_instance a join tb_flow_instance_node_user_task b on a.id = b.instance_id and b.state = ").append(FlowInstanceNodeUserTaskStateEnum.HAVE_OPERATE.getIndex());
        sqlSelect.append(" and b.user_id = ? ");
        paramListSelect.add(approvalUserId);
        sqlSelect.append(" left join tb_sys_user c on a.start_user_id = c.id ");
        sqlSelect.append(" WHERE 1 = 1 ");
        if (StringUtil.isNotEmpty(flowInstanceName)) {
            sqlSelect.append(" and instr(a.instance_name, ?) > 0 ");
            paramListSelect.add(flowInstanceName);
        }
        if (approvalStartDate != null) {
            sqlSelect.append(" and b.approval_date >= ? ");
            paramListSelect.add(approvalStartDate);
        }
        if (approvalEndDate != null) {
            sqlSelect.append(" and b.approval_date <= ? ");
            paramListSelect.add(approvalEndDate);
        }
        sqlSelect.append(" group by a.id,b.id order by b.approval_date desc ");

        PageUtil page = new PageUtil(pageNo, pageSize);
        sqlSelect.append(" limit ").append(page.getStart()).append(",").append(page.getPageSize());
        List<TbFlowInstance> list = queryList(sqlSelect.toString(), TbFlowInstance.class, paramListSelect.toArray());

        return new PageList(c, list != null ? list : new ArrayList());
    }

    @Override
    public PageList<TbFlowInstance> listWaitingApproval(Long waitApprovalUserId, Integer pageNo, Integer pageSize) throws Exception {
        StringBuilder sqlCount = new StringBuilder();
        List<Object> paramListCount = new ArrayList();
        sqlCount.append(" SELECT count(distinct a.id, c.id) ");
        sqlCount.append(" FROM tb_flow_instance a join tb_flow_instance_node_user_task b on a.id = b.instance_id ");
        sqlCount.append(" and a.state = ").append(FlowInstanceStateEnum.HAVE_STARTED.getIndex());
        sqlCount.append(" and b.state = ").append(FlowInstanceNodeUserTaskStateEnum.WAITINT_OPERATE.getIndex());
        sqlCount.append(" and b.user_id = ? ");
        paramListCount.add(waitApprovalUserId);
        sqlCount.append(" join tb_flow_instance_node c on b.instance_node_id = c.id ");
        Long c = getCount(sqlCount.toString(), paramListCount.toArray());
        if (c <= 0) {
            return new PageList(0, new ArrayList<>());
        }

        StringBuilder sqlSelect = new StringBuilder();
        List<Object> paramListSelect = new ArrayList();
        sqlSelect.append(" SELECT a.id, a.instance_name instanceName, c.node_name nodeName, c.id userTaskId, a.start_time startTime, a.state ");
        sqlSelect.append(" FROM tb_flow_instance a join tb_flow_instance_node_user_task b on a.id = b.instance_id ");
        sqlSelect.append(" and a.state = ").append(FlowInstanceStateEnum.HAVE_STARTED.getIndex());
        sqlSelect.append(" and b.state = ").append(FlowInstanceNodeUserTaskStateEnum.WAITINT_OPERATE.getIndex());
        sqlSelect.append(" and b.user_id = ? ");
        paramListSelect.add(waitApprovalUserId);
        sqlSelect.append(" join tb_flow_instance_node c on b.instance_node_id = c.id ");
        sqlSelect.append(" group by a.id, c.id order by a.id desc ");

        PageUtil page = new PageUtil(pageNo, pageSize);
        sqlSelect.append(" limit ").append(page.getStart()).append(",").append(page.getPageSize());
        List<TbFlowInstance> list = queryList(sqlSelect.toString(), TbFlowInstance.class, paramListSelect.toArray());

        return new PageList(c, list != null ? list : new ArrayList());
    }
}