package com.rose.service.impl;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.StringUtil;
import com.rose.data.base.PageParam;
import com.rose.data.constant.SystemConstant;
import com.rose.data.entity.TbNotice;
import com.rose.data.entity.TbSystemSetting;
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
    public PageList<TbNotice> searchNotice(PageParam param) throws Exception {
        return noticeRepositoryCustom.list(param.getPage(), param.getRows());
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

    @Override
    public TbSystemSetting getIndexPageShowNotice() {
        return systemSettingRepository.findBySystemKey(SystemConstant.INDEX_PAGE_NOTICE_SHOW_KEY);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateIndexPageShowNotice(String indexPageShowNotice) {
        if (!Arrays.asList("true", "false").contains(indexPageShowNotice)) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        systemSettingRepository.updateBySystemKey(SystemConstant.INDEX_PAGE_NOTICE_SHOW_KEY, indexPageShowNotice);
    }
}