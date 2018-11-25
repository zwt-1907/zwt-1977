/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:Interceptor.java 
 * 包名:com.fh.shop.admin.loginInterceptor 
 * 创建日期:2018年10月15日下午3:05:48 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.loginInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fh.shop.admin.util.CookieUtil;
import com.fh.shop.admin.util.RedisUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：Interceptor    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月15日 下午3:05:48    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月15日 下午3:05:48    
 * 修改备注：       
 * @version </pre>    
 */
public class Interceptor implements HandlerInterceptor{

	public static final String LOGIN = "/user/userLogin";


	/* (non-Javadoc)    
	 * @see org.springframework.web.servlet.HandlerInterceptor#afterCompletion(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)    
	 */
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)    
	 * @see org.springframework.web.servlet.HandlerInterceptor#postHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, org.springframework.web.servlet.ModelAndView)    
	 */
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
	
	/* (non-Javadoc)    
	 * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)    
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {

		String userLogin = request.getRequestURL().toString();

		//获取session中的user信息
		//Employee user = (Employee) request.getSession().getAttribute("login");

        if (userLogin.contains(LOGIN)) {
            return true;
        }
		//获取redis里的user信息
		String fhCodeId = CookieUtil.readCookie(request, "fhCodeId");
        if (StringUtils.isEmpty(fhCodeId)){
            response.sendRedirect("../login.jsp");
            return false;
        }
        String user = RedisUtil.get("user:" + fhCodeId);
        //判断redis里有没有用户信息
        if (StringUtils.isEmpty(user)){
            response.sendRedirect("../login.jsp");
            return false;
        }



		if (null != user) {
            RedisUtil.exprie("user:"+fhCodeId,2*60);
			return true;
		}else {
			response.sendRedirect("../login.jsp");
			return false;
		}
	}

	
}
