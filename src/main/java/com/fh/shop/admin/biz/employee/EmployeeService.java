/** 
 * <pre>项目名称:shop-admin-v1 
 * 文件名称:EmployeeService.java 
 * 包名:com.fh.mall.admin.biz.employee 
 * 创建日期:2018年10月10日上午10:22:48 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.biz.employee;

import java.util.Date;
import java.util.List;

import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.po.Employee;


/** 
 * <pre>项目名称：shop-admin-v1    
 * 类名称：EmployeeService    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月10日 上午10:22:48    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月10日 上午10:22:48    
 * 修改备注：       
 * @version </pre>    
 */
public interface EmployeeService {

	/** <pre>findEmployee(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月10日 上午11:14:54    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月10日 上午11:14:54    
	 * 修改备注： 
	 * @param emp 
	 * @return</pre>    
	 */
	List<Employee> findEmployee(Employee emp);

	/** <pre>addEmployee(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月10日 上午11:56:05    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月10日 上午11:56:05    
	 * 修改备注： 
	 * @param emp</pre>    
	 */
	void addEmployee(Employee emp);

	/** <pre>countPage(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月10日 下午6:25:06    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月10日 下午6:25:06    
	 * 修改备注： 
	 * @param emp 
	 * @return</pre>    
	 */
	Long countPage(Employee emp);

	
	
	void deleteEmp(List<Integer> ids);

	/** <pre>updateByIdEmp(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月11日 上午10:35:55    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月11日 上午10:35:55    
	 * 修改备注： 
	 * @param emp</pre>    
	 */
	void updateByIdEmp(Employee emp);

	/** <pre>dlUser(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月15日 下午8:01:25    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月15日 下午8:01:25    
	 * 修改备注： 
	 * @param emp
	 * @return</pre>    
	 */
	Employee dlUser(Employee emp);

	/** <pre>updateStatus(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月15日 下午9:59:09    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月15日 下午9:59:09    
	 * 修改备注： </pre>    
	 * @param
	 */
	void updateStatus(Integer id,Integer status);

	/** <pre>updateSignCountAndLoginTime(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月15日 下午10:54:24    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月15日 下午10:54:24    
	 * 修改备注： 
	 * @param count
	 * @param id 
	 * @param newDate</pre>    
	 */
	void updateSignCountAndLoginTime(Date newDate, Integer id);

	/** <pre>downLoadExcel(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月20日 上午1:07:45    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月20日 上午1:07:45    
	 * 修改备注： 
	 * @param emp
	 * @return</pre>    
	 */
	List<Employee> downLoadExcel(Employee emp);

	/** <pre>dynaMicdownLoadExcel(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月20日 下午5:05:37    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月20日 下午5:05:37    
	 * 修改备注： 
	 * @param emp
	 * @return</pre>    
	 */
	List<Employee> dynaMicdownLoadExcel(Employee emp);

	/** <pre>exportExeclByDept(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月22日 上午7:21:35    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月22日 上午7:21:35    
	 * 修改备注： 
	 * @param string
	 * @return</pre>    
	 */
	List<Employee> exportExeclByDept(String string);

	void updateSignCount(Integer id);

	void addOkCount(Integer id);

    void updateOkCount(Integer id);

	void updateStatus(Employee emp);

    ServerResponse toUpdateEmp(Integer id);

	ServerResponse empAndDeptPie(String param);

	ServerResponse empAndDeptcolumn(String param);
}
