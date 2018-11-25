/** 
 * <pre>项目名称:shop-admin-mvn
 * 文件名称:IpUtil.java
 * 包名:com.fh.shop.util
 * 创建日期:2018年4月16日下午10:44:55
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.util;

import javax.servlet.http.HttpServletRequest;
/** 
 * <pre>项目名称：shop-adm-maven    
 * 类名称：IPUtil    
 * 类描述：    
 * 创建人：姚展博 yao_zb@163.com@163.com    
 * 创建时间：2018年4月16日 下午10:36:45    
 * 修改人：姚展博 yao_zb@163.comZPT_t@163.com  
 * 修改时间：2018年4月16日 下午10:36:45    
 * 修改备注：       
 * @version </pre>    
 */
public class IpUtil {
	
	public static String getIpAddress(HttpServletRequest request) { 
		
        String ip = request.getHeader("x-forwarded-for");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }  
        return ip;  
    }
}
