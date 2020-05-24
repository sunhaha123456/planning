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
     * 功能：跳转我的首页
     * @return
     */
    @GetMapping(value = "/user/menuManage/toMyIndexPage")
    public String toMyIndexPage() {
        return "menu/myIndexPage";
    }

    /**
     * 功能：跳转发起申请
     * @return
     */
    @GetMapping(value = "/user/menuManage/toStartApplyPage")
    public String toStartApplyPage() {
        return "menu/startApplyPage";
    }

    /**
     * 功能：跳转我发出的申请
     * @return
     */
    @GetMapping(value = "/user/menuManage/toSelfSendApplyPage")
    public String toSelfSendApplyPage() {
        return "menu/selfSendApplyPage";
    }

    /**
     * 功能：跳转我审批的申请
     * @return
     */
    @GetMapping(value = "/user/menuManage/toSelfApprovalApplyPage")
    public String toSelfApprovalApplyPage() {
        return "menu/selfApprovalApplyPage";
    }

    /**
     * 功能：跳转发布公告
     * @return
     */
    @GetMapping(value = "/user/menuManage/toPublishNotice")
    public String toPublishNotice() {
        return "menu/publishNotice";
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