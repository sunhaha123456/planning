package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbNotice;
import com.rose.data.entity.TbSystemSetting;
import com.rose.data.to.request.NoticeSearchRequest;
import com.rose.service.PublishNoticeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

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
    public PageList<TbNotice> searchNotice(@RequestBody NoticeSearchRequest param) throws Exception {
        return publishNoticeService.searchNotice(param);
    }

    @GetMapping(value= "/getNotice")
    public TbNotice getNotice(@RequestParam Long id) {
        return publishNoticeService.getNotice(id);
    }

    @PostMapping(value= "/saveNotice")
    public void saveNotice(@RequestBody TbNotice param) {
        publishNoticeService.saveNotice(param);
    }

    @PostMapping(value= "/deleteNotice")
    public void deleteNotice(@RequestParam Long id) {
        publishNoticeService.deleteNotice(id);
    }

    @GetMapping(value= "/getIndexPageShowNotice")
    public TbSystemSetting getIndexPageShowNotice() {
        return publishNoticeService.getIndexPageShowNotice();
    }

    @PostMapping(value= "/updateIndexPageShowNotice")
    public void updateIndexPageShowNotice(@RequestParam String indexPageShowNotice) {
        publishNoticeService.updateIndexPageShowNotice(indexPageShowNotice);
    }
}