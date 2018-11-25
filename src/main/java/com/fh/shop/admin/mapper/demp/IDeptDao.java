/** 
 * <pre>项目名称:shop-admin 
 * 文件名称:IDeptDao.java 
 * 包名:com.fh.shop.admin.mapper.dept 
 * 创建日期:2018年10月6日下午5:08:43 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.mapper.demp;

import java.util.List;

import com.fh.shop.admin.po.Dept;


/** 
 * <pre>项目名称：shop-admin    
 * 类名称：IDeptDao    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月6日 下午5:08:43    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月6日 下午5:08:43    
 * 修改备注：       
 * @version </pre>    
 */
public interface IDeptDao {

	/**
	 * 不使用事务增加部门表
	 */
	void addDept(Dept dept);

	/** <pre>findDeptList(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月7日 下午4:08:22    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月7日 下午4:08:22    
	 * 修改备注： 
	 * @return</pre>    
	 */
	List<Dept> findDeptList();

	/** <pre>update(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月8日 下午12:20:40    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月8日 下午12:20:40    
	 * 修改备注： 
	 * @param dept</pre>    
	 */
	void update(Dept dept);

	/** <pre>deleteDept(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月8日 下午11:56:11    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月8日 下午11:56:11    
	 * 修改备注： 
	 * @param ids</pre>    
	 */
	void deleteDept(List<Integer> ids);

}
