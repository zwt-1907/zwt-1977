/** 
 * <pre>项目名称:shop-admin-v2 
 * 文件名称:WebContext.java 
 * 包名:com.fh.shop.admin.util 
 * 创建日期:2018年10月17日下午6:52:46 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.util;

import javax.servlet.http.HttpServletRequest;

/** 
 * <pre>项目名称：shop-admin-v2    
 * 类名称：WebContext    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月17日 下午6:52:46    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月17日 下午6:52:46    
 * 修改备注：       
 * @version </pre>    
 */
public class WebContext {
	
	private static final ThreadLocal<HttpServletRequest> local = new ThreadLocal<HttpServletRequest>();
	
	public static void setRequest(HttpServletRequest request){
		local.set(request);
	}
	
	public static HttpServletRequest getRequest(){
		return local.get();
	}
	
	public static void Remove(){
		local.remove();
	}
}
