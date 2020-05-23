package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.data.base.PageParam;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.service.PublishNoticeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;

/**
 * 描述：发布公告 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/publishNotice")
public class PublishNoticeControler {

    @Inject
    private PublishNoticeService publishNoticeService;

    @PostMapping(value= "/searchNotice")
    public PageList<TbFlowTemplate> searchNotice(@RequestBody PageParam param) throws Exception {
        return null;
    }
}