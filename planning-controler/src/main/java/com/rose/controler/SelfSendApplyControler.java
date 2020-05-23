package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.ValueHolder;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.to.request.FlowInstanceRequest;
import com.rose.service.FlowInstanceService;
import com.rose.service.FlowTemplateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * 描述：我发出的申请 controler
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/selfSendApplyPage")
public class SelfSendApplyControler {

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
     * @param type 0：撤销流程 1：恢复流程 2：删除流程
     * @return
     * @throws Exception
     */
    @PostMapping(value= "/operateInstance")
    public void operateInstance(@RequestParam Long id, @RequestParam Integer type) throws Exception {
        flowInstanceService.operateInstanceByUser(id, type);
    }
}