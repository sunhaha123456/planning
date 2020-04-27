package com.rose.service.impl;

import com.rose.common.exception.BusinessException;
import com.rose.data.entity.TbDimension;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.entity.TbForm;
import com.rose.repository.*;
import com.rose.service.FormService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class FormServiceImpl implements FormService {

    @Inject
    private FormRepository formRepository;
    @Inject
    private FormDataRepository formDataRepository;
    @Inject
    private DimensionRepository dimensionRepository;
    @Inject
    private FlowTemplateRepositoryCustom flowTemplateRepositoryCustom;
    @Inject
    private FlowInstanceRepositoryCustom flowInstanceRepositoryCustom;

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
    public TbForm getFormDetail(Long id) {
        TbForm form = formRepository.findOne(id);

        List<TbDimension> rowList = dimensionRepository.listFormRowDim(id);
        List<TbDimension> colList = dimensionRepository.listFormColDim(id);

        form.setRowList(rowList);
        form.setColList(colList);

        return form;
    }

    @Override
    public TbDimension getDimDetail(Long id) {
        return dimensionRepository.findOne(id);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteForm(Long id) {
        List<TbFlowTemplate> flowTemplateList = flowTemplateRepositoryCustom.queryByFormId(id);
        if (flowTemplateList != null && flowTemplateList.size() > 0 ) {
            throw new BusinessException(flowTemplateList.get(0).getTemplateName() + " 下挂载着表单！");
        }

        List<TbFlowInstance> flowInstanceList = flowInstanceRepositoryCustom.queryByFormId(id);
        if (flowInstanceList != null && flowInstanceList.size() > 0 ) {
            throw new BusinessException(flowInstanceList.get(0).getInstanceName() + " 下挂载着表单！");
        }

        formRepository.delete(id);
        formDataRepository.delete(id);
        dimensionRepository.deleteByFormId(id);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public TbForm saveFormName(TbForm param) {
        Long id = param.getId();
        String formName = param.getFormName();
        Date now = new Date();
        if (id == null) {
            TbForm form = new TbForm();
            form.setCreateDate(now);
            form.setLastModified(now);
            form.setFormName(formName);
            return formRepository.save(form);
        } else {
            formRepository.updateFormName(id, formName);
            return param;
        }
    }

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

    @Override
    public List<TbDimension> getRowColDimensionTree(Long formId, Integer type) {
        if (type == 0) { // 行

        } else { // 列

        }

        return null;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteDim(Long formId, Long dimId, Integer type) {
        TbDimension dim = dimensionRepository.findOne(dimId);

        List<Long> dimIdList = dimensionRepository.findByTotalCode(dim.getTotalCode() + ",%");
        if (dimIdList == null) {
            dimIdList = new ArrayList<>();
        }
        dimIdList.add(dim.getId());

        //dimensionRepository.delete(dim.getId());
        //dimensionRepository.deleteByTotalCode(dim.getTotalCode() + ",%");

        dimensionRepository.deleteByIdList(dimIdList);

        Long pid = dim.getPid();
        if (pid != 0) {
            TbDimension pDim = dimensionRepository.findOne(pid);
            List<TbDimension> childList = dimensionRepository.listByTotalCode(pDim.getTotalCode() + ",%");
            if (childList == null || childList.size() == 0) { // 没有子项
                dimensionRepository.updateDataType(pid, 1);
            }
        }

        if (type == 0) {
            formDataRepository.deleteByRowDimId(formId, dimIdList);
        } else {
            formDataRepository.deleteByColDimId(formId, dimIdList);
        }
    }
}