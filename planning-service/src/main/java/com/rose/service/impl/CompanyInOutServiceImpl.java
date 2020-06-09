package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.BigDecimalUtil;
import com.rose.common.util.StringUtil;
import com.rose.common.util.ValueHolder;
import com.rose.data.entity.TbCompanyInOut;
import com.rose.data.entity.TbSysUser;
import com.rose.data.to.request.CompanyInOutSearchRequest;
import com.rose.repository.CompanyInOutRepository;
import com.rose.repository.CompanyInOutRepositoryCustom;
import com.rose.repository.SysUserRepository;
import com.rose.service.CompanyInOutService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Date;

@Slf4j
@Service
public class CompanyInOutServiceImpl implements CompanyInOutService {

    @Inject
    private CompanyInOutRepository companyInOutRepository;
    @Inject
    private CompanyInOutRepositoryCustom companyInOutRepositoryCustom;
    @Inject
    private SysUserRepository sysUserRepository;
    @Inject
    private ValueHolder valueHolder;

    @Override
    public PageList<TbCompanyInOut> search(CompanyInOutSearchRequest param) throws Exception {
        return companyInOutRepositoryCustom.list(param);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(TbCompanyInOut param) {
        param.setId(null);
        Date now = new Date();
        param.setCreateDate(now);
        param.setLastModified(now);
        param.setDelFlag(0);
        param.setEntryUserId(valueHolder.getUserIdHolder());
        if (StringUtil.isEmpty(param.getEntryName())) {
            throw new BusinessException("录入项名称不能为空！");
        }
        if (param.getEntryAmount() == null || BigDecimalUtil.isSmallThan(param.getEntryAmount(), BigDecimal.ZERO)) {
            throw new BusinessException("录入项金额不能比零小！");
        }
        if (!Arrays.asList(0, 1, 2).contains(param.getEntryType())) {
            throw new BusinessException("录入项类别错误！");
        }
        if (param.getEntryHappenDate() == null) {
            throw new BusinessException("请填写录入项发生时间！");
        }
        companyInOutRepository.save(param);
    }

    @Override
    public TbCompanyInOut getDetail(Long id) {
        TbCompanyInOut res = companyInOutRepository.findOne(id);
        if (res != null) {
            TbSysUser operateUser = sysUserRepository.findOne(res.getEntryUserId());
            if (operateUser != null) {
                res.setEntryUserName(operateUser.getUserName());
            }
        }
        return res;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(Long id) {
        companyInOutRepository.updateDelFlag(id, new Date());
    }
}