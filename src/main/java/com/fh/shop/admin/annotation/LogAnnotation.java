/** 
 * <pre>项目名称:shop-admin-v2 
 * 文件名称:LogAnnotation.java 
 * 包名:com.fh.shop.admin.annotation 
 * 创建日期:2018年10月18日下午6:39:43 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


/** 
 * <pre>项目名称：shop-admin-v2    
 * 类名称：LogAnnotation    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月18日 下午6:39:43    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月18日 下午6:39:43    
 * 修改备注：       
 * @version </pre>    
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface LogAnnotation {

	String value() default "";
}
