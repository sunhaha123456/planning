package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.data.constant.SystemConstant;
import com.rose.data.entity.TbCompanyInOut;
import com.rose.data.entity.TbSystemSetting;
import com.rose.data.to.request.CompanyInOutSearchRequest;
import com.rose.service.CompanyInOutService;
import com.rose.service.SystemSettingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * 描述：公司收支管理 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/financeInOutManage")
public class FinanceInOutManageControler {

    @Inject
    private CompanyInOutService companyInOutService;
    @Inject
    private SystemSettingService systemSettingService;

    @PostMapping(value= "/search")
    public PageList<TbCompanyInOut> search(@RequestBody CompanyInOutSearchRequest param) throws Exception {
        return companyInOutService.search(param);
    }

    @GetMapping(value= "/getDetail")
    public TbCompanyInOut getDetail(@RequestParam Long id) {
        return companyInOutService.getDetail(id);
    }

    @PostMapping(value= "/delete")
    public void delete(@RequestParam Long id) {
        companyInOutService.delete(id);
    }

    @GetMapping(value= "/getLockTime")
    public TbSystemSetting getLockTime() {
        return systemSettingService.getBySystemKey(SystemConstant.COMPANY_IN_OUT_LOCK_TIME_KEY);
    }

    @PostMapping(value= "/updateLockTime")
    public void updateLockTime(@RequestParam(required = false) String lockTime) {
        systemSettingService.updateBySystemKey(SystemConstant.COMPANY_IN_OUT_LOCK_TIME_KEY, lockTime);
    }
}