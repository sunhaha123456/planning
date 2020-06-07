package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.common.util.FileUtil;
import com.rose.common.util.excel.ExcelUtil;
import com.rose.common.util.excel.HssfExcelUtil;
import com.rose.data.entity.TbCompanyPaidSalary;
import com.rose.data.to.request.EmployerSalaryPaidSearchRequest;
import com.rose.data.to.vo.EmployerSalaryTemplateExportVo;
import com.rose.service.EmployerSalaryPaidService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.util.Arrays;
import java.util.List;

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

    @Value("${file.upload.maxSize}")
    private Long fileMaxSize;

    @PostMapping(value= "/search")
    public PageList<TbCompanyPaidSalary> search(@RequestBody EmployerSalaryPaidSearchRequest param) throws Exception {
        return employerSalaryPaidService.search(param);
    }

    @GetMapping(value= "/getEmployerSalaryPaid")
    public TbCompanyPaidSalary getEmployer(@RequestParam Long id) throws Exception {
        return employerSalaryPaidService.getEmployer(id);
    }

    /**
     * 功能：Excel 导出
     * @throws Exception
     */
    @GetMapping(value = "/exportFileSalaryTemplate")
    public void exportFileSalaryTemplate(HttpServletResponse response) {
        try {
            ExcelUtil excelUtil = new HssfExcelUtil();
            excelUtil.writeExcel(response, "未离职员工工资模板", "未离职员工工资模板", employerSalaryPaidService.getEmployerSalaryTemplateList());
        } catch (Exception e) {
            log.error("导出报错：{}", e);
        }
    }

    @PostMapping("/importFile")
    public void importFile(@RequestParam(value = "salaryExcelFile") MultipartFile salaryExcelFile) throws Exception {
        FileUtil.fileValidate(Arrays.asList(salaryExcelFile), fileMaxSize);

        InputStream is = salaryExcelFile.getInputStream();
        if (!is.markSupported()) {
            is = new PushbackInputStream(is, 8);
        }
        ExcelUtil excelUtil = ExcelUtil.create(is);
        List<EmployerSalaryTemplateExportVo> list = excelUtil.readExcel(EmployerSalaryTemplateExportVo.class, 0, true);

        employerSalaryPaidService.importSalaryList(list);
    }
}