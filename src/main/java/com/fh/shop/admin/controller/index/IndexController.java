/** 
 * <pre>项目名称:shop-admin-v1 
 * 文件名称:IndexController.java 
 * 包名:com.fh.mall.admin.controller 
 * 创建日期:2018年10月7日下午3:56:24 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.controller.index;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.shop.admin.biz.demp.IDeptService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.common.SystemEnum;
import com.fh.shop.admin.po.Dept;



/** 
 * <pre>项目名称：shop-admin-v1    
 * 类名称：IndexController    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月7日 下午3:56:24    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月7日 下午3:56:24    
 * 修改备注：       
 * @version </pre>    
 */
@Controller
public class IndexController {

	//注入service层 
	@Resource
	private IDeptService deptService;
	
	//跳转到前台页面
	@RequestMapping("user/index")
	public String index(){
		return "index";
	}
	
	//菜单树展示
	@RequestMapping("/dept/findDeptList")
	@ResponseBody
	public ServerResponse findDeptList(){
		List<Dept> deptList = deptService.findDeptList();
		List<Map> deptDataList = new ArrayList<Map>();
		for (Dept dept : deptList) {
			
			Map dataMap = new HashMap();
			dataMap.put("id", dept.getId());
			dataMap.put("pId", dept.getFatherId());
			dataMap.put("name", dept.getDeptName());
			dataMap.put("description", dept.getDescription());
			dataMap.put("addtime", dept.getAddtime());
			deptDataList.add(dataMap);
		}
		return ServerResponse.success(deptDataList);
	}
	
	//菜单树新增
	@RequestMapping("/dept/addDept")
	@ResponseBody
	public ServerResponse addDept(Dept dept){
		
		deptService.addDept(dept);
		
		return ServerResponse.success(dept);
	}
	
	//菜单树修改
	@RequestMapping("/dept/update")
	@ResponseBody
	public ServerResponse update(Dept dept){
		
		deptService.update(dept);
		
		return ServerResponse.success();
	}
	//菜单树删除
	@RequestMapping("/dept/deleteDept")
	@ResponseBody
	public ServerResponse deleteDept(@RequestParam("idList[]") List<Integer> idList){
		
		deptService.deleteDept(idList);
	
		return ServerResponse.success();
	}
}
