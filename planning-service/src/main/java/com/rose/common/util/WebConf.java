package com.rose.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 功能：获取properties配置文件以及系统参数中的key-value
 * 备注：java -jar -Daaa=aaa xxx.jar方式传入的 aaa 参数会被获取到，而非脚本启动时，$中获取的值，会失败
 */
public class WebConf {

	private static final Logger LOG = LoggerFactory.getLogger(WebConf.class);
	
    private static final Pattern PATTERN = Pattern.compile("\\$\\{([^\\}]+)\\}");

    private static Properties props = new Properties();
    
    static {
        try(Reader in = new InputStreamReader(WebConf.class.getClassLoader().getResourceAsStream("application.properties"),"UTF-8");
            StringWriter holder = new StringWriter()) {
            props.load(in);
            props.putAll(System.getProperties());
            props.list(new PrintWriter(holder));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getValue(String key) {
        try {
            String value = props.getProperty(key);
            if(StringUtil.isEmpty(value)){
                return "";
            }
            Matcher matcher = PATTERN.matcher(value);
            StringBuffer buffer = new StringBuffer();
            while (matcher.find()) {
                String matcherKey = matcher.group(1);
                String matcherValue = props.getProperty(matcherKey);
                if (matcherValue != null) {
                    matcher.appendReplacement(buffer, matcherValue);
                }
            }
            matcher.appendTail(buffer);
            return buffer.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }
}
