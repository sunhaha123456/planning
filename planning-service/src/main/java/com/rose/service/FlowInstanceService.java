package com.rose.service;

import com.rose.common.data.base.PageList;
import com.rose.data.base.PageParam;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbFlowInstanceOperateHistory;
import com.rose.data.to.request.FlowInstanceRequest;
import com.rose.data.to.response.FlowChartResponse;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public interface FlowInstanceService {

    PageList<TbFlowInstance> searchFlowInstance(FlowInstanceRequest param) throws Exception;

    PageList<TbFlowInstance> searchApprovalApply(FlowInstanceRequest param) throws Exception;

    PageList<TbFlowInstance> searchWaitApproval(PageParam param) throws Exception;

    void operateInstanceByAdmin(Long id, Integer type);

    void operateInstanceByUser(Long id, Integer type);

    /**
     * 功能：获取流程实例详情
     * @param id
     * @param attachFileFlag 0不返回附件信息 1返回附件信息
     * @param startUserId
     * @return
     */
    TbFlowInstance getFlowInstanceDetail(Long id, Integer attachFileFlag, Long startUserId);

    PageList<TbFlowInstanceOperateHistory> getOperateInfo(FlowInstanceRequest param) throws Exception;

    FlowChartResponse getFlowInstanceFlowChart(Long id, Long startUserId);

    void startApply(Long templateId, String instanceName, String applyContent, List<MultipartFile> fileList) throws IOException;

    void exportFileFlowInstance(HttpServletResponse resp, Long instanceId, Long fileId, Long startUserId) throws Exception;
}