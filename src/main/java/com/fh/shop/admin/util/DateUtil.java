/** 
 * <pre>项目名称:shop-admin 
 * 文件名称:DateUtil.java 
 * 包名:com.fh.shop.util 
 * 创建日期:2018年6月10日上午11:33:03 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.util;

import org.apache.commons.lang3.StringUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/** 
 * <pre>项目名称：shop-admin    
 * 类名称：DateUtil    
 * 类描述：    
 * 创建人：于笑扬 yuxy123@gmail.com    
 * 创建时间：2018年6月10日 上午11:33:03    
 * 修改人：于笑扬 yuxy123@gmail.com     
 * 修改时间：2018年6月10日 上午11:33:03    
 * 修改备注：       
 * @version </pre>    
 */
public class DateUtil {
	
	public static final String YMD_HMS = "yyyy-MM-dd HH:mm:ss"; 
	public static final String YMD = "yyyy-MM-dd"; 
	
	public static Date StrToDate(String date,String pattern){
		if (StringUtils.isNoneBlank(date)) {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			Date result = null;
			try {
				result = sdf.parse(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}else{
			return null;
		}
	}
	
	public static String date2String(Date date, String pattern) {
		if (date == null) {
			return "";
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String result = sdf.format(date);
		return result;
	}
	//循环遍历时间段
	public static List<String> handleCirculationDate(String today,String passday) throws ParseException{
	    List<String> listDate = new ArrayList<String>();
	    Calendar c = Calendar.getInstance();
        DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        //开始时间必须小于结束时间
        Date beginDate = dateFormat1.parse(today);
        Date endDate = dateFormat1.parse(passday);
        Date date = beginDate;
	        while (!date.equals(endDate)) {
	        System.out.println(date);
	        c.setTime(date);
	        c.add(Calendar.DATE, 1); // 日期加1天
	        date = c.getTime();
	        listDate.add(date2String(date,YMD));
	      }
	     return listDate;
	}
	
	public static void main(String[] args) throws ParseException {
		List<String> list = handleCirculationDate("2018-5-1","2018-5-10");
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
	}
	
	
}
