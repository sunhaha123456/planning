package com.rose.controler;

import com.rose.service.SelfOfficeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;

/**
 * 描述：首页 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/indexPage")
public class IndexPageControler {

    @Inject
	private SelfOfficeService selfOfficeService;

}