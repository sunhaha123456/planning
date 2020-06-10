package com.rose.controler;

import com.rose.common.exception.BusinessException;
import com.rose.common.util.DateUtil;
import com.rose.common.util.StringUtil;
import com.rose.service.CompanyInOutService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;
import java.util.Map;

/**
 * 描述：财务报表 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/financeReport")
public class FinanceReportControler {

    @Inject
    private CompanyInOutService companyInOutService;

    @GetMapping(value= "/getReports")
    public Map<String, Object> getReports(@RequestParam(required = false) String year) throws Exception {
        if (StringUtil.isEmpty(year)) {
            throw new BusinessException("请输入年份！");
        }
        if (DateUtil.format(year, "yyyy") == null) {
            throw new BusinessException("年份时间格式错误！");
        }
        return companyInOutService.getReports(year);
    }
}