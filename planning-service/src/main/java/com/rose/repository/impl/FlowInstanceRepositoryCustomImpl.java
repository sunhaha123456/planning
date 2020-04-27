package com.rose.repository.impl;

import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.repository.FlowInstanceRepositoryCustom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class FlowInstanceRepositoryCustomImpl extends BaseRepositoryImpl implements FlowInstanceRepositoryCustom {

    @Override
    public List<TbFlowInstance> queryByFormId(Long formId) {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT b.instance_name instanceName ");
        sql.append(" FROM tb_flow_instance_node_form a JOIN tb_flow_instance b ON a.instance_id = b.id AND a.form_id = ? ");
        return queryList(sql.toString(), TbFlowInstance.class, new Object[]{formId});
    }
}