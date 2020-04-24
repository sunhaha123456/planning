package com.rose.service.impl;

import com.rose.data.entity.TbForm;
import com.rose.repository.FormRepository;
import com.rose.service.FormService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Slf4j
@Service
public class FormServiceImpl implements FormService {

    @Inject
    private FormRepository formRepository;

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
}