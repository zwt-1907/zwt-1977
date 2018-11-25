/** 
 * <pre>项目名称:shop-admin-v2 
 * 文件名称:LoggerService.java 
 * 包名:com.fh.shop.admin.biz.logger 
 * 创建日期:2018年10月17日下午7:41:02 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.biz.logger;

import java.util.List;

import com.fh.shop.admin.po.LoggerPo;

/** 
 * <pre>项目名称：shop-admin-v2    
 * 类名称：LoggerService    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月17日 下午7:41:02    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月17日 下午7:41:02    
 * 修改备注：       
 * @version </pre>    
 */
public interface LoggerService {

	/** <pre>addLogger(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月17日 下午7:49:15    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月17日 下午7:49:15    
	 * 修改备注： 
	 * @param log</pre>    
	 */
	void addLogger(LoggerPo log);

	/** <pre>pageCount(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月17日 下午8:43:49    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月17日 下午8:43:49    
	 * 修改备注： 
	 * @param log
	 * @return</pre>    
	 */
	int pageCount(LoggerPo log);

	/** <pre>findLogger(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月17日 下午8:43:53    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月17日 下午8:43:53    
	 * 修改备注： 
	 * @param log
	 * @return</pre>    
	 */
	List<LoggerPo> findLogger(LoggerPo log);

}
