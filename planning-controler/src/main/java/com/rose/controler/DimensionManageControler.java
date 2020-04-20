package com.rose.controler;

import com.rose.service.DimensionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;

@Slf4j
@RestController
@RequestMapping("/user/dimensionManage")
public class DimensionManageControler {

    @Inject
	private DimensionService dimensionService;

}