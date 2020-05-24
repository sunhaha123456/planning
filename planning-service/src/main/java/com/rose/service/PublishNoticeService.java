package com.rose.service;

import com.rose.common.data.base.PageList;
import com.rose.data.base.PageParam;
import com.rose.data.entity.TbNotice;
import com.rose.data.entity.TbSystemSetting;

public interface PublishNoticeService {

    PageList<TbNotice> searchNotice(PageParam param) throws Exception;

    TbNotice getNotice(Long id);

    void saveNotice(TbNotice param);

    TbSystemSetting getIndexPageShowNotice();

    void updateIndexPageShowNotice(String indexPageShowNotice);
}