package com.rose.repository.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.base.PageUtil;
import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbSysUser;
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
        sql.append(" SELECT a.id, a.instance_name instanceName, u.user_name userName, u.user_state userState, rg.role_name roleGroupName, u.role_group_id roleGroupId, u.create_date createDate ");
        sql.append(" FROM tb_flow_instance a JOIN tb_role_group rg on u.role_group_id = rg.id ");
        sql.append(" WHERE u.user_state != 2 ");
        if (StringUtil.isNotEmpty(flowInstanceName)) {
            sql.append(" AND instr(u.login_name, ?) > 0 ");
            paramList.add(flowInstanceName);
        }
        return queryPage(sql.toString(), TbFlowInstance.class, new PageUtil(pageNo, pageSize), null, paramList.toArray());
    }
}