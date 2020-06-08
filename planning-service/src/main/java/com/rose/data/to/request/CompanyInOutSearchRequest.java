package com.rose.data.to.request;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rose.data.base.PageParam;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class CompanyInOutSearchRequest extends PageParam {

    // 录入项类别 0营业额 1支出 2利润
    private Integer entryType;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date endDate;
}