package com.rose.controler;

import com.rose.data.entity.TbForm;
import com.rose.service.FormService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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

    @GetMapping(value = "/getDetail")
    public TbForm getDetail(@RequestParam Long id) {
        return formService.getDetail(id);
    }
}