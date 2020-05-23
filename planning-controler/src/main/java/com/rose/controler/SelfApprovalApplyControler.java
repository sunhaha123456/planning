package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.ValueHolder;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbFlowInstanceOperateHistory;
import com.rose.data.to.request.FlowInstanceRequest;
import com.rose.data.to.response.FlowChartResponse;
import com.rose.service.FlowInstanceService;
import com.rose.service.FlowTemplateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

/**
 * 描述：我审批的申请 controler
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/selfApprovalApply")
public class SelfApprovalApplyControler {

    @Inject
    private FlowTemplateService flowTemplateService;
    @Inject
	private FlowInstanceService flowInstanceService;
    @Inject
    private ValueHolder valueHolder;

    @PostMapping(value= "/searchFlowInstance")
    public PageList<TbFlowInstance> searchFlowInstance(@RequestBody FlowInstanceRequest param) throws Exception {
        if (param == null) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        param.setStartUserId(valueHolder.getUserIdHolder());
        return flowInstanceService.searchFlowInstance(param);
    }

    /**
     * 功能：对流程进行操作
     * @param id 流程实例id
     * @param type 0：撤销流程 1：删除流程
     * @return
     * @throws Exception
     */
    @PostMapping(value= "/operateInstance")
    public void operateInstance(@RequestParam Long id, @RequestParam Integer type) throws Exception {
        flowInstanceService.operateInstanceByUser(id, type);
    }

    /**
     * 功能：获取流程实例详情
     * @param id
     * @param attachFileFlag 0不返回附件信息 1返回附件信息
     * @return
     */
    @GetMapping(value= "/getFlowInstanceDetail")
    public TbFlowInstance getFlowInstanceDetail(@RequestParam Long id, @RequestParam(required = false, defaultValue = "0") Integer attachFileFlag) {
        return flowInstanceService.getFlowInstanceDetail(id, attachFileFlag, valueHolder.getUserIdHolder());
    }

    @PostMapping(value= "/getOperateInfo")
    public PageList<TbFlowInstanceOperateHistory> getOperateInfo(@RequestBody FlowInstanceRequest param) throws Exception {
        if (param == null || param.getId() == null) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        param.setStartUserId(valueHolder.getUserIdHolder());
        return flowInstanceService.getOperateInfo(param);
    }

    @GetMapping(value= "/getFlowInstanceFlowChart")
    public FlowChartResponse getFlowInstanceFlowChart(@RequestParam Long id) {
        return flowInstanceService.getFlowInstanceFlowChart(id, valueHolder.getUserIdHolder());
    }

    @GetMapping(value= "/exportFileFlowInstance")
    public void exportFileFlowInstance(HttpServletResponse resp, @RequestParam Long instanceId, @RequestParam Long fileId) throws Exception {
        flowInstanceService.exportFileFlowInstance(resp, instanceId, fileId, valueHolder.getUserIdHolder());
    }
}