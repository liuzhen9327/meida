package com.meida.utils;

public class StringUtils {

	public static String getStr(String str) {
		return str == null ? "" : str;
	}
	
	public static String getStr(Object obj) {
		return getStr((String) obj);
	}
}
