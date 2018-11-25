/** 
 * <pre>项目名称:shop-admin-v1 
 * 文件名称:EmployeeDao.java 
 * 包名:com.fh.mall.admin.mapper.employee 
 * 创建日期:2018年10月10日上午10:24:04 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.mapper.employee;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fh.shop.admin.po.Employee;


/** 
 * <pre>项目名称：shop-admin-v1    
 * 类名称：EmployeeDao    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月10日 上午10:24:04    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月10日 上午10:24:04    
 * 修改备注：       
 * @version </pre>    
 */
public interface EmployeeDao {

	/** <pre>findEmployee(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月10日 上午11:15:20    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月10日 上午11:15:20    
	 * 修改备注： 
	 * @param emp 
	 * @return</pre>    
	 */
	List<Employee> findEmployee(Employee emp);

	/** <pre>addEmployee(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月10日 上午11:56:33    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月10日 上午11:56:33    
	 * 修改备注： 
	 * @param emp</pre>    
	 */
	void addEmployee(Employee emp);

	/** <pre>countPage(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月10日 下午6:25:30    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月10日 下午6:25:30    
	 * 修改备注： 
	 * @param emp 
	 * @return</pre>    
	 */
	Long countPage(Employee emp);
	
	
	
	/** <pre>deleteEmp(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月10日 下午8:43:01    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月10日 下午8:43:01    
	 * 修改备注： 
	 * @param ids</pre>    
	 */
	void deleteEmp(List<Integer> ids);

	/** <pre>updateByIdEmp(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月11日 上午10:36:34    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月11日 上午10:36:34    
	 * 修改备注： 
	 * @param emp</pre>    
	 */
	void updateByIdEmp(Employee emp);

	/** <pre>dlUser(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月15日 下午8:02:01    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月15日 下午8:02:01    
	 * 修改备注： 
	 * @param emp
	 * @return</pre>    
	 */
	Employee dlUser(Employee emp);

	/** <pre>updateStatus(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月15日 下午10:16:26    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月15日 下午10:16:26    
	 * 修改备注： </pre>    
	 * @param id 
	 */
	void updateStatus(@Param("id") Integer id,@Param("status") Integer status);

	/** <pre>updateSignCountAndLoginTime(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月15日 下午10:54:57    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月15日 下午10:54:57    
	 * 修改备注： 
	 * @param count
	 * @param id 
	 * @param newDate</pre>    
	 */
	void updateSignCountAndLoginTime(@Param("newDate")Date newDate, @Param("id")Integer id);

	/** <pre>deleteBachByDeptId(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月19日 下午9:28:22    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月19日 下午9:28:22    
	 * 修改备注： 
	 * @param ids</pre>    
	 */
	void deleteBachByDeptId(List<Integer> ids);

	/** <pre>downLoadExcel(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月20日 上午1:08:25    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月20日 上午1:08:25    
	 * 修改备注： 
	 * @param emp
	 * @return</pre>    
	 */
	List<Employee> downLoadExcel(Employee emp);

	/** <pre>dynaMicdownLoadExcel(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月20日 下午5:06:16    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月20日 下午5:06:16    
	 * 修改备注： 
	 * @param emp
	 * @return</pre>    
	 */
	List<Employee> dynaMicdownLoadExcel(Employee emp);

	/** <pre>texportExeclByDept(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月22日 上午7:23:18    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月22日 上午7:23:18    
	 * 修改备注： 
	 * @param list
	 * @return</pre>    
	 */
	List<Employee> texportExeclByDept(List<Integer> list);

	void updateSignCount(Integer id);

	void addOkCount(Integer id);

    void updateOkCount(Integer id);

    void updateOkTime(@Param("id") Integer id,@Param("date") Date date);

    void updateEmpStatus(Employee emp);

    Employee toUpdateEmp(Integer id);

    Integer empAndDeptPie(List<Integer> ids);

	Double empAndDeptcolumn(List<Integer> idList);
}
