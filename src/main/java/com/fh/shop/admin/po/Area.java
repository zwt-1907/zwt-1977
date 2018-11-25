/** 
 * <pre>项目名称:shop-admin-v2 
 * 文件名称:Area.java 
 * 包名:com.fh.shop.admin.po 
 * 创建日期:2018年10月8日下午3:46:32 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.po;

import java.io.Serializable;

/** 
 * <pre>项目名称：shop-admin-v2    
 * 类名称：Area    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月8日 下午3:46:32    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月8日 下午3:46:32    
 * 修改备注：       
 * @version </pre>    
 */
public class Area implements Serializable{

	private static final long serialVersionUID = -4881173285365251215L;

	private Integer areaId;
	
	private String areaName;
	
	private Integer areaFatherId;

	public Integer getAreaId() {
		return areaId;
	}

	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public Integer getAreaFatherId() {
		return areaFatherId;
	}

	public void setAreaFatherId(Integer areaFatherId) {
		this.areaFatherId = areaFatherId;
	}

	/* (non-Javadoc)    
	 * @see java.lang.Object#toString()    
	 */
	@Override
	public String toString() {
		return "Area [areaId=" + areaId + ", areaName=" + areaName + ", areaFatherId=" + areaFatherId + "]";
	}
	
	
	
}
