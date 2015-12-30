package com.meida.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by admin on 15/12/31.
 */
public class ServletUtils {

    public static void setCookie(HttpServletResponse response, String path, String name, String value) {
        setCookie(response, path, name, value, 3600);
    }

    public static void setCookie(HttpServletResponse response, String name, String value) {
        setCookie(response, "/", name, value, 3600);
    }

    public static void setCookie(HttpServletResponse response, String name, String value, int maxAge) {
        setCookie(response, "/", name, value, maxAge);
    }

    public static void setCookie(HttpServletResponse response, String path, String name, String value, int maxAge){
        Cookie cookie = new Cookie(name, value);
        cookie.setPath(path);
        if(maxAge>0)  cookie.setMaxAge(maxAge);
        response.addCookie(cookie);
    }

    public static String getCookie(HttpServletRequest request, String name){
        Cookie[] cookies = request.getCookies();
        if(null!=cookies){
            for(Cookie cookie : cookies){
                if (name.equals(cookie.getName())) return cookie.getValue();
            }
        }
        return null;
    }
}
