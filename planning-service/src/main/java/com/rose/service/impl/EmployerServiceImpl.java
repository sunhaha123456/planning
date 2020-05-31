package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbEmployer;
import com.rose.data.enums.EmployerHighestEducationEnum;
import com.rose.data.enums.EmployerOnJobStateEnum;
import com.rose.data.enums.EmployerTyepEnum;
import com.rose.data.to.request.EmployerSearchRequest;
import com.rose.repository.EmployerRepository;
import com.rose.repository.EmployerRepositoryCustom;
import com.rose.service.EmployerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class EmployerServiceImpl implements EmployerService {

    @Inject
    private EmployerRepository employerRepository;
    @Inject
    private EmployerRepositoryCustom employerRepositoryCustom;

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
    public void save(TbEmployer param) {
        validateEmployer(param);
        Date now = new Date();
        if (param.getId() == null) {
            param.setCreateDate(now);
            param.setLastModified(now);
            param.setDelFlag(0);
        } else {
            TbEmployer employer = employerRepository.findOne(param.getId());
            if (employer == null) {
                throw new BusinessException(ResponseResultCode.PARAM_ERROR);
            }
            param.setCreateDate(employer.getCreateDate());
            param.setLastModified(now);
            param.setBecomeRegularTime(employer.getBecomeRegularTime());
            param.setBecomeRegularTime(employer.getBecomeRegularTime());
            param.setQuitTime(employer.getQuitTime());
            param.setSalaryAmount(employer.getSalaryAmount());
            param.setSalaryDesc(employer.getSalaryDesc());
            param.setSubsidyAmount(employer.getSubsidyAmount());
            param.setSubsidyDesc(employer.getSubsidyDesc());
            param.setSocialSecurityAmountPersonal(employer.getSocialSecurityAmountPersonal());
            param.setSocialSecurityDescPersonal(employer.getSocialSecurityDescPersonal());
            param.setSocialSecurityAmountCompany(employer.getSocialSecurityAmountCompany());
            param.setSocialSecurityDescCompany(employer.getSocialSecurityDescCompany());
            param.setAccumulationFundAmountPersonal(employer.getAccumulationFundAmountPersonal());
            param.setAccumulationFundDescPersonal(employer.getAccumulationFundDescPersonal());
            param.setAccumulationFundAmountCompany(employer.getAccumulationFundAmountCompany());
            param.setAccumulationFundDescCompany(employer.getAccumulationFundDescCompany());
            param.setEmployerRemark(employer.getEmployerRemark());
            param.setDelFlag(employer.getDelFlag());
        }
        employerRepository.save(param);
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
            employerRet.setSalaryDesc(null);
            employerRet.setSubsidyAmount(null);
            employerRet.setSubsidyDesc(null);
            employerRet.setSocialSecurityAmountPersonal(null);
            employerRet.setSocialSecurityDescPersonal(null);
            employerRet.setSocialSecurityAmountCompany(null);
            employerRet.setSocialSecurityDescCompany(null);
            employerRet.setAccumulationFundAmountPersonal(null);
            employerRet.setAccumulationFundDescPersonal(null);
            employerRet.setAccumulationFundAmountCompany(null);
            employerRet.setAccumulationFundDescCompany(null);
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
            try {
                validateEmployer(employer);
            } catch (BusinessException e) {
                e.setMsg("第" + (x + 2) + "行，" + e.getMsg());
                throw e;
            }
        }
        employerRepository.save(list);
    }

    private void validateEmployer(TbEmployer param) {
        if (StringUtil.isEmpty(param.getEmployerName())) {
            throw new BusinessException("姓名不能为空！");
        }
        if (!Arrays.asList(0, 1).contains(param.getGender())) {
            throw new BusinessException("性别错误！");
        }
        if (StringUtil.isEmpty(param.getIdCardNo())) {
            throw new BusinessException("身份证错误！");
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
        if (StringUtil.isEmpty(param.getGraduatedSchool())) {
            throw new BusinessException("毕业院校不能为空！");
        }
        if (param.getGraduatedDate() == null) {
            throw new BusinessException("毕业时间不能为空！");
        }
        if (StringUtil.isEmpty(param.getEmergencyContactPeople())) {
            throw new BusinessException("紧急联系人不能为空！");
        }
        if (StringUtil.isEmpty(param.getEmergencyContactPeoplePhone())) {
            throw new BusinessException("紧急联系人手机不能为空！");
        }
    }
}