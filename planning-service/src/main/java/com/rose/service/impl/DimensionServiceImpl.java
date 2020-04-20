package com.rose.service.impl;

import com.rose.repository.DimensionRepository;
import com.rose.service.DimensionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Slf4j
@Service
public class DimensionServiceImpl implements DimensionService {

    @Inject
    private DimensionRepository dimensionRepository;

}