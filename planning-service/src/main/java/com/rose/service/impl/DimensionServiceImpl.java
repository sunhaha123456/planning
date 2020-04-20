package com.rose.service.impl;

import com.rose.data.entity.TbDimension;
import com.rose.data.entity.TbMenu;
import com.rose.repository.DimensionRepository;
import com.rose.service.DimensionService;
import com.rose.service.MenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Slf4j
@Service
public class DimensionServiceImpl implements DimensionService {

    @Inject
    private DimensionRepository dimensionRepository;

    @Inject
    private MenuService menuService;

    @Override
    public List<TbDimension> getDimensionTree() {
        List<TbMenu> list = menuService.getMenuTreeByRoleId(2L);
        for (TbMenu menu : list) {
            menu.setIconCls("");
        }
        return null;
    }
}