package com.rose.service;

import com.rose.data.entity.TbForm;

import java.util.List;

public interface FormService {
    List<TbForm> getFormTree();

    TbForm getDetail(Long id);
}