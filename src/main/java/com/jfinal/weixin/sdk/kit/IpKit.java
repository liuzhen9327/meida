/**
 * Copyright (c) 2011-2014, James Zhan 詹波 (jfinal@126.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

package com.jfinal.weixin.sdk.kit;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

public class IpKit {
	
	public static String getRealIp(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
	public static String getRealIpV2(HttpServletRequest request) {
		String accessIP = request.getHeader("x-forwarded-for");
        if (null == accessIP)
            return request.getRemoteAddr();
        return accessIP;
	}
	
	public static String getHostNameForLiunx() {  
        try {  
            return (InetAddress.getLocalHost()).getHostName();  
        } catch (UnknownHostException uhe) {  
            String host = uhe.getMessage(); // host = "hostname: hostname"  
            if (host != null) {  
                int colon = host.indexOf(':');  
                if (colon > 0) {  
                    return host.substring(0, colon);  
                }  
            }  
            return "UnknownHost";  
        }  
    }  
  
    public static String getHostName() {  
        if (System.getenv("COMPUTERNAME") != null) {  
            return System.getenv("COMPUTERNAME");  
        } else {  
            return getHostNameForLiunx();  
        }  
    }  
}
