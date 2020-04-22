package com.rose.service.impl;

import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbDimension;
import com.rose.repository.DimensionRepository;
import com.rose.service.DimensionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class DimensionServiceImpl implements DimensionService {

    @Inject
    private DimensionRepository dimensionRepository;

    @Override
    public TbDimension getDetail(Long id) {
        return dimensionRepository.findOne(id);
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

    @Transactional(rollbackFor = Exception.class)
    @Override
    public TbDimension save(TbDimension param) {
        Date now = new Date();

        switch (param.getSaveType()) {
            case 0: { // 新增维度
                TbDimension res = new TbDimension();

                res.setDimensionName(param.getDimensionName());
                res.setCreateDate(now);
                res.setLastModified(now);
                res.setDimensionLevel(0);
                res.setPid(0L);
                res.setDataType(0);

                dimensionRepository.save(res);
                res.setTotalCode(res.getId() + "");

                return res;
            }
            case 1: { // 新增维度成员
                if (param.getDataType() != 1 && param.getDataType() != 2) {
                    throw new BusinessException("维度成员只能是数值或文本！");
                }

                TbDimension res = new TbDimension();

                res.setDimensionName(param.getDimensionName());
                res.setCreateDate(now);
                res.setLastModified(now);

                res.setPid(param.getPid());
                res.setDataType(param.getDataType());
                dimensionRepository.save(res);

                TbDimension pDim = dimensionRepository.findOne(param.getPid());
                res.setDimensionLevel(pDim.getDimensionLevel() + 1);
                res.setTotalCode(pDim.getTotalCode() + "," + res.getId());

                dimensionRepository.updateDataType(param.getPid(), 0);

                return res;
            }
            case 2: { // 编辑
                TbDimension dim = dimensionRepository.findOne(param.getId());

                dim.setLastModified(now);
                dim.setDimensionName(param.getDimensionName());
                if (dim.getDimensionLevel() != 0 && !dim.getDataType().equals(param.getDataType())) {
                    List<TbDimension> childList = dimensionRepository.listChilds(dim.getTotalCode() + ",%");
                    if (childList == null || childList.size() == 0) { // 没有子项
                        if (param.getDataType() == 0) {
                            throw new BusinessException("没有子项的维度成员数据类型不能是聚集！");
                        }
                    } else { // 有子项
                        if (param.getDataType() != 0) {
                            throw new BusinessException("有子项的维度成员数据类型只能是聚集！");
                        }
                    }
                    dim.setDataType(param.getDataType());
                }

                dimensionRepository.save(dim);

                return dim;
            }
            default: {
                throw new BusinessException(ResponseResultCode.PARAM_ERROR);
            }
        }
    }
}