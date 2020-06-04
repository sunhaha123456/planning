package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.data.entity.TbEmployer;
import com.rose.data.entity.TbEmployerAdjustHistory;
import com.rose.data.to.request.AdjustHistoryRequest;
import com.rose.data.to.request.EmployerSearchRequest;
import com.rose.service.EmployerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * 描述：人员档案 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/employerArchive")
public class EmployerArchiveControler {

    @Inject
    private EmployerService employerService;

    @Value("${file.upload.maxSize}")
    private Long fileMaxSize;

    @PostMapping(value= "/search")
    public PageList<TbEmployer> search(@RequestBody EmployerSearchRequest param) throws Exception {
        return employerService.search(param);
    }

    @GetMapping(value= "/getEmployer")
    public TbEmployer getEmployer(@RequestParam Long id) throws Exception {
        return employerService.getEmployer(id, true);
    }

    @PostMapping(value= "/getAdjustHistory")
    public PageList<TbEmployerAdjustHistory> getChangeHistory(@RequestBody AdjustHistoryRequest param) throws Exception {
        if (param == null || param.getId() == null) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        return employerService.getChangeHistory(param);
    }
}