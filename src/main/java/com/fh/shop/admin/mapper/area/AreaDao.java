/** 
 * <pre>项目名称:shop-admin-v2 
 * 文件名称:AreaDao.java 
 * 包名:com.fh.shop.admin.mapper.area 
 * 创建日期:2018年10月8日下午3:40:10 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.mapper.area;

import com.fh.shop.admin.po.Area;

import java.util.List;

/** 
 * <pre>项目名称：shop-admin-v2    
 * 类名称：AreaDao    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月8日 下午3:40:10    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月8日 下午3:40:10    
 * 修改备注：       
 * @version </pre>    
 */
public interface AreaDao {

	/** <pre>findArea(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月8日 下午3:54:25    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月8日 下午3:54:25    
	 * 修改备注： 
	 * @return</pre>    
	 */
	List<Area> findArea();

	/** <pre>addArea(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月8日 下午5:14:48    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月8日 下午5:14:48    
	 * 修改备注： 
	 * @param area</pre>    
	 */
	void addArea(Area area);

	/** <pre>update(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月8日 下午5:30:40    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月8日 下午5:30:40    
	 * 修改备注： 
	 * @param area</pre>    
	 */
	void update(Area area);

	/** <pre>deleteArea(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月8日 下午10:49:59    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月8日 下午10:49:59    
	 * 修改备注： 
	 * @param ids</pre>    
	 */
	void deleteArea(List<Integer> list);

}
