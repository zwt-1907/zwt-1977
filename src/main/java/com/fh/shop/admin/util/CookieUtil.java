package com.fh.shop.admin.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {


    //写cookie
    public static void writeCookie(String name,String value,String domain,int MaxAge, HttpServletResponse response){
        Cookie cookie = new Cookie(name,value);
        cookie.setDomain(domain);
        cookie.setPath("/");
        //cookie.getMaxAge();       //设置Cookie的生命周期
        if (MaxAge > 0){
            cookie.setMaxAge(MaxAge);
        }
        response.addCookie(cookie);
    }


    //读cookie
    public static String readCookie(HttpServletRequest request ,String name){
        Cookie [] cookies = request.getCookies();
        if (cookies == null){
            return "";
        }
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(name)){
                return cookie.getValue();
            }
        }
        return  "";
    }
}
