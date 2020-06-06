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
public class EmployerSalaryPaidSearchRequest extends PageParam {
    private String employerName;
    private String phone;
    private String idCardNo;
    @DateTimeFormat(pattern = "yyyy-MM")
    @JsonFormat(pattern = "yyyy-MM", timezone = "GMT+8")
    private Date salaryDate;
}