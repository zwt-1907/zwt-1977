/**
 * <pre>项目名称:shop-admin-v3
 * 文件名称:SystemEnum.java
 * 包名:com.fh.shop.admin.common
 * 创建日期:2018年10月19日下午2:07:38
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre>
 */
package com.fh.shop.admin.util;

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

	LOGIN_CODE_ERROR (1001,"验证码错误"),
	LOGIN_INFO_MISS (1002,"信息不完整"),
	LOGIN_ISUSER_ERROR (1003,"没有该用户"),
	LOGIN_PWD_ERROR (1004,"密码错误"),
	LOGIN_USER_LOCK (1004,"该用户已被锁定，请联系管理员解锁"),

	SMS_NULL(201,"手机号码为空，请输入号码"),
	SMS_INVALADATE_ERROR(202,"手机号码格式错误"),
	SMS_ERROR(-1,"调用网易云信接口失败"),

	ADD_USERNAME_NULL(301,"请输入用户名"),
	ADD_USERNAME_EXISTS(302,"用户名已存在"),


	PORT_HEADER_MISS(399,"头信息缺失"),
	PORT_OVERTIME_ERROR(400,"请求超时"),
	PORT_APPKEY_VOLIDATE(401,"appKey失效"),
	PORT_SIGN_ERROR(402,"签名无效"),
	PORT_SIGN_ERROR_ERR(403,"系统错误"),
	NONCE_NOCISIT(405,"拒绝再次访问"),
	PORT_MAXCOUNT(406,"访问超出限制，拒绝访问"),


	MEMBER_CODE_NONE(251,"验证码为空"),
	MEMBER_CODE_TIMEOUT(252,"验证码超时"),
	MEMBER_CODE_ERROR(250,"验证码错误");


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
