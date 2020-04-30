package com.rose.controler;

import com.rose.service.FlowInstanceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;

/**
 * 描述：流程实例 controler
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/flowInstance")
public class FlowInstanceControler {

    @Inject
	private FlowInstanceService flowInstanceService;

}