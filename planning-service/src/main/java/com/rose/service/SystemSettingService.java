package com.rose.service;

import com.rose.data.entity.TbSystemSetting;

public interface SystemSettingService {

    TbSystemSetting getIndexPageShowNotice();

    void updateIndexPageShowNotice(String indexPageShowNotice);
}