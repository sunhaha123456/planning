package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.to.request.FlowTemplateRequest;
import com.rose.data.to.response.FlowChartResponse;
import com.rose.service.FlowTemplateService;
import com.rose.service.SelfOfficeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * 描述：发起申请 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/startApply")
public class StartApplyControler {

    @Inject
	private SelfOfficeService selfOfficeService;
    @Inject
    private FlowTemplateService flowTemplateService;

    @PostMapping(value= "/searchTemplate")
    public PageList<TbFlowTemplate> searchTemplate(@RequestBody FlowTemplateRequest param) throws Exception {
        param.setStatus(0);
        return selfOfficeService.searchTemplate(param);
    }

    @GetMapping(value= "/getTemplateFlowChart")
    public FlowChartResponse getTemplateFlowChart(@RequestParam Long id) {
        return flowTemplateService.getTemplateFlowChart(id);
    }
}