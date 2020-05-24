package com.rose.service;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbNotice;
import com.rose.data.entity.TbSystemSetting;
import com.rose.data.to.request.NoticeSearchRequest;

public interface PublishNoticeService {

    PageList<TbNotice> searchNotice(NoticeSearchRequest param) throws Exception;

    TbNotice getNotice(Long id);

    void saveNotice(TbNotice param);

    void deleteNotice(Long id);

    TbSystemSetting getIndexPageShowNotice();

    void updateIndexPageShowNotice(String indexPageShowNotice);
}