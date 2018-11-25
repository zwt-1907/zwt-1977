package com.fh.shop.admin.po;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 
 * <pre>项目名称：shop-admin    
 * 类名称：Dept    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月6日 下午4:54:04    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月6日 下午4:54:04    
 * 修改备注：       
 * @version </pre>
 */
public class Dept implements Serializable{

	private static final long serialVersionUID = 4113957002606579138L;

	private Integer id;
	
	private String deptName;
	
	private Integer fatherId;
	
	//部门描述
	private String description;
	
	//部门添加时间
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date addtime;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@JsonFormat(pattern="yyyy-MM-dd")
	public Date getAddtime() {
		return addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Integer getFatherId() {
		return fatherId;
	}

	public void setFatherId(Integer fatherId) {
		this.fatherId = fatherId;
	}

	/* (non-Javadoc)    
	 * @see java.lang.Object#toString()    
	 */
	@Override
	public String toString() {
		return "Dept [id=" + id + ", deptName=" + deptName + ", fatherId=" + fatherId + ", description=" + description
				+ ", addtime=" + addtime + "]";
	}

	
	
	
}
