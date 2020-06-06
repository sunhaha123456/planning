package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbCompanyPaidSalary;
import com.rose.data.to.request.EmployerSalaryPaidSearchRequest;
import com.rose.service.EmployerSalaryPaidService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * 描述：工资薪酬模块的员工发薪录入 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/employerSalaryPaidEntry")
public class EmployerSalaryPaidEntryControler {

    @Inject
    private EmployerSalaryPaidService employerSalaryPaidService;

    @PostMapping(value= "/search")
    public PageList<TbCompanyPaidSalary> search(@RequestBody EmployerSalaryPaidSearchRequest param) throws Exception {
        return employerSalaryPaidService.search(param);
    }

    @GetMapping(value= "/getEmployerSalaryPaid")
    public TbCompanyPaidSalary getEmployer(@RequestParam Long id) throws Exception {
        return employerSalaryPaidService.getEmployer(id);
    }
}