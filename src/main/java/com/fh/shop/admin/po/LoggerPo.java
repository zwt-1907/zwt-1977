/** 
 * <pre>项目名称:shop-admin-v2 
 * 文件名称:Logger.java 
 * 包名:com.fh.shop.admin.po 
 * 创建日期:2018年10月17日下午7:08:15 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.po;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/** 
 * <pre>项目名称：shop-admin-v2    
 * 类名称：Logger    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月17日 下午7:08:15    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月17日 下午7:08:15    
 * 修改备注：       
 * @version </pre>    
 */
public class LoggerPo extends PageUtil implements Serializable {

	private static final long serialVersionUID = -290765677477922768L;

	private Integer logId;
	
	private String userName;
	
	private String info;
	
	private Integer status;
	
	private String userIp;
	
	private String msg;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH")
	private Date minAccessTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH")
	private Date maxAccessTime;
	
	private Integer useTime;
	private Integer minUseTime;
	private Integer maxUseTime;


	@JsonFormat(pattern="yyyy-MM-dd HH",timezone="GMT+8")
	public Date getMinAccessTime() {
		return minAccessTime;
	}

	public void setMinAccessTime(Date minAccessTime) {
		this.minAccessTime = minAccessTime;
	}
	@JsonFormat(pattern="yyyy-MM-dd HH",timezone="GMT+8")
	public Date getMaxAccessTime() {
		return maxAccessTime;
	}

	public void setMaxAccessTime(Date maxAccessTime) {
		this.maxAccessTime = maxAccessTime;
	}

	public Integer getMinUseTime() {
		return minUseTime;
	}

	public void setMinUseTime(Integer minUseTime) {
		this.minUseTime = minUseTime;
	}

	public Integer getMaxUseTime() {
		return maxUseTime;
	}

	public void setMaxUseTime(Integer maxUseTime) {
		this.maxUseTime = maxUseTime;
	}

	public Integer getLogId() {
		return logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUserIp() {
		return userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getUseTime() {
		return useTime;
	}

	public void setUseTime(Integer useTime) {
		this.useTime = useTime;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	/* (non-Javadoc)    
	 * @see java.lang.Object#toString()    
	 */
	@Override
	public String toString() {
		return "LoggerPo [logId=" + logId + ", userName=" + userName + ", info=" + info + ", status=" + status
				+ ", userIp=" + userIp + ", msg=" + msg + ", createTime=" + createTime + ", minAccessTime="
				+ minAccessTime + ", maxAccessTime=" + maxAccessTime + ", useTime=" + useTime + ", minUseTime="
				+ minUseTime + ", maxUseTime=" + maxUseTime + "]";
	}
	
	
}
