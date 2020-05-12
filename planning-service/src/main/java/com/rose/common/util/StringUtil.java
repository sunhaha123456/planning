package com.rose.common.util;

import java.util.List;

/**
 * 功能：String 工具类
 * @author sunpeng
 * @date 2018
 */
public class StringUtil {
    public static boolean isEmpty(String cs) {
        return cs == null || cs.trim().length() == 0 || cs.equals("null");
    }

    public static boolean isNotEmpty(String cs) {
        return !isEmpty(cs);
    }

    public static String firstCharUpperCase(String fieldName) {
        return fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
    }

    /**
     * 功能：获取文件后缀名，比如123.txt，返回 .txt，均以小写返回
     * @param fileName
     * @return
     */
    public static String getFileExt(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
    }

    public static String getListStr(List list) {
        if (list == null || list.size() == 0) {
            return "";
        }
        StringBuilder builder = new StringBuilder();
        for (Object obj : list) {
            builder.append(",").append(obj + "");
        }
        builder.deleteCharAt(0);
        return builder.toString();
    }
}