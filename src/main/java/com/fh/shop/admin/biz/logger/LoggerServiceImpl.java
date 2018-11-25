/** 
 * <pre>项目名称:shop-admin-v2 
 * 文件名称:LoggerServiceImpl.java 
 * 包名:com.fh.shop.admin.biz.logger 
 * 创建日期:2018年10月17日下午7:41:39 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.biz.logger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.shop.admin.mapper.logger.LoggerDao;
import com.fh.shop.admin.po.LoggerPo;

/** 
 * <pre>项目名称：shop-admin-v2    
 * 类名称：LoggerServiceImpl    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月17日 下午7:41:39    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月17日 下午7:41:39    
 * 修改备注：       
 * @version </pre>    
 */
@Service("loggerService")
public class LoggerServiceImpl implements LoggerService {

	@Autowired
	private LoggerDao loggerDao;

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.logger.LoggerService#addLogger(com.fh.shop.admin.po.LoggerPo)    
	 */
	public void addLogger(LoggerPo log) {
		loggerDao.addLogger(log);
		
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.logger.LoggerService#pageCount(com.fh.shop.admin.po.LoggerPo)    
	 */
	public int pageCount(LoggerPo log) {
		// TODO Auto-generated method stub
		return loggerDao.pageCount(log);
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.logger.LoggerService#findLogger(com.fh.shop.admin.po.LoggerPo)    
	 */
	public List<LoggerPo> findLogger(LoggerPo log) {
		// TODO Auto-generated method stub
		return loggerDao.findLogger(log);
	}
}
