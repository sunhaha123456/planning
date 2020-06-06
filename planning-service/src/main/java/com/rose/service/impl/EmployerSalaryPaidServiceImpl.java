package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.exception.BusinessException;
import com.rose.data.entity.TbCompanyPaidSalary;
import com.rose.data.to.request.EmployerSalaryPaidSearchRequest;
import com.rose.repository.CompanyPaidSalaryRepository;
import com.rose.repository.CompanyPaidSalaryRepositoryCustom;
import com.rose.service.EmployerSalaryPaidService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.Date;

@Slf4j
@Service
public class EmployerSalaryPaidServiceImpl implements EmployerSalaryPaidService {

    @Inject
    private CompanyPaidSalaryRepository companyPaidSalaryRepository;
    @Inject
    private CompanyPaidSalaryRepositoryCustom companyPaidSalaryRepositoryCustom;

    @Override
    public PageList<TbCompanyPaidSalary> search(EmployerSalaryPaidSearchRequest param) throws Exception {
        return companyPaidSalaryRepositoryCustom.list(param.getEmployerName(), param.getPhone(), param.getIdCardNo(), param.getSalaryDate(), param.getPage(), param.getRows());
    }

    @Override
    public TbCompanyPaidSalary getEmployer(Long id) {
        return companyPaidSalaryRepository.findOne(id);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(Long id) {
        TbCompanyPaidSalary salary = companyPaidSalaryRepository.findOne(id);
        if (salary == null) {
            throw new BusinessException("对应信息记录不存在！");
        }
        companyPaidSalaryRepository.updateDelFlag(id, new Date());
    }
}