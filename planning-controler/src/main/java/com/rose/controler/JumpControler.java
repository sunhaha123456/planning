package com.rose.controler;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 功能：跳转 controller
 * @author sunpeng
 * @date 2018
 */
@Slf4j
@Controller
public class JumpControler {
    /**
     * 功能：跳转用户管理页面
     * @return
     */
    @GetMapping(value = "/user/userManage/toUserManage")
    public String toUserManage() {
        return "menu/userManage";
    }

    /**
     * 功能：跳转角色管理页面
     * @return
     */
    @GetMapping(value = "/user/roleManage/toRoleManage")
    public String toRoleManage() {
        return "menu/roleManage";
    }

    /**
     * 功能：跳转菜单管理页面
     * @return
     */
    @GetMapping(value = "/user/menuManage/toMenuManage")
    public String toMenuManage() {
        return "menu/menuManage";
    }

    /**
     * 功能：跳转平台首页
     * @return
     */
    @GetMapping(value = "/user/menuManage/toPlatformIndexPage")
    public String toPlatformIndexPage() {
        return "menu/platformIndexPage";
    }

    /**
     * 功能：跳转流程模板
     * @return
     */
    @GetMapping(value = "/user/menuManage/toFlowTemplate")
    public String toFlowTemplate() {
        return "menu/flowTemplate";
    }

    /**
     * 功能：跳转流程实例
     * @return
     */
    @GetMapping(value = "/user/menuManage/toFlowInstance")
    public String toFlowInstance() {
        return "menu/flowInstance";
    }
}