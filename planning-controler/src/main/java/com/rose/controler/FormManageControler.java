package com.rose.controler;

import com.rose.data.entity.TbDimension;
import com.rose.data.entity.TbForm;
import com.rose.service.FormService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/user/formManage")
public class FormManageControler {

    @Inject
	private FormService formService;

    @GetMapping(value = "/getFormTree")
    public List<TbForm> getFormTree() {
        return formService.getFormTree();
    }

    @GetMapping(value = "/getFormDetail")
    public TbForm getFormDetail(@RequestParam Long id) {
        return formService.getFormDetail(id);
    }

    @GetMapping(value = "/getDimDetail")
    public TbDimension getDimDetail(@RequestParam Long id) {
        return formService.getDimDetail(id);
    }

    @GetMapping(value = "/deleteForm")
    public void deleteForm(@RequestParam Long id) {
        formService.deleteForm(id);
    }

    @PostMapping(value = "/saveFormName")
    public TbForm saveFormName(@RequestBody TbForm form) {
        return formService.saveFormName(form);
    }

    @GetMapping(value = "/getDimensionTreeByPid")
    public List<TbDimension> getDimensionTreeByPid(@RequestParam Long pid) {
        return formService.getDimensionTree(pid);
    }

    @GetMapping(value = "/getRowColDimensionTree")
    public List<TbDimension> getRowColDimensionTree(@RequestParam Long formId, @RequestParam Integer type) {
        return formService.getRowColDimensionTree(formId, type);
    }

    @GetMapping(value = "/deleteDim")
    public void deleteDim(@RequestParam Long formId, @RequestParam Long dimId, @RequestParam Integer type) {
        formService.deleteDim(formId, dimId, type);
    }
}