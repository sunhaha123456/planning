package com.rose.data.to.request;

import com.rose.data.base.PageParam;
import lombok.Data;

@Data
public class UserSearchRequest extends PageParam {
    private String loginName; //用户登录名
}