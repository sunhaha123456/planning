package com.rose.repository.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.base.PageUtil;
import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.data.entity.TbFlowInstanceOperateHistory;
import com.rose.repository.FlowInstanceOperateHistoryRepositoryCustom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class FlowInstanceOperateHistoryRepositoryCustomImpl extends BaseRepositoryImpl implements FlowInstanceOperateHistoryRepositoryCustom {

    @Override
    public PageList<TbFlowInstanceOperateHistory> list(Long instanceId, Integer pageNo, Integer pageSize) throws Exception {
        StringBuilder sql = new StringBuilder();
        List<Object> paramList = new ArrayList();
        sql.append(" SELECT a.id, a.create_date createDate, b.login_name operateUserLoginName, a.operate_info operateInfo ");
        sql.append(" FROM tb_flow_instance_operate_history a left join tb_sys_user b on a.operate_user_id = b.id ");
        sql.append(" WHERE 1 = 1 ");
        if (instanceId != null) {
            sql.append(" and a.instance_id = ? ");
            paramList.add(instanceId);
        }
        sql.append(" order by a.create_date desc ");
        return queryPage(sql.toString(), TbFlowInstanceOperateHistory.class, new PageUtil(pageNo, pageSize), null, paramList.toArray());
    }
}