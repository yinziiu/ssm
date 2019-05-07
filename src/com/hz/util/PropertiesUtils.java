package com.hz.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.springframework.core.io.support.PropertiesLoaderUtils;

/**
 * 获取配置文件工具类
 */
public class PropertiesUtils {

    /**
     * 获取配置文件
     * @param proName 配置文件名称
     * @return
     */
    public static Map<String, String> getProperties(String proName) {
        Map<String, String> configMap = new HashMap<String, String>();

        Properties props = new Properties();
        try {
            props= PropertiesLoaderUtils.loadAllProperties(proName);
            for(Object key:props.keySet()){
                String keyName = key.toString();
                String keyValue = new String(props.get(key).toString().getBytes("ISO-8859-1"), "utf-8");
                configMap.put(keyName, keyValue);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return configMap;
    }

}
