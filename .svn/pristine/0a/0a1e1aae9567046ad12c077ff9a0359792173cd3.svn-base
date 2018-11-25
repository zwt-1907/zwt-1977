/** 
 * <pre>项目名称:shop-admin-v2 
 * 文件名称:LoggerController.java 
 * 包名:com.fh.shop.admin.controller.logger 
 * 创建日期:2018年10月17日下午8:35:28 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.controller.logger;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.shop.admin.annotation.LogAnnotation;
import com.fh.shop.admin.biz.logger.LoggerService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.po.LoggerPo;

/** 
 * <pre>项目名称：shop-admin-v2    
 * 类名称：LoggerController    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月17日 下午8:35:28    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月17日 下午8:35:28    
 * 修改备注：       
 * @version </pre>    
 */
@Controller
public class LoggerController {

	@Resource
	private LoggerService loggerService;
	
	@RequestMapping("/log/jump")
	@LogAnnotation("进入日志展示页面")
	public String jump(){
		return "logger/logger";
	}
	
	@RequestMapping("/log/findLogger")
	@ResponseBody
	@LogAnnotation("查询日志")
	public ServerResponse findLogger(Integer draw, LoggerPo log){
		Map map = new HashMap();
		if (null != log.getUserName() || null != log.getStatus() || null != log.getUserIp() || null != log.getInfo()) {
			log.setUserName("%"+log.getUserName()+"%");
		}
		int count = loggerService.pageCount(log);
		List<LoggerPo> logList = loggerService.findLogger(log);
		System.err.println(logList);
		map.put("status", "ok");
		map.put("data", logList);
		map.put("draw", draw);
		map.put("iTotalRecords", count);
		map.put("iTotalDisplayRecords", count);
		return ServerResponse.success(map);
	}
}
