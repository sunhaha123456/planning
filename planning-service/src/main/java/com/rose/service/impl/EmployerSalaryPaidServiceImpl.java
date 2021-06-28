package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.DateUtil;
import com.rose.common.util.StringUtil;
import com.rose.common.util.ValueHolder;
import com.rose.data.entity.TbCompanyPaidSalary;
import com.rose.data.entity.TbEmployer;
import com.rose.data.to.request.EmployerSalaryPaidSearchRequest;
import com.rose.data.to.vo.EmployerSalaryTemplateExportVo;
import com.rose.repository.CompanyPaidSalaryRepository;
import com.rose.repository.CompanyPaidSalaryRepositoryCustom;
import com.rose.repository.EmployerRepository;
import com.rose.service.EmployerSalaryPaidService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class EmployerSalaryPaidServiceImpl implements EmployerSalaryPaidService {

    @Inject
    private CompanyPaidSalaryRepository companyPaidSalaryRepository;
    @Inject
    private CompanyPaidSalaryRepositoryCustom companyPaidSalaryRepositoryCustom;
    @Inject
    private EmployerRepository employerRepository;
    @Inject
    private ValueHolder valueHolder;

    @Override
    public PageList<TbCompanyPaidSalary> search(EmployerSalaryPaidSearchRequest param) throws Exception {
        PageList<TbCompanyPaidSalary> page = companyPaidSalaryRepositoryCustom.list(param.getEmployerName(), param.getPhone(), param.getIdCardNo(), param.getSalaryDate(), param.getPage(), param.getRows());
        if (page != null) {
            if (page.getTotal() != 0) {
                BigDecimal companyTotalSpend = companyPaidSalaryRepositoryCustom.getCompanyTotalSpend(param.getEmployerName(), param.getPhone(), param.getIdCardNo(), param.getSalaryDate());
                page.setOtherData(companyTotalSpend);
            } else {
                page.setOtherData(0);
            }
        }
        return page;
    }

    @Override
    public TbCompanyPaidSalary getEmployer(Long id) {
        TbCompanyPaidSalary salary = companyPaidSalaryRepository.findOne(id);

        Long employerId = salary.getEmployerId();
        TbEmployer employer = employerRepository.findOne(employerId);
        salary.setEmployer(employer);

        return salary;
    }

    @Override
    public List<EmployerSalaryTemplateExportVo> getEmployerSalaryTemplateList() {
        List<EmployerSalaryTemplateExportVo> list = new ArrayList<>();

        EmployerSalaryTemplateExportVo vo = null;
        List<TbEmployer> employerList = employerRepository.listNotQuit();
        if (employerList != null && employerList.size() > 0) {
            String salaryDate = DateUtil.format(new Date(), "yyyy-MM");

            for (TbEmployer e : employerList) {
                vo = new EmployerSalaryTemplateExportVo();

                vo.setSalaryDate(salaryDate);
                vo.setId(e.getId() + "");
                vo.setEmployerName(e.getEmployerName());
                vo.setGender(e.getGender() == 0 ? "男" : "女");
                vo.setPhone(e.getPhone());
                vo.setDepartment(e.getDepartment());
                vo.setPosition(e.getPosition());
                vo.setTotalPaidAmount(BigDecimal.ZERO.toPlainString());
                vo.setSalaryAmount(e.getSalaryAmount() != null ? e.getSalaryAmount().toPlainString() : BigDecimal.ZERO.toPlainString());
                vo.setSubsidyAmount(e.getSubsidyAmount() != null ? e.getSubsidyAmount().toPlainString() : BigDecimal.ZERO.toPlainString());
                vo.setPaidSalaryAmount(BigDecimal.ZERO.toPlainString());
                vo.setPaidSubsidyAmount(BigDecimal.ZERO.toPlainString());
                vo.setSocialPersonalPaid(BigDecimal.ZERO.toPlainString());
                vo.setSocialCompanyPaid(BigDecimal.ZERO.toPlainString());
                vo.setAccumulationPersonalPaid(BigDecimal.ZERO.toPlainString());
                vo.setAccumulatioCompanyPaid(BigDecimal.ZERO.toPlainString());
                vo.setDeductionAmount(BigDecimal.ZERO.toPlainString());
                vo.setDeductionRemark("");

                list.add(vo);
            }
        } else {
            vo = new EmployerSalaryTemplateExportVo();
            list.add(vo);
        }

        return list;
    }

    // TODO: 2020/6/7 以后再加是否重复的导入
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void importSalaryList(List<EmployerSalaryTemplateExportVo> list) {
        if (list != null && list.size() > 0) {
            Date now = new Date();
            Long userId = valueHolder.getUserIdHolder();

            List<TbCompanyPaidSalary> salaryList =  new ArrayList<>();
            TbCompanyPaidSalary salary = null;
            EmployerSalaryTemplateExportVo vo = null;
            for (int x = 0; x<list.size(); x++) {
                salary = new TbCompanyPaidSalary();
                vo = list.get(x);
                salary.setCreateDate(now);
                salary.setLastModified(now);
                salary.setEntryUserId(userId);
                salary.setEntryUserRemark(vo.getEntryUserRemark());
                if (StringUtil.isEmpty(vo.getId()) || !vo.getId().matches("\\d+")) {
                    throw new BusinessException("第" + (x + 2) + "行唯一标志错误！");
                }
                salary.setEmployerId(Long.valueOf(vo.getId()));
                Date salaryDate = DateUtil.format(vo.getSalaryDate(), "yyyy-MM");
                if (salaryDate == null) {
                    throw new BusinessException("第" + (x + 2) + "行工资日期错误！");
                }
                salary.setSalaryDate(salaryDate);
                salary.setDepartment(vo.getDepartment());
                salary.setPosition(vo.getPosition());
                salary.setTotalPaidAmount(new BigDecimal(vo.getTotalPaidAmount()));
                salary.setSalaryAmount(new BigDecimal(vo.getSalaryAmount()));
                salary.setSubsidyAmount(new BigDecimal(vo.getSubsidyAmount()));
                salary.setPaidSalaryAmount(new BigDecimal(vo.getPaidSalaryAmount()));
                salary.setPaidSubsidyAmount(new BigDecimal(vo.getPaidSubsidyAmount()));
                salary.setDeductionAmount(new BigDecimal(vo.getDeductionAmount()));
                salary.setDeductionRemark(vo.getDeductionRemark());
                salary.setSocialPersonalPaid(new BigDecimal(vo.getSocialPersonalPaid()));
                salary.setSocialCompanyPaid(new BigDecimal(vo.getSocialCompanyPaid()));
                salary.setAccumulationPersonalPaid(new BigDecimal(vo.getAccumulationPersonalPaid()));
                salary.setAccumulatioCompanyPaid(new BigDecimal(vo.getAccumulatioCompanyPaid()));
                salary.setDelFlag(0);

                salaryList.add(salary);
            }
            companyPaidSalaryRepository.saveAll(salaryList);
        }
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