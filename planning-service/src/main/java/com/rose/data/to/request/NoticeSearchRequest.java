package com.rose.data.to.request;

import com.rose.data.base.PageParam;
import lombok.Data;

@Data
public class NoticeSearchRequest extends PageParam {
    // 公告状态 0下架 1上架
    private Integer status;
}