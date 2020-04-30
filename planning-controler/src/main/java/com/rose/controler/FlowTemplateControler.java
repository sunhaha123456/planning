package com.rose.controler;

import com.rose.service.FlowTemplateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;

/**
 * 描述：流程模板 controler
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/flowTemplate")
public class FlowTemplateControler {

    @Inject
	private FlowTemplateService flowTemplateService;

}