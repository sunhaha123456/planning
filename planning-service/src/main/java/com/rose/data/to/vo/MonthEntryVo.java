package com.rose.data.to.vo;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 描述：公司月度收支项 vo
 * @author sunpeng
 */
@Data
public class MonthEntryVo implements Serializable {

    private String monthTypeFlag; // month + type

    private String month;

    // 类别 0支出 1营收 2利润
    private Integer type;

    private BigDecimal amount;
}