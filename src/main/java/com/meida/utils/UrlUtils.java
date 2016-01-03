package com.meida.utils;

import com.meida.config.Constant;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

/**
 * Created by admin on 16/1/3.
 */
public class UrlUtils {
    public static String builder(String baseUrl, Map<String, String> params) throws UnsupportedEncodingException {
        StringBuilder url = new StringBuilder(baseUrl.endsWith("/") ? baseUrl.substring(0, baseUrl.length() - 1) : baseUrl);
        int i = 0;
        for (Map.Entry<String, String> entry : params.entrySet()) {
            url.append(i == 0 ? "?" : "&").append(entry.getKey()).append("=").append(URLEncoder.encode(StringUtils.getStr(entry.getValue()), Constant.CHARSET));
            i++;
        }
        return url.toString();
    }
}
