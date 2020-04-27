package com.rose.service;

import com.rose.data.entity.TbDimension;
import com.rose.data.entity.TbForm;

import java.util.List;

public interface FormService {

    List<TbForm> getFormTree();

    TbForm getFormDetail(Long id);

    TbDimension getDimDetail(Long id);

    void deleteForm(Long id);

    TbForm saveFormName(TbForm form);

    List<TbDimension> getDimensionTree(Long pid);

    List<TbDimension> getRowColDimensionTree(Long formId, Integer type);

    void deleteDim(Long formId, Long dimId, Integer type);
}