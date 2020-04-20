package com.rose.controler;

import com.rose.data.entity.TbDimension;
import com.rose.service.DimensionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/user/dimensionManage")
public class DimensionManageControler {

    @Inject
	private DimensionService dimensionService;

    @GetMapping(value = "/getDimensionTree")
    public List<TbDimension> getMenuTreeByRoleId() {
        return dimensionService.getDimensionTree();
    }
}