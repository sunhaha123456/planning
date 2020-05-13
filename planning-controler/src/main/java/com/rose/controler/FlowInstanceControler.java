package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.StringUtil;
import com.rose.common.util.ValueHolder;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.to.request.FlowInstanceRequest;
import com.rose.data.to.request.FlowTemplateRequest;
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
    @Inject
    private ValueHolder valueHolder;

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
}