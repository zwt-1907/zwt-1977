/** 
 * <pre>项目名称:shop-admin-v2 
 * 文件名称:AreaServiceImpl.java 
 * 包名:com.fh.shop.admin.biz.area 
 * 创建日期:2018年10月8日下午3:39:07 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.biz.area;

import com.fh.shop.admin.mapper.area.AreaDao;
import com.fh.shop.admin.po.Area;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/** 
 * <pre>项目名称：shop-admin-v2    
 * 类名称：AreaServiceImpl    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月8日 下午3:39:07    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月8日 下午3:39:07    
 * 修改备注：       
 * @version </pre>    
 */
@Service("areaService")
public class AreaServiceImpl implements AreaService {

	@Autowired
	private AreaDao areaDao;

	
	
	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.area.AreaService#findArea()    
	 */
	public List<Area> findArea() {
		return areaDao.findArea();
	}



	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.area.AreaService#addArea(com.fh.shop.admin.po.Area)    
	 */
	public void addArea(Area area) {
		areaDao.addArea(area);
		
	}



	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.area.AreaService#update(com.fh.shop.admin.po.Area)    
	 */
	public void update(Area area) {
		areaDao.update(area);
		
	}



	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.area.AreaService#deleteArea(java.lang.String)    
	 */
	public void deleteArea(String ids) {
		if (StringUtils.isNotBlank(ids)) {
			String[] split = ids.split(",");
			List<Integer> list=new ArrayList<Integer>(); 
			for (int i = 0; i < split.length; i++) {
				list.add(Integer.parseInt(split[i]));
			}
		areaDao.deleteArea(list);
		}
	}
}
