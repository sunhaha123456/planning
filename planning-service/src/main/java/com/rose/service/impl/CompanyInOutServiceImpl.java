package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.BigDecimalUtil;
import com.rose.common.util.DateUtil;
import com.rose.common.util.StringUtil;
import com.rose.common.util.ValueHolder;
import com.rose.data.constant.SystemConstant;
import com.rose.data.entity.TbCompanyInOut;
import com.rose.data.entity.TbSysUser;
import com.rose.data.entity.TbSystemSetting;
import com.rose.data.to.request.CompanyInOutSearchRequest;
import com.rose.data.to.response.SimpleHistogramResponse;
import com.rose.data.to.vo.MonthEntryVo;
import com.rose.repository.CompanyInOutRepository;
import com.rose.repository.CompanyInOutRepositoryCustom;
import com.rose.repository.SysUserRepository;
import com.rose.repository.SystemSettingRepository;
import com.rose.service.CompanyInOutService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

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
    private SystemSettingRepository systemSettingRepository;
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
        lockTimeValiate(param.getEntryHappenDate());
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
        TbCompanyInOut res = companyInOutRepository.findOne(id);
        if (res == null) {
            throw new BusinessException("对应记录已不存在！");
        }
        lockTimeValiate(res.getEntryHappenDate());
        companyInOutRepository.updateDelFlag(id, new Date());
    }

    @Override
    public Map<String, Object> getReports(String year) throws Exception {
        Map<String, Object> res = new HashMap<>();

        SimpleHistogramResponse spend = new SimpleHistogramResponse();
        spend.setTitle(year + "年支出统计");
        spend.setLegend("支出");

        SimpleHistogramResponse income = new SimpleHistogramResponse();
        income.setTitle(year + "年营收统计");
        income.setLegend("营收");

        SimpleHistogramResponse profit = new SimpleHistogramResponse();
        profit.setTitle(year + "年利润统计");
        profit.setLegend("利润");

        List<String> xAxisList = Arrays.asList(
                "1月", "2月", "3月", "4月", "5月", "6月",
                "7月", "8月", "9月", "10月", "11月", "12月"
        );
        spend.setXaxisList(xAxisList);
        income.setXaxisList(xAxisList);
        profit.setXaxisList(xAxisList);

        List<BigDecimal> valueZeroList = Arrays.asList(
                BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO,
                BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO
        );

        List<MonthEntryVo> monthEntryList = companyInOutRepositoryCustom.listByMonth(year);
        if (monthEntryList != null && monthEntryList.size() > 0) {
            Map<String, BigDecimal> monthEntryMap = monthEntryList.stream().collect(Collectors.toMap(MonthEntryVo::getMonthTypeFlag, MonthEntryVo :: getAmount));
            List<BigDecimal> valueSpendList = new ArrayList<>();
            List<BigDecimal> valueIncodeList = new ArrayList<>();
            List<BigDecimal> valueProfitList = new ArrayList<>();

            // 类别 0支出 1营收 2利润
            handleValueList(valueSpendList, monthEntryMap, 0);
            handleValueList(valueSpendList, monthEntryMap, 1);
            handleValueList(valueSpendList, monthEntryMap, 2);

            spend.setValueList(valueSpendList);
            income.setValueList(valueIncodeList);
            profit.setValueList(valueProfitList);
        } else {
            spend.setValueList(valueZeroList);
            income.setValueList(valueZeroList);
            profit.setValueList(valueZeroList);
        }

        res.put("spend", spend);
        res.put("income", income);
        res.put("profit", profit);
        return res;
    }

    private void handleValueList(List<BigDecimal> valueList, Map<String, BigDecimal> monthEntryMap, int type) {
        BigDecimal temp = monthEntryMap.get("01" + type);
        valueList.add(temp != null ? temp : BigDecimal.ZERO);
        temp = monthEntryMap.get("02" + type);
        valueList.add(temp != null ? temp : BigDecimal.ZERO);
        temp = monthEntryMap.get("03" + type);
        valueList.add(temp != null ? temp : BigDecimal.ZERO);
        temp = monthEntryMap.get("04" + type);
        valueList.add(temp != null ? temp : BigDecimal.ZERO);
        temp = monthEntryMap.get("05" + type);
        valueList.add(temp != null ? temp : BigDecimal.ZERO);
        temp = monthEntryMap.get("06" + type);
        valueList.add(temp != null ? temp : BigDecimal.ZERO);
        temp = monthEntryMap.get("07" + type);
        valueList.add(temp != null ? temp : BigDecimal.ZERO);
        temp = monthEntryMap.get("08" + type);
        valueList.add(temp != null ? temp : BigDecimal.ZERO);
        temp = monthEntryMap.get("09" + type);
        valueList.add(temp != null ? temp : BigDecimal.ZERO);
        temp = monthEntryMap.get("10" + type);
        valueList.add(temp != null ? temp : BigDecimal.ZERO);
        temp = monthEntryMap.get("11" + type);
        valueList.add(temp != null ? temp : BigDecimal.ZERO);
        temp = monthEntryMap.get("12" + type);
        valueList.add(temp != null ? temp : BigDecimal.ZERO);
    }

    private void lockTimeValiate(Date entryHappenDate) {
        TbSystemSetting lockTimeSetting = systemSettingRepository.findBySystemKey(SystemConstant.COMPANY_IN_OUT_LOCK_TIME_KEY);
        if (lockTimeSetting != null && StringUtil.isNotEmpty(lockTimeSetting.getSystemValue())) {
            Date lockTime = DateUtil.formatStr2Time(lockTimeSetting.getSystemKey());
            if (lockTime != null) {
                if (entryHappenDate.getTime() <= lockTime.getTime()) {
                    throw new BusinessException("不能修改已锁定日期范围内的账目！");
                }
            }
        }
    }
}