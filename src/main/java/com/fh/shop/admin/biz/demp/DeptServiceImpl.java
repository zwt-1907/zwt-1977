/** 
 * <pre>项目名称:shop-admin 
 * 文件名称:DeptServiceImpl.java 
 * 包名:com.fh.shop.admin.biz.dept 
 * 创建日期:2018年10月6日下午5:06:23 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.biz.demp;

import java.util.List;

import com.fh.shop.admin.util.CacheManager;
import com.fh.shop.admin.util.RedisUtil;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.shop.admin.mapper.demp.IDeptDao;
import com.fh.shop.admin.mapper.employee.EmployeeDao;
import com.fh.shop.admin.po.Dept;


/** 
 * <pre>项目名称：shop-admin    
 * 类名称：DeptServiceImpl    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月6日 下午5:06:24    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月6日 下午5:06:24    
 * 修改备注：       
 * @version </pre>    
 */
/**
 * 
 *<bean id="deptServiceImpl" class="com.fh.shop.admin.biz.dept.DeptServiceImpl" autowired="byType"></bean>
 */
@Service("deptService")
public class DeptServiceImpl implements IDeptService{

	//通过属性注入(byType)的方式，注入dao层
	@Autowired
	private IDeptDao deptDao;
	
	//员工表
	@Autowired
	private EmployeeDao employeeDao; 
	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.dept.IDeptService#addDept(com.fh.shop.admin.po.Dept)    
	 */
	public void addDept(Dept dept) {
		CacheManager.getInstance().remove("deptList");
		deptDao.addDept(dept);
	}
	/* (non-Javadoc)    
	 * @see com.fh.mall.admin.biz.dept.IDeptService#findDeptList()    
	 */
	public List<Dept> findDeptList() {
		Gson gson = new Gson();
		String deptListKey = RedisUtil.get("deptList");
		if (deptListKey != null){
			List deptJsonList = gson.fromJson(deptListKey, new TypeToken<List<Dept>>() {
			}.getType());
			return deptJsonList;
		}

		List<Dept> deptList = deptDao.findDeptList();

		RedisUtil.set("deptList",gson.toJson(deptList));
		return deptList;


	}
	/* (non-Javadoc)    
	 * @see com.fh.mall.admin.biz.dept.IDeptService#update(com.fh.mall.admin.po.Dept)    
	 */
	public void update(Dept dept) {
		CacheManager.getInstance().remove("deptList");
		deptDao.update(dept);
		
	}
	/* (non-Javadoc)    
	 * @see com.fh.mall.admin.biz.dept.IDeptService#deleteDept(java.util.List)    
	 */
	public void deleteDept(List<Integer> ids) {
		CacheManager.getInstance().remove("deptList");
		deptDao.deleteDept(ids);
		//调用员工表删除
		employeeDao.deleteBachByDeptId(ids);
	}

}
