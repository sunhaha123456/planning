package com.rose.service.impl;

import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.data.constant.SystemConstant;
import com.rose.data.entity.TbSystemSetting;
import com.rose.repository.SystemSettingRepository;
import com.rose.service.SystemSettingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.Arrays;

@Slf4j
@Service
public class SystemSettingServiceImpl implements SystemSettingService {

    @Inject
    private SystemSettingRepository systemSettingRepository;

    @Override
    public TbSystemSetting getBySystemKey(String systemKey) {
        return systemSettingRepository.findBySystemKey(systemKey);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateIndexPageShowNotice(String indexPageShowNotice) {
        if (!Arrays.asList("true", "false").contains(indexPageShowNotice)) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        systemSettingRepository.updateBySystemKey(SystemConstant.INDEX_PAGE_NOTICE_SHOW_KEY, indexPageShowNotice);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateBySystemKey(String systemKey, String value) {
        systemSettingRepository.updateBySystemKey(systemKey, value);
    }
}