package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.common.util.FileUtil;
import com.rose.common.util.excel.ExcelUtil;
import com.rose.data.entity.TbEmployer;
import com.rose.data.to.request.EmployerSearchRequest;
import com.rose.service.EmployerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.util.Arrays;
import java.util.List;

/**
 * 描述：人员录入 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/employerEntry")
public class EmployerEntryControler {

    @Inject
    private EmployerService employerService;

    @Value("${file.upload.maxSize}")
    private Long fileMaxSize;

    @PostMapping(value= "/search")
    public PageList<TbEmployer> search(@RequestBody EmployerSearchRequest param) throws Exception {
        return employerService.search(param);
    }

    @PostMapping(value= "/add")
    public void add(@RequestBody TbEmployer param) {
        employerService.add(param);
    }

    @GetMapping(value= "/getEmployer")
    public TbEmployer getEmployer(@RequestParam Long id) throws Exception {
        return employerService.getEmployer(id, false);
    }

    @PostMapping("/importFile")
    public void importFile(@RequestParam(value = "userExcelFile") MultipartFile userExcelFile) throws Exception {
        FileUtil.fileValidate(Arrays.asList(userExcelFile), fileMaxSize);

        InputStream is = userExcelFile.getInputStream();
        if (!is.markSupported()) {
            is = new PushbackInputStream(is, 8);
        }
        ExcelUtil excelUtil = ExcelUtil.create(is);
        List<TbEmployer> list = excelUtil.readExcel(TbEmployer.class, 0, true, "userImport");

        employerService.importFile(list);
    }
}