package com.meida.utils;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by admin on 16/1/3.
 */
public class UrlUtils {
    public static String buildParams(String baseUrl, Map<String, String> params) {
        try {
            if (params == null || params.size() == 0) return "";
            StringBuilder url = new StringBuilder(baseUrl.endsWith("/") ? baseUrl.substring(0, baseUrl.length() - 1) : baseUrl);
            url.append("?p=");
            StringBuilder para = new StringBuilder();
            for (Map.Entry<String, String> entry : params.entrySet()) {
                para.append(entry.getKey()).append("=").append(URLEncoder.encode(StringUtils.trimToEmpty(entry.getValue()), "UTF-8")).append("&");
            }
            return url.append(new String(Base64.encodeBase64(org.apache.commons.codec.binary.StringUtils.getBytesUtf8(para.substring(0, para.length() -1))))).toString();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }

    public static void resolveParams2Request(String base64Str, HttpServletRequest req) {
        try {
            if (StringUtils.isBlank(base64Str) || !Base64.isBase64(base64Str)) return;
            base64Str = new String(Base64.decodeBase64(base64Str));
            String[] array = base64Str.split("&");
            for (String str : array) {
                String[] para = str.split("=");
                req.setAttribute(para[0], URLDecoder.decode(para[1], "UTF-8"));
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

    }
}
