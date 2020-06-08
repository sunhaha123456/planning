package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbCompanyInOut;
import com.rose.data.to.request.CompanyInOutSearchRequest;
import com.rose.service.CompanyInOutService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * 描述：公司收支录入 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/financeInOutEntry")
public class FinanceInOutEntryControler {

    @Inject
    private CompanyInOutService companyInOutService;

    @PostMapping(value= "/search")
    public PageList<TbCompanyInOut> search(@RequestBody CompanyInOutSearchRequest param) throws Exception {
        return companyInOutService.search(param);
    }

    @GetMapping(value= "/getDetail")
    public TbCompanyInOut getDetail(@RequestParam Long id) {
        return companyInOutService.getDetail(id);
    }

    @PostMapping(value= "/add")
    public void add(@RequestBody TbCompanyInOut param) {
        companyInOutService.add(param);
    }
}