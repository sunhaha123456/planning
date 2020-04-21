package com.rose.service.impl;

import com.rose.data.entity.TbDimension;
import com.rose.data.entity.TbMenu;
import com.rose.repository.DimensionRepository;
import com.rose.service.DimensionService;
import com.rose.service.MenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class DimensionServiceImpl implements DimensionService {

    @Inject
    private DimensionRepository dimensionRepository;

    @Override
    public List<TbDimension> getDimensionTree(Long pid) {
        List<TbDimension> resList = dimensionRepository.listByPid(pid);
        if (resList != null && resList.size() > 0) {
            for (TbDimension d : resList) {
                d.setText(d.getDimensionName());
                if (d.getDataType() == 0) {
                    d.setState("closed");
                }
            }
        }
        return resList;
    }
}