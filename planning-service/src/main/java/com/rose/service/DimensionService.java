package com.rose.service;

import com.rose.data.entity.TbDimension;

import java.util.List;

public interface DimensionService {
    List<TbDimension> getDimensionTree();
}