package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.StringUtil;
import com.rose.common.util.ValueHolder;
import com.rose.data.entity.TbEmployer;
import com.rose.data.entity.TbEmployerAdjustHistory;
import com.rose.data.enums.EmployerHighestEducationEnum;
import com.rose.data.enums.EmployerOnJobStateEnum;
import com.rose.data.enums.EmployerTyepEnum;
import com.rose.data.to.request.AdjustHistoryRequest;
import com.rose.data.to.request.EmployerSearchRequest;
import com.rose.repository.EmployerAdjustHistoryRepository;
import com.rose.repository.EmployerAdjustHistoryRepositoryCustom;
import com.rose.repository.EmployerRepository;
import com.rose.repository.EmployerRepositoryCustom;
import com.rose.service.EmployerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.math.BigDecimal;
import java.util.*;

@Slf4j
@Service
public class EmployerServiceImpl implements EmployerService {

    @Inject
    private EmployerRepository employerRepository;
    @Inject
    private EmployerRepositoryCustom employerRepositoryCustom;
    @Inject
    private EmployerAdjustHistoryRepository employerAdjustHistoryRepository;
    @Inject
    private EmployerAdjustHistoryRepositoryCustom employerAdjustHistoryRepositoryCustom;
    @Inject
    private ValueHolder valueHolder;

    @Override
    public PageList<TbEmployer> search(EmployerSearchRequest param) throws Exception {
        PageList<TbEmployer> page = employerRepositoryCustom.list(param.getEmployerName(), param.getPhone(), param.getEmployerType(), param.getOnJobState(), param.getPage(), param.getRows());
        if (page != null && page.getRows() != null) {
            for (TbEmployer e : page.getRows()) {
                e.setEmployerTypeStr(EmployerTyepEnum.getName(e.getEmployerType()));
                e.setOnJobStateStr(EmployerOnJobStateEnum.getName(e.getOnJobState()));
            }
        }
        return page;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(TbEmployer param) {
        addEmployerValidate(param);
        Date now = new Date();
        param.setId(null);
        param.setCreateDate(now);
        param.setLastModified(now);
        param.setDelFlag(0);
        addEmployerSalaryInit(param);
        TbEmployer res = employerRepository.save(param);

        TbEmployerAdjustHistory history = getHistoryForAddEmployer(now, res.getId(), param);
        employerAdjustHistoryRepository.save(history);
    }

    private TbEmployerAdjustHistory getHistoryForAddEmployer(Date createDate, Long employerId, TbEmployer param) {
        TbEmployerAdjustHistory employerAdjustHistory = new TbEmployerAdjustHistory();
        employerAdjustHistory.setCreateDate(createDate);
        employerAdjustHistory.setLastModified(createDate);
        employerAdjustHistory.setOperateUserId(valueHolder.getUserIdHolder());
        employerAdjustHistory.setOperateInfo("新增人员信息");
        employerAdjustHistory.setEmployerId(employerId);
        employerAdjustHistory.setEntryCompanyTime(param.getEntryCompanyTime());
        employerAdjustHistory.setBecomeRegularTime(null);
        employerAdjustHistory.setQuitTime(null);
        employerAdjustHistory.setDepartment(param.getDepartment());
        employerAdjustHistory.setPosition(param.getPosition());
        employerAdjustHistory.setEmployerType(param.getEmployerType());
        employerAdjustHistory.setOnJobState(param.getOnJobState());
        employerAdjustHistory.setSalaryAmount(BigDecimal.ZERO);
        employerAdjustHistory.setSubsidyAmount(BigDecimal.ZERO);
        employerAdjustHistory.setSocialSecurityAmountPersonal(BigDecimal.ZERO);
        employerAdjustHistory.setSocialSecurityAmountCompany(BigDecimal.ZERO);
        employerAdjustHistory.setAccumulationFundAmountPersonal(BigDecimal.ZERO);
        employerAdjustHistory.setAccumulationFundAmountCompany(BigDecimal.ZERO);
        employerAdjustHistory.setIncomeDesc(null);
        employerAdjustHistory.setEmployerRemark(param.getEmployerRemark());
        return employerAdjustHistory;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateEmployerLimitInfo(TbEmployer param) {
        TbEmployer employer = employerRepository.findOne(param.getId());
        if (employer == null) {
            throw new BusinessException("对应员工信息不存在！");
        }
        employerRepository.updateInfo(param.getId(), param.getPhone(), param.getNowPlace(), param.getHighestEducation(), param.getGraduatedSchool(), param.getGraduatedDate(), param.getEmergencyContactPeople(), param.getEmergencyContactPeoplePhone(), param.getEmployerRemark(), new Date());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateEmployerSalaryPosition(TbEmployer param) {
        TbEmployer employer = employerRepository.findOne(param.getId());
        if (employer == null) {
            throw new BusinessException("对应员工信息不存在！");
        }

        Date now = new Date();

        employer.setLastModified(now);
        employer.setEntryCompanyTime(param.getEntryCompanyTime());
        employer.setBecomeRegularTime(param.getBecomeRegularTime());
        employer.setQuitTime(param.getQuitTime());
        employer.setDepartment(param.getDepartment());
        employer.setPosition(param.getPosition());
        employer.setEmployerType(param.getEmployerType());
        employer.setOnJobState(param.getOnJobState());
        employer.setSalaryAmount(param.getSalaryAmount());
        employer.setSubsidyAmount(param.getSubsidyAmount());
        employer.setSocialSecurityAmountPersonal(param.getSocialSecurityAmountPersonal());
        employer.setSocialSecurityAmountCompany(param.getSocialSecurityAmountCompany());
        employer.setAccumulationFundAmountPersonal(param.getAccumulationFundAmountPersonal());
        employer.setAccumulationFundAmountCompany(param.getAccumulationFundAmountCompany());
        employer.setIncomeDesc(param.getIncomeDesc());
        employer.setEmployerRemark(param.getEmployerRemark());

        employerRepository.save(employer);

        TbEmployerAdjustHistory employerAdjustHistory = new TbEmployerAdjustHistory();
        employerAdjustHistory.setCreateDate(now);
        employerAdjustHistory.setLastModified(now);
        employerAdjustHistory.setOperateUserId(valueHolder.getUserIdHolder());
        employerAdjustHistory.setOperateInfo("调整人员信息");
        employerAdjustHistory.setEmployerId(param.getId());
        employerAdjustHistory.setEntryCompanyTime(param.getEntryCompanyTime());
        employerAdjustHistory.setBecomeRegularTime(param.getBecomeRegularTime());
        employerAdjustHistory.setQuitTime(param.getQuitTime());
        employerAdjustHistory.setDepartment(param.getDepartment());
        employerAdjustHistory.setPosition(param.getPosition());
        employerAdjustHistory.setEmployerType(param.getEmployerType());
        employerAdjustHistory.setOnJobState(param.getOnJobState());
        employerAdjustHistory.setSalaryAmount(param.getSalaryAmount());
        employerAdjustHistory.setSubsidyAmount(param.getSubsidyAmount());
        employerAdjustHistory.setSocialSecurityAmountPersonal(param.getSocialSecurityAmountPersonal());
        employerAdjustHistory.setSocialSecurityAmountCompany(param.getSocialSecurityAmountCompany());
        employerAdjustHistory.setAccumulationFundAmountPersonal(param.getAccumulationFundAmountPersonal());
        employerAdjustHistory.setAccumulationFundAmountCompany(param.getAccumulationFundAmountCompany());
        employerAdjustHistory.setIncomeDesc(param.getIncomeDesc());
        employerAdjustHistory.setEmployerRemark(param.getEmployerRemark());
        employerAdjustHistoryRepository.save(employerAdjustHistory);
    }

    @Override
    public TbEmployer getEmployer(Long id, boolean salaryFlag) {
        TbEmployer employerDb = employerRepository.findOne(id);
        if (salaryFlag) {
            return employerDb;
        } else {
            TbEmployer employerRet = new TbEmployer();
            BeanUtils.copyProperties(employerDb, employerRet);
            employerRet.setSalaryAmount(null);
            employerRet.setSubsidyAmount(null);
            employerRet.setSocialSecurityAmountPersonal(null);
            employerRet.setSocialSecurityAmountCompany(null);
            employerRet.setAccumulationFundAmountPersonal(null);
            employerRet.setAccumulationFundAmountCompany(null);
            employerRet.setIncomeDesc(null);
            return employerRet;
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void importFile(List<TbEmployer> list) {
        if (list == null || list.size() == 0) {
            throw new BusinessException("请上传文件！");
        }
        Date now = new Date();
        TbEmployer employer = null;
        for (int x = 0; x<list.size(); x++) {
            employer = list.get(x);
            employer.setId(null);
            employer.setCreateDate(now);
            employer.setLastModified(now);
            employer.setDelFlag(0);
            employer.setGender("男".equals(employer.getGenderStr()) ? 0 : 1);
            employer.setEmployerType(EmployerTyepEnum.getIndex(employer.getEmployerTypeStr()));
            employer.setOnJobState(EmployerOnJobStateEnum.getIndex(employer.getOnJobStateStr()));
            employer.setHighestEducation(EmployerHighestEducationEnum.getIndex(employer.getHighestEducationStr()));
            addEmployerSalaryInit(employer);
            try {
                addEmployerValidate(employer);
            } catch (BusinessException e) {
                e.setMsg("第" + (x + 2) + "行，" + e.getMsg());
                throw e;
            }
        }
        Iterable<TbEmployer> iterable = employerRepository.saveAll(list);
        Iterator<TbEmployer> iterator = iterable.iterator();

        TbEmployer employerTemp = null;
        TbEmployerAdjustHistory history = null;
        List<TbEmployerAdjustHistory> historyList = new ArrayList<>();
        while (iterator.hasNext()) {
            employerTemp = iterator.next();
            history = getHistoryForAddEmployer(now, employerTemp.getId(), employerTemp);
            historyList.add(history);
        }

        employerAdjustHistoryRepository.saveAll(historyList);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(Long id) {
        TbEmployer employer = employerRepository.findOne(id);
        if (employer == null) {
            throw new BusinessException("对应员工信息不存在！");
        }
        employerRepository.updateDelFlag(id);

        Date now = new Date();

        TbEmployerAdjustHistory employerAdjustHistory = new TbEmployerAdjustHistory();
        employerAdjustHistory.setCreateDate(now);
        employerAdjustHistory.setLastModified(now);
        employerAdjustHistory.setOperateUserId(valueHolder.getUserIdHolder());
        employerAdjustHistory.setOperateInfo("删除人员信息");
        employerAdjustHistory.setEmployerId(id);
        employerAdjustHistoryRepository.save(employerAdjustHistory);
    }

    @Override
    public PageList<TbEmployerAdjustHistory> getChangeHistory(AdjustHistoryRequest param) throws Exception {
        PageList<TbEmployerAdjustHistory> page = employerAdjustHistoryRepositoryCustom.list(param.getId(), param.getPage(), param.getRows());
        if (page != null && page.getRows() != null) {
            for (TbEmployerAdjustHistory h : page.getRows()) {
                h.setEmployerTypeStr(EmployerTyepEnum.getName(h.getEmployerType()));
                h.setOnJobStateStr(EmployerOnJobStateEnum.getName(h.getOnJobState()));
            }
        }
        return page;
    }

    @Override
    public TbEmployerAdjustHistory getAdjustHistoryDetail(Long id) {
        return employerAdjustHistoryRepository.findOne(id);
    }

    private void addEmployerValidate(TbEmployer param) {
        if (StringUtil.isEmpty(param.getEmployerName())) {
            throw new BusinessException("姓名不能为空！");
        }
        if (!Arrays.asList(0, 1).contains(param.getGender())) {
            throw new BusinessException("性别错误！");
        }
        if (StringUtil.isEmpty(param.getIdCardNo())) {
            throw new BusinessException("身份证错误！");
        }
        TbEmployer employer = employerRepository.findByIdCardNo(param.getIdCardNo());
        if (employer != null) {
            throw new BusinessException("身份证" + param.getIdCardNo() + "重复！");
        }
        if (param.getBirthdayDate() == null) {
            throw new BusinessException("生日不能为空！");
        }
        if (StringUtil.isEmpty(param.getPhone())) {
            throw new BusinessException("手机号不能为空！");
        }
        if (StringUtil.isEmpty(param.getNativePlace())) {
            throw new BusinessException("籍贯不能为空！");
        }
        if (StringUtil.isEmpty(param.getNowPlace())) {
            throw new BusinessException("现住地址不能为空！");
        }
        if (StringUtil.isEmpty(param.getDepartment())) {
            throw new BusinessException("部门不能为空！");
        }
        if (StringUtil.isEmpty(param.getPosition())) {
            throw new BusinessException("职位不能为空！");
        }
        if (param.getEntryCompanyTime() == null) {
            throw new BusinessException("入职时间不能为空！");
        }
        if (StringUtil.isEmpty(param.getEmergencyContactPeople())) {
            throw new BusinessException("紧急联系人不能为空！");
        }
        if (StringUtil.isEmpty(param.getEmergencyContactPeoplePhone())) {
            throw new BusinessException("紧急联系人手机不能为空！");
        }
    }

    private void addEmployerSalaryInit(TbEmployer param) {
        param.setEntryCompanyTime(param.getEntryCompanyTime());
        param.setBecomeRegularTime(null);
        param.setQuitTime(null);
        param.setSalaryAmount(BigDecimal.ZERO);
        param.setSubsidyAmount(BigDecimal.ZERO);
        param.setSocialSecurityAmountPersonal(BigDecimal.ZERO);
        param.setSocialSecurityAmountCompany(BigDecimal.ZERO);
        param.setAccumulationFundAmountPersonal(BigDecimal.ZERO);
        param.setAccumulationFundAmountCompany(BigDecimal.ZERO);
        param.setIncomeDesc(null);
    }
}