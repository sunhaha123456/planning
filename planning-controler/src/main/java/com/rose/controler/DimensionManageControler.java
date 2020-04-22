package com.rose.controler;

import com.rose.data.entity.TbDimension;
import com.rose.service.DimensionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/user/dimensionManage")
public class DimensionManageControler {

    @Inject
	private DimensionService dimensionService;

    @GetMapping(value = "/getDetail")
    public TbDimension getDetail(@RequestParam Long id) {
        return dimensionService.getDetail(id);
    }

    @GetMapping(value = "/getDimensionTree")
    public List<TbDimension> getDimensionTree(@RequestParam Long pid) {
        return dimensionService.getDimensionTree(pid);
    }

    @PostMapping(value= "/save")
    public TbDimension save(@RequestBody TbDimension param) {
        return dimensionService.save(param);
    }
}