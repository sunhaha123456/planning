package com.rose.controler;

import com.rose.data.entity.TbSystemSetting;
import com.rose.service.SystemSettingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * 描述：系统设置 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/systemSetting")
public class SystemSettingControler {

    @Inject
    private SystemSettingService systemSettingService;

    @GetMapping(value= "/getIndexPageShowNotice")
    public TbSystemSetting getIndexPageShowNotice() {
        return systemSettingService.getIndexPageShowNotice();
    }

    @PostMapping(value= "/updateIndexPageShowNotice")
    public void updateIndexPageShowNotice(@RequestParam String indexPageShowNotice) {
        systemSettingService.updateIndexPageShowNotice(indexPageShowNotice);
    }
}