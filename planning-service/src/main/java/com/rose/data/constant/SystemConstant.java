package com.rose.data.constant;

public interface SystemConstant {
    // token保存时间长度
    long TOKEN_SAVE_TIME = 8 * 60;

    // 用户登录验证码保存时间 5分钟
    long LOGIN_CODE_SAVE_TIME = 5;

    // redis中登录验证码前缀
    String LOGIN_CODE_PREFIX = "login_code_";

    // 系统前后端交互中 token、userId key名
    String SYSTEM_TOKEN_NAME = "token";
    String SYSTEM_USER_ID = "userId";

    // tb_system_setting 表 key
    String INDEX_PAGE_NOTICE_SHOW_KEY = "indexPageNoticeShowFlag"; // 首页是否显示公告标志
    String COMPANY_IN_OUT_LOCK_TIME_KEY = "companyInOutLockTimeFlag"; // 公司收支时间截点
}