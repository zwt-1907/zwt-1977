/**
 * <pre>项目名称:shop-admin-v3
 * 文件名称:SystemEnum.java
 * 包名:com.fh.shop.admin.common
 * 创建日期:2018年10月19日下午2:07:38
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre>
 */
package com.fh.shop.admin.common;

/**
 * <pre>项目名称：shop-admin-v3
 * 类名称：SystemEnum
 * 类描述：
 * 创建人：张伟涛 zwt_951119@163.com
 * 创建时间：2018年10月19日 下午2:07:38
 * 修改人：张伟涛 zwt_951119@163.com
 * 修改时间：2018年10月19日 下午2:07:38
 * 修改备注：
 * @version </pre>
 */
public enum SystemEnum {




	//登陆成功的信息
	SUCCESS_NO_RESULT (200,"ok"),
	ERROR_EXCEPTION (500,"系统异常，请刷新重试"),
	ERROR_REDIS (501,"非法操作，请重新登录"),


	REDIS_CODE_ERROR (1000,"验证码超时"),
	LOGIN_CODE_ERROR (1001,"验证码错误"),
	LOGIN_INFO_MISS (1002,"信息不完整"),
	LOGIN_ISUSER_ERROR (1003,"没有该用户"),
	LOGIN_PWD_ERROR (1004,"密码错误"),
	LOGIN_USER_LOCK (1004,"该用户已被锁定，请联系管理员解锁");



	private int code;

	private String message;



	private SystemEnum(int code,String message){
		this.code = code;
		this.message = message;
	}


	public int getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}

}
