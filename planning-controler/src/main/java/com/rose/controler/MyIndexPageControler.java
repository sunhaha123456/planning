package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.data.base.PageParam;
import com.rose.data.constant.SystemConstant;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbFlowInstanceOperateHistory;
import com.rose.data.entity.TbNotice;
import com.rose.data.entity.TbSystemSetting;
import com.rose.data.to.request.ApprovalApplyRequest;
import com.rose.data.to.request.FlowInstanceRequest;
import com.rose.data.to.request.NoticeSearchRequest;
import com.rose.data.to.response.FlowChartResponse;
import com.rose.service.FlowInstanceService;
import com.rose.service.PublishNoticeService;
import com.rose.service.SystemSettingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

/**
 * 描述：我的首页 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/myIndexPage")
public class MyIndexPageControler {

    @Inject
    private FlowInstanceService flowInstanceService;
    @Inject
    private PublishNoticeService publishNoticeService;
    @Inject
    private SystemSettingService systemSettingService;

    @GetMapping(value= "/getIndexPageShowNotice")
    public TbSystemSetting getIndexPageShowNotice() {
        return systemSettingService.getBySystemKey(SystemConstant.INDEX_PAGE_NOTICE_SHOW_KEY);
    }

    @PostMapping(value= "/searchNotice")
    public PageList<TbNotice> searchNotice(@RequestBody NoticeSearchRequest param) throws Exception {
        param.setStatus(1);
        return publishNoticeService.searchNotice(param);
    }

    @GetMapping(value= "/getNotice")
    public TbNotice getNotice(@RequestParam Long id) {
        return publishNoticeService.getNotice(id);
    }

    @PostMapping(value= "/searchWaitingApproval")
    public PageList<TbFlowInstance> searchWaitingApproval(@RequestBody PageParam param) throws Exception {
        return flowInstanceService.searchWaitingApproval(param);
    }

    /**
     * 功能：获取流程实例详情
     * @param id
     * @param attachFileFlag 0不返回附件信息 1返回附件信息
     * @return
     */
    @GetMapping(value= "/getFlowInstanceDetail")
    public TbFlowInstance getFlowInstanceDetail(@RequestParam Long id, @RequestParam(required = false, defaultValue = "0") Integer attachFileFlag) {
        return flowInstanceService.getFlowInstanceDetail(id, attachFileFlag, null);
    }

    @PostMapping(value= "/getOperateInfo")
    public PageList<TbFlowInstanceOperateHistory> getOperateInfo(@RequestBody FlowInstanceRequest param) throws Exception {
        if (param == null || param.getId() == null) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        return flowInstanceService.getOperateInfo(param);
    }

    @GetMapping(value= "/getFlowInstanceFlowChart")
    public FlowChartResponse getFlowInstanceFlowChart(@RequestParam Long id) {
        return flowInstanceService.getFlowInstanceFlowChart(id, null);
    }

    @GetMapping(value= "/exportFileFlowInstance")
    public void exportFileFlowInstance(HttpServletResponse resp, @RequestParam Long instanceId, @RequestParam Long fileId) throws Exception {
        flowInstanceService.exportFileFlowInstance(resp, instanceId, fileId, null);
    }

    @PostMapping(value= "/approvalApply")
    public synchronized void approvalApply(@RequestBody ApprovalApplyRequest param) {
        flowInstanceService.approvalApply(param);
    }
}