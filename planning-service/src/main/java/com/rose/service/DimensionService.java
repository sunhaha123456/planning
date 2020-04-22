package com.rose.service;

import com.rose.data.entity.TbDimension;

import java.util.List;

public interface DimensionService {
    TbDimension getDetail(Long id);
    List<TbDimension> getDimensionTree(Long pid);
    TbDimension save(TbDimension param);
}