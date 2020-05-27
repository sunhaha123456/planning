package com.rose.repository.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.base.PageUtil;
import com.rose.common.repository.impl.BaseRepositoryImpl;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbNotice;
import com.rose.repository.NoticeRepositoryCustom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class NoticeRepositoryCustomImpl extends BaseRepositoryImpl implements NoticeRepositoryCustom {

    @Override
    public PageList<TbNotice> list(Integer status, Integer pageNo, Integer pageSize) throws Exception {
        StringBuilder sql = new StringBuilder();
        List<Object> paramList = new ArrayList();
        sql.append(" SELECT a.id, a.title, a.status, a.sort ");
        sql.append(" FROM tb_notice a ");
        sql.append(" WHERE 1 = 1 ");
        if (status != null) {
            sql.append(" and a.status = ? ");
            paramList.add(status);
        }
        sql.append(" order by a.sort desc, a.create_date desc ");
        return queryPage(sql.toString(), TbNotice.class, new PageUtil(pageNo, pageSize), null, paramList.toArray());
    }
}