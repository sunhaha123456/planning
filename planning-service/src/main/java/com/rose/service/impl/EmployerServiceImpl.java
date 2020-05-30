package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbEmployer;
import com.rose.data.enums.EmployerOnJobStateEnum;
import com.rose.data.enums.EmployerTyepEnum;
import com.rose.data.to.request.EmployerSearchRequest;
import com.rose.repository.EmployerRepository;
import com.rose.repository.EmployerRepositoryCustom;
import com.rose.service.EmployerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Slf4j
@Service
public class EmployerServiceImpl implements EmployerService {

    @Inject
    private EmployerRepository employerRepository;
    @Inject
    private EmployerRepositoryCustom employerRepositoryCustom;

    @Override
    public PageList<TbEmployer> search(EmployerSearchRequest param) throws Exception {
        PageList<TbEmployer> page = employerRepositoryCustom.list(param.getEmployerName(), param.getPhone(), param.getPage(), param.getRows());
        if (page != null && page.getRows() != null) {
            for (TbEmployer e : page.getRows()) {
                e.setEmployerTypeStr(EmployerTyepEnum.getName(e.getEmployerType()));
                e.setOnJobStateStr(EmployerOnJobStateEnum.getName(e.getOnJobState()));
            }
        }
        return page;
    }
}