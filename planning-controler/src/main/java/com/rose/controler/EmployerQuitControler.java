package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbSysUser;
import com.rose.data.to.request.UserSaveRequest;
import com.rose.data.to.request.UserSearchRequest;
import com.rose.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

/**
 * 描述：办理离职 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/employerQuit")
public class EmployerQuitControler {

    @Inject
    private UserService userService;

    @PostMapping(value= "/search")
    public PageList<TbSysUser> search(@RequestBody UserSearchRequest param) throws Exception {
        return userService.search(param);
    }

    @PostMapping(value= "/add")
    public void save(@RequestBody UserSaveRequest param) throws Exception {
        userService.save(param);
    }

    /**
     * 功能：操作用户状态
     * @param id
     * @param state 0：解冻恢复正常 1：冻结 2：注销（只有冻结后，才能注销）
     * @throws Exception
     */
    @GetMapping(value= "/opert")
    public void opert(@RequestParam Long id, @RequestParam Integer state) throws Exception {
        userService.opert(id, state);
    }

    @PostMapping(value= "/updatePasswodAdmin")
    public void updatePasswodAdmin(@RequestParam Long id, @RequestParam String userNewPassword) throws Exception {
        if (StringUtil.isEmpty(userNewPassword)) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        userService.updatePasswodAdmin(id, userNewPassword);
    }

    @PostMapping(value= "/updatePasswodSelf")
    public void updatePasswodSelf(HttpServletRequest request, @RequestParam String userOldPassword, @RequestParam String userNewPassword) throws Exception {
        if (StringUtil.isEmpty(userOldPassword) || StringUtil.isEmpty(userNewPassword)) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        userService.updatePasswodSelf(userOldPassword, userNewPassword);
    }

    @GetMapping(value= "/getDetail")
    public TbSysUser getDetail(@RequestParam Long id) throws Exception {
        return userService.getDetail(id);
    }
}