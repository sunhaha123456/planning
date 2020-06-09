package com.rose.service;

import com.rose.data.entity.TbSystemSetting;

public interface SystemSettingService {

    TbSystemSetting getBySystemKey(String systemKey);

    void updateIndexPageShowNotice(String indexPageShowNotice);

    void updateBySystemKey(String systemKey, String value);
}