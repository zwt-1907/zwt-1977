/** 
 * <pre>项目名称:shop-admin-v1 
 * 文件名称:EmployeeServiceImpl.java 
 * 包名:com.fh.mall.admin.biz.employee 
 * 创建日期:2018年10月10日上午10:23:14 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.biz.employee;

import java.math.BigDecimal;
import java.util.*;

import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.util.CacheManager;
import com.fh.shop.admin.util.Md5Util;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.shop.admin.mapper.employee.EmployeeDao;
import com.fh.shop.admin.po.Employee;

import javax.sound.midi.Soundbank;


/** 
 * <pre>项目名称：shop-admin-v1    
 * 类名称：EmployeeServiceImpl    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月10日 上午10:23:14    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月10日 上午10:23:14    
 * 修改备注：       
 * @version </pre>    
 */
@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao employDao;

	/* (non-Javadoc)    
	 * @see com.fh.mall.admin.biz.employee.EmployeeService#findEmployee()    
	 */
	public List<Employee> findEmployee(Employee emp) {
		if(emp.getIdList() != null || emp.getStaffName() != null || emp.getStaffSex() != null || emp.getMinDate() !=null || emp.getMinSalary() != null || emp.getMaxDate() !=null|| emp.getMaxSalary() != null){
			final List<Employee> employee = employDao.findEmployee(emp);
			return employee;
		}
		Object empList = CacheManager.getInstance().getObj("empList");
		if (empList != null){
			return (List<Employee>) empList;
		}
		final List<Employee> employee = employDao.findEmployee(emp);
		CacheManager.getInstance().putObj("empList",employee);
		return employee;
	}

	/* (non-Javadoc)    
	 * @see com.fh.mall.admin.biz.employee.EmployeeService#addEmployee(com.fh.mall.admin.po.Employee)    
	 */
	public void addEmployee(Employee emp) {
		CacheManager.getInstance().remove("deptList");
		//获得salt
		String salf = RandomStringUtils.randomAlphanumeric(20);
		String empPwd = emp.getEmpPwd();
		emp.setEmpPwd(Md5Util.md5(Md5Util.md5(empPwd) + "_" + salf));
		emp.setSalf(salf);
		System.err.println("============="+emp.getEmpPwd()+"-----------------");
		employDao.addEmployee(emp);
		
	}

	/* (non-Javadoc)    
	 * @see com.fh.mall.admin.biz.employee.EmployeeService#countPage()    
	 */
	public Long countPage(Employee emp) {
		// TODO Auto-generated method stub
		return employDao.countPage(emp);
	}
	
	
	

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.employee.EmployeeService#deleteEmp(java.util.List)    
	 */
	public void deleteEmp(List<Integer> ids) {
		CacheManager.getInstance().remove("deptList");
		employDao.deleteEmp(ids);
		
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.employee.EmployeeService#updateByIdEmp(com.fh.shop.admin.po.Employee)    
	 */
	public void updateByIdEmp(Employee emp) {
		CacheManager.getInstance().remove("deptList");
		employDao.updateByIdEmp(emp);
		
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.employee.EmployeeService#dlUser(com.fh.shop.admin.po.Employee)    
	 */
	public Employee dlUser(Employee emp) {
		return employDao.dlUser(emp);
	}

	/* 修改数据库登陆状态   
	 * @see com.fh.shop.admin.biz.employee.EmployeeService#updateStatus()    
	 */
	public void updateStatus(Integer id,Integer status) {
		employDao.updateStatus(id,status);
	}


	/* 修改错误次数和错误时间
	 * @see com.fh.shop.admin.biz.employee.EmployeeService#updateSignCountAndLoginTime(int, java.util.Date)    
	 */
	public void updateSignCountAndLoginTime(Date newDate, Integer id) {
		employDao.updateSignCountAndLoginTime(newDate,id);
	}
	//登录成功。清空错误次数
	@Override
	public void updateSignCount(Integer id) {
		employDao.updateSignCount(id);
	}

	//登录成功的次数
	@Override
	public void addOkCount(Integer id) {
		employDao.addOkCount(id);
		//上次登录的时间
		employDao.updateOkTime(id,new Date());
	}
	//每天的登录次数，重置为0
	@Override
	public void updateOkCount(Integer id) {
		employDao.updateOkCount(id);
	}

	@Override
	public void updateStatus(Employee emp) {
		employDao.updateEmpStatus(emp);
	}


	//回显
	@Override
	public ServerResponse toUpdateEmp(Integer id) {
		Employee emp = employDao.toUpdateEmp(id);
		return ServerResponse.success(emp);
	}

	@Override
	public ServerResponse empAndDeptPie(String param) {
		String[] nodes = param.split(";");
		List<Map> mapList = new ArrayList<Map>();
		for (int i = 0; i <nodes.length ; i++) {
			Map map = new HashMap();
			String [] node = nodes[i].split(":");
			String	name = node[0];
			String[] idd = node[1].split(",");

			List<Integer> idList = new ArrayList<Integer>();
			for (int j = 0; j <idd.length ; j++) {
				idList.add(Integer.valueOf(idd[j]));
			}

			Integer countPie = employDao.empAndDeptPie(idList);
			map.put("name",name);
			map.put("y",countPie);
			mapList.add(map);
		}
		return ServerResponse.success(mapList);
	}

	@Override
	public ServerResponse empAndDeptcolumn(String param) {
		String[] nodes = param.split(";");
		List mapList = new ArrayList();
		for (int i = 0; i <nodes.length ; i++) {
			List map = new ArrayList();
			String [] node = nodes[i].split(":");
			String	name = node[0];
			String[] idd = node[1].split(",");

			List<Integer> idList = new ArrayList<Integer>();
			for (int j = 0; j <idd.length ; j++) {
				idList.add(Integer.valueOf(idd[j]));
			}

			Double countPie = employDao.empAndDeptcolumn(idList);
			map.add(name);
			map.add(countPie);
			mapList.add(map);
		}
		return ServerResponse.success(mapList);
	}

	//统计各部门人数

	/* (non-Javadoc)
	 * @see com.fh.shop.admin.biz.employee.EmployeeService#downLoadExcel(com.fh.shop.admin.po.Employee)    
	 */
	public List<Employee> downLoadExcel(Employee emp) {
		// TODO Auto-generated method stub
		return employDao.downLoadExcel(emp);
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.employee.EmployeeService#dynaMicdownLoadExcel(com.fh.shop.admin.po.Employee)    
	 */
	public List<Employee> dynaMicdownLoadExcel(Employee emp) {
		// TODO Auto-generated method stub
		return employDao.dynaMicdownLoadExcel(emp);
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.employee.EmployeeService#exportExeclByDept(java.lang.String)    
	 */
	public List<Employee> exportExeclByDept(String str) {
		if(StringUtils.isNotBlank(str)){
			String[] deptArr = str.split(",");
			List<Integer> list = new ArrayList<Integer>();
				for (String s : deptArr) {
					list.add(Integer.parseInt(s));
				}
				List<Employee> empList = employDao.texportExeclByDept(list);
				return empList;
		}
		return null;

	}


}
