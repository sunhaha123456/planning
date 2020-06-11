package com.rose.data.to.response;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class SimpleHistogramResponse {
    private String title;   // 标题
    private String legend;  // 图例
    private List<String> xaxisList; // x轴项列表
    private List<BigDecimal> valueList; // 数值列表
}