package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbFlowInstanceOperateHistory;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.to.request.FlowInstanceRequest;
import com.rose.data.to.request.FlowTemplateRequest;
import com.rose.data.to.response.FlowChartResponse;
import com.rose.service.FlowInstanceService;
import com.rose.service.FlowTemplateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

/**
 * 描述：流程实例 controler
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/flowInstance")
public class FlowInstanceControler {

    @Inject
    private FlowTemplateService flowTemplateService;
    @Inject
	private FlowInstanceService flowInstanceService;

    @GetMapping(value= "/getTemplateTree")
    public List<TbFlowTemplate> getTemplateTree() {
        return flowTemplateService.getTemplateTree();
    }

    @PostMapping(value= "/getIdList")
    public List<Long> getIdList(@RequestBody FlowTemplateRequest param) {
        if (param == null || StringUtil.isEmpty(param.getFlowTemplateName())) {
            return new ArrayList<>();
        }
        return flowTemplateService.getIdList(param.getFlowTemplateName(), null);
    }

    @PostMapping(value= "/searchFlowInstance")
    public PageList<TbFlowInstance> searchFlowInstance(@RequestBody FlowInstanceRequest param) throws Exception {
        if (param == null || param.getTemplateId() == null) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        return flowInstanceService.searchFlowInstance(param);
    }

    /**
     * 功能：对流程进行操作
     * @param id 流程实例id
     * @param type 0：管理员冻结流程 1：管理员恢复流程 2：管理员删除流程
     * @return
     * @throws Exception
     */
    @PostMapping(value= "/operateInstance")
    public void operateInstance(@RequestParam Long id, @RequestParam Integer type) throws Exception {
        flowInstanceService.operateInstance(id, type);
    }

    @GetMapping(value= "/getFlowInstanceDetail")
    public TbFlowInstance getFlowInstanceDetail(@RequestParam Long id) {
        return flowInstanceService.getFlowInstanceDetail(id);
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
        return flowInstanceService.getFlowInstanceFlowChart(id);
    }
}