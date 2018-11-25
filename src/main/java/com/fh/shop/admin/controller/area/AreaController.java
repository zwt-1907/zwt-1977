/** 
 * <pre>项目名称:shop-admin-v2 
 * 文件名称:AreaController.java 
 * 包名:com.fh.shop.admin.controller.area 
 * 创建日期:2018年10月8日下午3:23:40 
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.controller.area;

import com.fh.shop.admin.biz.area.AreaService;
import com.fh.shop.admin.po.Area;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** 
 * <pre>项目名称：shop-admin-v2    
 * 类名称：AreaController    
 * 类描述：    
 * 创建人：张伟涛 zwt_951119@163.com    
 * 创建时间：2018年10月8日 下午3:23:40    
 * 修改人：张伟涛 zwt_951119@163.com     
 * 修改时间：2018年10月8日 下午3:23:40    
 * 修改备注：       
 * @version </pre>    
 */
@Controller
public class AreaController {

	@Resource
	private AreaService areaService;
	
	//跳转到前台页面
	@RequestMapping("/area/jump")
	public String jump(){
		return "area/areaList";
	}
	
	//查询地区菜单树
	@RequestMapping("/area/findArea")
	@ResponseBody
	public Map findArea(){
		Map map = new HashMap();
		List<Map> areaListMap = new ArrayList<Map>();
		try {
			List<Area> areaList = areaService.findArea();
			System.err.println(areaList);
			for (Area area : areaList) {
				Map listMap = new HashMap();
				listMap.put("id", area.getAreaId());
				listMap.put("name", area.getAreaName());
				listMap.put("pId", area.getAreaFatherId());
				areaListMap.add(listMap);
			}
			map.put("status", "ok");
			map.put("data", areaListMap);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("error", "error");
			throw new RuntimeException(e);
		}
		return map;
	}
	
	//新增   
	@RequestMapping("/area/addArea")
	@ResponseBody
	public Map addArea(Area area){
		Map map = new HashMap();
		try {
			areaService.addArea(area);
			map.put("status", "ok");
			map.put("data", area);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("error", "error");
			throw new RuntimeException(e);
		}
		return map;
	}
	//修改
	@RequestMapping("/area/update")
	@ResponseBody
	public Map update(Area area){
		Map map = new HashMap();
		try {
			areaService.update(area);
			map.put("status", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("error", "error");
			throw new RuntimeException(e);
		}
		return map;
	}
	//修改
	@RequestMapping("/area/deleteArea")
	@ResponseBody
	public Map deleteArea(String ids){
		Map map = new HashMap();
		System.err.println(ids);
		try {
			areaService.deleteArea(ids);
			map.put("status", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("error", "error");
			throw new RuntimeException(e);
		}
		return map;
	}
}
