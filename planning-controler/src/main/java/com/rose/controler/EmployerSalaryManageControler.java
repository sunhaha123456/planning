package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.data.entity.TbEmployer;
import com.rose.data.entity.TbFlowInstanceOperateHistory;
import com.rose.data.to.request.EmployerSearchRequest;
import com.rose.data.to.request.FlowInstanceRequest;
import com.rose.service.EmployerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * 描述：薪酬岗位管理 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/employerSalaryManage")
public class EmployerSalaryManageControler {

    @Inject
    private EmployerService employerService;

    @PostMapping(value= "/search")
    public PageList<TbEmployer> search(@RequestBody EmployerSearchRequest param) throws Exception {
        return employerService.search(param);
    }

    @GetMapping(value= "/getEmployer")
    public TbEmployer getEmployer(@RequestParam Long id) throws Exception {
        return employerService.getEmployer(id, true);
    }

    @PostMapping(value= "/updateEmployerSalaryPosition")
    public void updateEmployerSalaryPosition(@RequestBody TbEmployer param) {
        employerService.updateEmployerSalaryPosition(param);
    }
}