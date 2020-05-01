package com.rose.service;

import com.rose.common.data.base.PageList;
import com.rose.data.entity.TbSysUser;
import com.rose.data.to.request.UserSaveRequest;
import com.rose.data.to.request.UserSearchRequest;
import com.rose.data.to.vo.UserRedisVo;

/**
 * 功能：user service
 * @author sunpeng
 * @date 2018
 */
public interface UserService {
    PageList<TbSysUser> search(UserSearchRequest param) throws Exception;
    void save(UserSaveRequest param) throws Exception;
    void opert(Long id, Integer state);
    TbSysUser getDetail(Long id);
    void userRedisInfoSave(String redisKey, UserRedisVo userRedis);
    void updatePasswodAdmin(Long id, String userNewPassword) throws Exception;
    void updatePasswodSelf(String userOldPassword, String userNewPassword) throws Exception;
}