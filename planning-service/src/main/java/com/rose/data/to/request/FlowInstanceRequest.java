package com.rose.data.to.request;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rose.data.base.PageParam;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

@Data
public class FlowInstanceRequest extends PageParam {
    private Long id;
    private Long templateId;
    private Long startUserId;
    private Integer flowInstanceState;
    private String flowInstanceName;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date approvalStartDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date approvalEndDate;
}