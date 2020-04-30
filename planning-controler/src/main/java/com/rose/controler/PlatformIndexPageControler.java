package com.rose.controler;

import com.rose.service.PlatformIndexPageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;

/**
 * 功能：平台首页 controller
 * @author sunpeng
 * @date 2018
 */
@Slf4j
@RestController
@RequestMapping("/user/platformIndexPage")
public class PlatformIndexPageControler {

    @Inject
	private PlatformIndexPageService platformIndexPageService;

}