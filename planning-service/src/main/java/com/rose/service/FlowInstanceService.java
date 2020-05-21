package com.rose.service;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbFlowInstanceOperateHistory;
import com.rose.data.to.request.FlowInstanceRequest;
import com.rose.data.to.response.FlowChartResponse;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface FlowInstanceService {

    PageList<TbFlowInstance> searchFlowInstance(FlowInstanceRequest param) throws Exception;

    void operateInstance(Long id, Integer type);

    TbFlowInstance getFlowInstanceDetail(Long id);

    PageList<TbFlowInstanceOperateHistory> getOperateInfo(FlowInstanceRequest param) throws Exception;

    FlowChartResponse getFlowInstanceFlowChart(Long id);

    void startApply(Long templateId, String instanceName, String applyContent, List<MultipartFile> fileList) throws IOException;
}