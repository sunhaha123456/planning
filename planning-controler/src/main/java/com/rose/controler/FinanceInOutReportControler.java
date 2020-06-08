package com.rose.controler;

import com.rose.service.CompanyInOutService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;

/**
 * 描述：财务报表 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/financeInOutReport")
public class FinanceInOutReportControler {

    @Inject
    private CompanyInOutService companyInOutService;

}