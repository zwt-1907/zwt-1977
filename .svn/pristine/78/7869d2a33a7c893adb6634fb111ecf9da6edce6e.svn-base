/** 
 * <pre>项目名称:shop-admin-v2 
 * 文件名称:LogAspect.java 
 * 包名:com.fh.shop.admin 
 * 创建日期:2018年10月12日下午3:36:39 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.logaspect;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.fh.shop.admin.annotation.LogAnnotation;
import com.fh.shop.admin.biz.logger.LoggerService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.common.SystemEnum;
import com.fh.shop.admin.po.Employee;

import com.fh.shop.admin.po.LoggerPo;
import com.fh.shop.admin.util.IpUtil;
import com.fh.shop.admin.util.WebContext;

/** 
 * <pre>项目名称：shop-admin-v2    
 * 类名称：LogAspect    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月12日 下午3:36:39    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月12日 下午3:36:39    
 * 修改备注：       
 * @version </pre>    
 */
@Component("logAspect")
public class LogAspect {
	
	public static final Logger LOG = LoggerFactory.getLogger(LogAspect.class);
	
	//注入service层
	@Resource
	private LoggerService loggerService;
	
	public Object around(ProceedingJoinPoint pjp){
		
		//日志实体类
		LoggerPo log = new LoggerPo();
		//获取session
		Employee emp = (Employee) WebContext.getRequest().getSession().getAttribute("login");
		
		MethodSignature methodSig = (MethodSignature) pjp.getSignature();
		
		Method method = methodSig.getMethod();
		
		String msg = "";
		if (method.isAnnotationPresent(LogAnnotation.class)) {
			LogAnnotation logAnn = method.getAnnotation(LogAnnotation.class);
			msg = logAnn.value();
		}
		
		String userName = "未登录用户";
		String userIp = "";
		if (emp != null) {
			userName = emp.getAccount();
			userIp = IpUtil.getIpAddress(WebContext.getRequest());
		}
		//获取要执行的类全限定名
		String canonicalName = pjp.getTarget().getClass().getCanonicalName();
		//获取要执行的方法名
		String methodName = pjp.getSignature().getName();
		
		Object result = null;
		Long start = 0L;
		Long end = 0L;
		try {
			start = System.currentTimeMillis();
			result = pjp.proceed();
			end = System.currentTimeMillis();
			addLog(log, msg, userName, userIp, canonicalName, methodName, start, end,1,null);
			
			LOG.info("\n"+"{}类的："+"\n"+"{}方法执行成功",canonicalName,methodName);
		} catch (Throwable e) {
			e.printStackTrace();
			Map map = new HashMap();
			map.put("error", "error");
			addLog(log, msg, userName, userIp, canonicalName, methodName, start, end,1,e);
			LOG.error("\n"+"{}类的："+"\n"+"{}方法执行失败"+"\n"+"错误是{}",canonicalName,methodName,e);
			return ServerResponse.error();
		}
		
		return result;
	}

	/** <pre>addLog(这里用一句话描述这个方法的作用)   
	 * 创建人：张伟涛 zwt_951119@163.com    
	 * 创建时间：2018年10月18日 下午6:51:43    
	 * 修改人：张伟涛 zwt_951119@163.com     
	 * 修改时间：2018年10月18日 下午6:51:43    
	 * 修改备注： 
	 * @param log
	 * @param msg
	 * @param userName
	 * @param userIp
	 * @param canonicalName
	 * @param methodName
	 * @param start
	 * @param end</pre>    
	 */
	private void addLog(LoggerPo log, String msg, String userName, String userIp, String canonicalName,
			String methodName, Long start, Long end,Integer status,Throwable e) {
		//给实体类赋值
		log.setUserName(userName);
		log.setUserIp(userIp);
		log.setStatus(status);
		if (null != e) {
			log.setInfo(canonicalName+"类的"+","+methodName+"方法出现异常"+e);
		}else {
			log.setInfo(canonicalName+"类的"+","+methodName+"方法");
		}
		
		log.setUseTime((int) (end-start));
		log.setCreateTime(new Date());
		log.setMsg(msg);
		loggerService.addLogger(log);
	}

}
