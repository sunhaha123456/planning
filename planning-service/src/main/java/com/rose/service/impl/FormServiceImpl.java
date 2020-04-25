package com.rose.service.impl;

import com.rose.data.entity.TbDimension;
import com.rose.data.entity.TbForm;
import com.rose.repository.DimensionRepository;
import com.rose.repository.FormRepository;
import com.rose.service.FormService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.persistence.Transient;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class FormServiceImpl implements FormService {

    @Inject
    private FormRepository formRepository;

    @Inject
    private DimensionRepository dimensionRepository;

    @Override
    public List<TbForm> getFormTree() {
        List<TbForm> formList = formRepository.listAll();
        if (formList != null && formList.size() > 0) {
            for (TbForm f : formList) {
                f.setText(f.getFormName());
            }
        }

        return formList;
    }

    @Override
    public TbForm getDetail(Long id) {
        TbForm form = formRepository.findOne(id);

        List<TbDimension> rowList = dimensionRepository.listFormRowDim(id);
        List<TbDimension> colList = dimensionRepository.listFormColDim(id);

        form.setRowList(rowList);
        form.setColList(colList);

        return form;
    }
}