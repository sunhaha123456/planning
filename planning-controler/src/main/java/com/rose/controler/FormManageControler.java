package com.rose.controler;

import com.rose.service.FormService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;

@Slf4j
@RestController
@RequestMapping("/user/formManage")
public class FormManageControler {

    @Inject
	private FormService formService;

}