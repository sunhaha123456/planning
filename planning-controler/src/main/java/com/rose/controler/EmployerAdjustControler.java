package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbEmployer;
import com.rose.data.to.request.EmployerSearchRequest;
import com.rose.service.EmployerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * 描述：人员调整 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/employerAdjust")
public class EmployerAdjustControler {

    @Inject
    private EmployerService employerService;

    @Value("${file.upload.maxSize}")
    private Long fileMaxSize;

    @PostMapping(value= "/search")
    public PageList<TbEmployer> search(@RequestBody EmployerSearchRequest param) throws Exception {
        return employerService.search(param);
    }

    @PostMapping(value= "/updateEmployerInfo")
    public void updateEmployerInfo(@RequestBody TbEmployer param) {
        employerService.updateEmployerInfo(param);
    }

    @GetMapping(value= "/getEmployer")
    public TbEmployer getEmployer(@RequestParam Long id) throws Exception {
        return employerService.getEmployer(id, false);
    }

    @PostMapping(value= "/delete")
    public void delete(@RequestParam Long id) {
        employerService.delete(id);
    }
}