/** 
 * <pre>项目名称:shop-admin-v2 
 * 文件名称:ServerResponse.java 
 * 包名:com.fh.shop.admin.common 
 * 创建日期:2018年10月18日下午7:05:11 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.common;

/** 
 * <pre>项目名称：shop-admin-v2    
 * 类名称：ServerResponse    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月18日 下午7:05:11    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月18日 下午7:05:11    
 * 修改备注：       
 * @version </pre>    
 */
public class ServerResponse {
	
	private Integer code;
	
	private String message;
	
	private Object data;
	
	public ServerResponse(){
		
	}
	
	public ServerResponse(int code,String message,Object data){
		this.code = code;
		this.message = message;
		this.data = data;
	}
	
	//有返回值
	public static ServerResponse success(Object data){
		return new ServerResponse(SystemEnum.SUCCESS_NO_RESULT.getCode(),SystemEnum.SUCCESS_NO_RESULT.getMessage(),data);
	}
	//无返回值
	public static ServerResponse success(){
		return new ServerResponse(SystemEnum.SUCCESS_NO_RESULT.getCode(),SystemEnum.SUCCESS_NO_RESULT.getMessage(),null);
	}
	
	//登陆错误信息
	public static ServerResponse error(SystemEnum systemEnum){
		return new ServerResponse(systemEnum.getCode(),systemEnum.getMessage(),null);
	}
	
	//系统错误
	public static ServerResponse error(){
		return new ServerResponse(SystemEnum.ERROR_EXCEPTION.getCode(),SystemEnum.ERROR_EXCEPTION.getMessage(),null);
	}
	
	
	public Integer getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}

	public Object getData() {
		return data;
	}
	
}
