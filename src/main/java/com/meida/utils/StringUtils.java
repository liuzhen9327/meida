package com.meida.utils;

public class StringUtils {

    public static String getStr(String str) {
        return str == null ? "" : str;
    }

    public static String getStr(Object obj) {
        return getStr((String) obj);
    }

    public static String cutStr(String str, int len) {
        return cutStr(str, len, null);
    }

    public static String cutStr(String str, int len, String fillStr) {
        if (!(str.length() > len)) return str;
        return str.substring(0, len) + (fillStr == null?"":fillStr);
    }
}
