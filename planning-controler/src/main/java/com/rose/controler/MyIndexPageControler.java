package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.data.base.PageParam;
import com.rose.data.entity.TbFlowInstance;
import com.rose.data.entity.TbNotice;
import com.rose.data.entity.TbSystemSetting;
import com.rose.data.to.request.NoticeSearchRequest;
import com.rose.service.FlowInstanceService;
import com.rose.service.PublishNoticeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * 描述：我的首页 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/myIndexPage")
public class MyIndexPageControler {

    @Inject
    private PublishNoticeService publishNoticeService;
    @Inject
    private FlowInstanceService flowInstanceService;

    @GetMapping(value= "/getIndexPageShowNotice")
    public TbSystemSetting getIndexPageShowNotice() {
        return publishNoticeService.getIndexPageShowNotice();
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

    @PostMapping(value= "/searchWaitApproval")
    public PageList<TbFlowInstance> searchWaitApproval(@RequestBody PageParam param) throws Exception {
        return flowInstanceService.searchWaitApproval(param);
    }


}