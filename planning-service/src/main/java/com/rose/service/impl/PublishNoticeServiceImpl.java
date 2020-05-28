package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbNotice;
import com.rose.data.to.request.NoticeSearchRequest;
import com.rose.repository.NoticeRepository;
import com.rose.repository.NoticeRepositoryCustom;
import com.rose.repository.SystemSettingRepository;
import com.rose.service.PublishNoticeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.Arrays;
import java.util.Date;

@Slf4j
@Service
public class PublishNoticeServiceImpl implements PublishNoticeService {

    @Inject
    private NoticeRepository noticeRepository;
    @Inject
    private NoticeRepositoryCustom noticeRepositoryCustom;
    @Inject
    private SystemSettingRepository systemSettingRepository;

    @Override
    public PageList<TbNotice> searchNotice(NoticeSearchRequest param) throws Exception {
        return noticeRepositoryCustom.list(param.getStatus(), param.getPage(), param.getRows());
    }

    @Override
    public TbNotice getNotice(Long id) {
        return noticeRepository.findOne(id);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveNotice(TbNotice param) {
        if (param == null || StringUtil.isEmpty(param.getTitle()) || StringUtil.isEmpty(param.getContent()) || !Arrays.asList(0, 1).contains(param.getStatus()) || param.getSort() == null) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        Date now = new Date();
        if (param.getId() == null) {
            param.setCreateDate(now);
            param.setLastModified(now);
        } else {
            TbNotice notice = noticeRepository.findOne(param.getId());
            if (notice == null) {
                throw new BusinessException(ResponseResultCode.PARAM_ERROR);
            }
            param.setCreateDate(notice.getCreateDate());
            param.setLastModified(now);
        }
        noticeRepository.save(param);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteNotice(Long id) {
        TbNotice notice = noticeRepository.findOne(id);
        if (notice == null) {
            throw new BusinessException("公告已被别人删除过了！");
        }
        if (notice.getStatus() != 0) {
            throw new BusinessException("请先下架！");
        }
        noticeRepository.delete(id);
    }
}