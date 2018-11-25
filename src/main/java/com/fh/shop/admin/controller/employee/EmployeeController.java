/**
 * <pre>项目名称:shop-admin-v1
 * 文件名称:EmployeeController.java
 * 包名:com.fh.mall.admin.controller.employee
 * 创建日期:2018年10月10日上午10:20:33
 * Copyright (c) 2018, zwt_951119@163.com All Rights Reserved.</pre>
 */
package com.fh.shop.admin.controller.employee;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fh.shop.admin.util.*;
import com.google.gson.Gson;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.shop.admin.annotation.LogAnnotation;
import com.fh.shop.admin.biz.employee.EmployeeService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.common.SystemEnum;
import com.fh.shop.admin.po.Employee;


/**
 * <pre>项目名称：shop-admin-v1
 * 类名称：EmployeeController
 * 类描述：
 * 创建人：张伟涛 zwt_951119@163.com
 * 创建时间：2018年10月10日 上午10:20:33
 * 修改人：张伟涛 zwt_951119@163.com
 * 修改时间：2018年10月10日 上午10:20:33
 * 修改备注：
 * @version </pre>
 */
@Controller
public class EmployeeController {

    @Resource
    private EmployeeService employeeService;


    //session
    @Autowired
    private HttpServletRequest request;
	
	/*@RequestMapping("/user/userLogin")
	@ResponseBody
	public Map Login(Employee emp,HttpServletRequest request){
		
		Date newDate = new Date();
		String snewDate = DateUtil.date2String(newDate, DateUtil.YMD);
		
		Map map = new HashMap();
		
		if (StringUtils.isBlank(emp.getAccount()) && StringUtils.isBlank(emp.getEmpPwd()) && StringUtils.isBlank(emp.getImgAuthImag())) {
			map.put("message", "用户名或密码为空");
			return map;
		}
		//验证码
		String eyeHowCode = (String) request.getSession().getAttribute("rand");
		if (!eyeHowCode.equals(emp.getImgAuthImag())) {
			map.put("message", "验证码错误");
		}
		//查询数据库
		Employee dLUser = employeeService.dlUser(emp);
		
		if (null==dLUser) {
			map.put("message", "该用户不存在");
			return map;
		}
				
		if (dLUser.getStatus() == 0) {
			map.put("message", "该账户已被锁定");
			return map;
		}else{
			//登陆次数
			int count = dLUser.getSignCount();
			
			if (!dLUser.getEmpPwd().equals(emp.getEmpPwd()) ) {
				if (snewDate.equals(DateUtil.date2String(dLUser.getLoginTime(),DateUtil.YMD))) {
					count ++;
					if (count == (4-1)) {
						//修改数据库登陆状态
						employeeService.updateStatus(dLUser.getId());
					}
				}else {
					count = 1;
				}
				//update 修改错误登陆次数，时间
				employeeService.updateSignCountAndLoginTime(count,newDate,dLUser.getId());
				map.put("message", "用户名或密码错误");
				return map;
			}
		}		
		request.getSession().setAttribute("login", dLUser);
		map.put("massage", "ok");
		return map;
	}*/

    //退出
    @RequestMapping("/removeUser")
    public String removeUser() {
        request.getSession().invalidate();
        //删除
        String fhCodeId = CookieUtil.readCookie(request, "fhCodeId");
        RedisUtil.del("user:"+fhCodeId);
        return "redirect:login.jsp";
    }

    @RequestMapping("/user/userLogin")
    @ResponseBody
    public ServerResponse login(Employee emp) {

        //先验证信息是否完整
        if (StringUtils.isEmpty(emp.getAccount()) || StringUtils.isEmpty(emp.getEmpPwd()) || StringUtils.isEmpty(emp.getImgAuthImag())) {

            return ServerResponse.error(SystemEnum.LOGIN_INFO_MISS);
        }
        //再获取用户输入的验证码判断是否和生成的一致
        //String eyeHowCode = (String) request.getSession().getAttribute("code");
        //redis里查出验证码
        String fhCodeId = CookieUtil.readCookie(request, "fhCodeId");
        String eyeHowCode = RedisUtil.get("code:" + fhCodeId);

        //先判断Cookie是否为空
        if (fhCodeId.isEmpty()){
            return ServerResponse.error(SystemEnum.ERROR_REDIS);
        }
        //在判断cookie中的验证码是否为空
        if(eyeHowCode.isEmpty()){
            return ServerResponse.error(SystemEnum.REDIS_CODE_ERROR);
        }
        //判断用户提交的验证码与cookie中的是否相等
        if (!emp.getImgAuthImag().equals(eyeHowCode)) {
            return ServerResponse.error(SystemEnum.LOGIN_CODE_ERROR);
        }

        //前面的验证都通过的话去数据库进行查询
        Employee dLUser = employeeService.dlUser(emp);

        //展现上次登录的时间
        if (dLUser.getLastLoginTime() != null) {
            dLUser.setLastTime(DateUtil.date2String(dLUser.getLastLoginTime(), DateUtil.YMD_HMS));
        }

        if (dLUser == null) {
            return ServerResponse.error(SystemEnum.LOGIN_ISUSER_ERROR);
        }

        //先判断用户的登录状态
        if (dLUser.getStatus() == SystemConst.USER_LOCK) {
            return ServerResponse.error(SystemEnum.LOGIN_USER_LOCK);
        }
        //先判断错误时间是否为空，不为空才走判断时间的判断
        if (dLUser.getLoginTime() != null) {
            //创建当前时间
            Date currDate = DateUtil.StrToDate(DateUtil.date2String(new Date(), DateUtil.YMD), DateUtil.YMD);
            //当前时间与最后一次错误时间做对比
            if (currDate.after(dLUser.getLoginTime())) {
                //证明不在同一天，将错误登录次数重置为0
                employeeService.updateSignCount(dLUser.getId());

                //重置新一天的错误登录次数
                dLUser.setSignCount(0);
            }
        }

        //用户输入的密码使用md5进行转换
        String empPwd = emp.getEmpPwd();
        //获取数据库里的salf
        String salf = dLUser.getSalf();
        //前台发送过来的是已经加密一次的密码
        String newPwd = Md5Util.md5(empPwd + "_" + salf);

        //验证密码是否正确   密码错误
        if (!newPwd.equals(dLUser.getEmpPwd())) {

            //先去修改错误时间和错误次数
            employeeService.updateSignCountAndLoginTime(new Date(), dLUser.getId());

            //判断用户密码错误的次数为3时，修改登录状态（锁定）
            if (dLUser.getSignCount() == (SystemConst.USER_ERROR_COUNT - 1)) {
                //修改登录状态
                employeeService.updateStatus(dLUser.getId(), SystemConst.USER_LOCK);
            }
            return ServerResponse.error(SystemEnum.LOGIN_PWD_ERROR);

        } else {
            //如果密码正确，就清空密码错误的次数
            employeeService.updateSignCount(dLUser.getId());
        }

        //记录用户今天是第几次登录  判断是否是第一次登录   是  不进入判断
        if (dLUser.getLastLoginTime() != null) {
            //创建当前时间
            Date currDate = DateUtil.StrToDate(DateUtil.date2String(new Date(), DateUtil.YMD), DateUtil.YMD);
            //获取上次登录时间
            Date lastTime = DateUtil.StrToDate(DateUtil.date2String(dLUser.getLastLoginTime(), DateUtil.YMD), DateUtil.YMD);
            if (currDate.after(lastTime)) {
                //把实体类中重置为0
                dLUser.setLoginOkCount(0);
                //如果在当前时间之后就把登录次数重置为0
                employeeService.updateOkCount(dLUser.getId());
            } else {
                //否则加1
                employeeService.addOkCount(dLUser.getId());
            }
        } else {
            //是第一次就设置为1，实体类设置为0
            employeeService.updateOkCount(dLUser.getId());
        }
        //增加成功登录的次数和时间
        employeeService.addOkCount(dLUser.getId());
        //验证都通过的话就把信息放在session里
        request.getSession().setAttribute("login", dLUser);
        //登录信息都放在cookie中
        Gson gson = new Gson();
        String dLUserJson = gson.toJson(dLUser);
        RedisUtil.set("user:"+fhCodeId,dLUserJson);
        RedisUtil.exprie("user:"+fhCodeId,2*60);
        //清空code
        RedisUtil.del("code:"+fhCodeId);
        //清空验证码
       // request.getSession().removeAttribute("code");
        return ServerResponse.success();
    }

    //switch修改登录状态  updateStatus
    @RequestMapping("/emp/updateStatus")
    @ResponseBody
    public ServerResponse updateStatus(Employee emp) {
        employeeService.updateStatus(emp);
        return ServerResponse.success();
    }

    //饼状图，统计各部门人数
    @RequestMapping("/emp/empAndDeptPie")
    @ResponseBody
    @LogAnnotation("统计人数")
    public ServerResponse empAndDeptPie(String param) {
        return employeeService.empAndDeptPie(param);
    }

    //柱状图，统计各部门平均工资
    @RequestMapping("/emp/empAndDeptcolumn")
    @ResponseBody
    @LogAnnotation("统计人数")
    public ServerResponse empAndDeptcolumn(String param) {
        return employeeService.empAndDeptcolumn(param);
    }


    /**
     * 导出部门execl
     */
    @RequestMapping("exportExeclByDept")
    @LogAnnotation(value = "导出部门execl")
    public void exportExeclByDept(String params, HttpServletResponse response) {

        //生成execl
        XSSFWorkbook wb = new XSSFWorkbook();
        if (StringUtils.isNotBlank(params)) {
            String[] deptArr = params.split(";");
            for (int i = 0; i < deptArr.length; i++) {
                String[] splitArr = deptArr[i].split(":");

                //创建sheet
                XSSFSheet sheet = wb.createSheet(splitArr[0]);
                //标题
                buildTitle(sheet, wb);
                //表头
                buildHeader(wb, sheet);

                //查询数据
                List<Employee> list = employeeService.exportExeclByDept(splitArr[1]);
                //创建表内容
                buildBody(list, wb, sheet);
            }
        }
        //下载
        FileUtil.xlsDownloadFile(response, wb);
    }


    //动态导出Excel
    @RequestMapping("/emp/dynaMicdownLoadExcel")
    public void dynaMicdownLoadExcel(Employee emp, HttpServletResponse response) {

        // 查询数据
        List<Employee> empList = employeeService.dynaMicdownLoadExcel(emp);
        // 将数据转换为excel
        XSSFWorkbook wb = buildExcel(empList);
        // 下载
        FileUtil.excelDownload(wb, response);
    }

    //导出Excel
    @RequestMapping("/emp/downLoadExcel")
    public void downLoadExcel(Employee emp, HttpServletResponse response) {

        System.out.println("===========================");

        // 查询数据
        List<Employee> empList = employeeService.downLoadExcel(emp);
        for (int i = 0; i < empList.size(); i++) {
            System.out.println(empList.get(i));
        }

        // 将数据转换为excel
        XSSFWorkbook wb = buildExcel(empList);
        // 下载
        FileUtil.excelDownload(wb, response);
    }

    private XSSFWorkbook buildExcel(List<Employee> empList) {
        // 创建workbook
        XSSFWorkbook wb = new XSSFWorkbook();
        // 创建sheet
        XSSFSheet sheet = wb.createSheet("员工人数" + empList.size());
        // 构建title
        buildTitle(sheet, wb);
        // 构建header
        buildHeader(wb, sheet);
        // 构建主体
        buildBody(empList, wb, sheet);
        return wb;
    }

    //--------------------------------------------------------------------------
    private void buildTitle(XSSFSheet sheet, XSSFWorkbook wb) {
        // 构建title样式
        XSSFCellStyle titleStyle = buildTitleStyle(wb);

        XSSFRow titleRow = sheet.createRow(3);
        XSSFCell titleCell = titleRow.createCell(7);
        titleCell.setCellValue("员工列表");
        titleCell.setCellStyle(titleStyle);
        CellRangeAddress cellRangeAddress = new CellRangeAddress(3, 4, 7, 11);
        sheet.addMergedRegion(cellRangeAddress);
    }

    private XSSFCellStyle buildTitleStyle(XSSFWorkbook wb) {
        // 创建居中的样式
        XSSFCellStyle titleStyle = wb.createCellStyle();
        titleStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);//水平居中
        titleStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);//垂直居中
        // 创建字体样式
        XSSFFont font = wb.createFont();
        font.setFontHeightInPoints((short) 22);
        font.setBold(true);
        titleStyle.setFont(font);
        // 设置背景颜色
        titleStyle.setFillForegroundColor(HSSFColor.GREEN.index);//设置图案颜色
        //titleStyle.setFillBackgroundColor(HSSFColor.RED.index);//设置图案背景色
        titleStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);//设置图案样式
        return titleStyle;
    }

    //-------------------------------------------------------------------------
    private void buildHeader(XSSFWorkbook wb, XSSFSheet sheet) {
        String[] headers = {"员工名", "性别", "生日", "部门", "薪资"};
        XSSFRow headerRow = sheet.createRow(5);
        XSSFCellStyle headerStyle = wb.createCellStyle();
        // 加粗
        XSSFFont headerFont = wb.createFont();
        headerFont.setBold(true);
        headerStyle.setFont(headerFont);
        // 居中
        headerStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);
        headerStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
        // 背景色
        headerStyle.setFillForegroundColor(HSSFColor.RED.index);
        headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        int start = 7;
        int end = start + headers.length;
        for (int i = start; i < end; i++) {
            XSSFCell HeaderCell = headerRow.createCell(i);
            HeaderCell.setCellValue(headers[i - start]);
            HeaderCell.setCellStyle(headerStyle);
        }
    }

    //----------------------------------------------------------------------
    private void buildBody(List<Employee> empList, XSSFWorkbook wb, XSSFSheet sheet) {
        XSSFCellStyle dateCellStyle = wb.createCellStyle();
        dateCellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy"));
        XSSFCellStyle warnStyle = wb.createCellStyle();
        warnStyle.setFillForegroundColor(HSSFColor.YELLOW.index);
        warnStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        XSSFCellStyle warnDateStyle = wb.createCellStyle();
        warnDateStyle.setFillForegroundColor(HSSFColor.YELLOW.index);
        warnDateStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        warnDateStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy"));
        // 构建内容主体
        for (int i = 0; i < empList.size(); i++) {
            Employee empInfo = empList.get(i);
            XSSFRow row = sheet.createRow(i + 6);

            XSSFCell movieNameCell = row.createCell(7);
            movieNameCell.setCellValue(empInfo.getStaffName());

            XSSFCell scoreCell = row.createCell(8);
            scoreCell.setCellValue(empInfo.getStaffSex());

            XSSFCell showDateCell = row.createCell(9);
            showDateCell.setCellValue(empInfo.getBirthday());
            showDateCell.setCellStyle(dateCellStyle);

            XSSFCell typeCell = row.createCell(10);
            typeCell.setCellValue(empInfo.getDept().getDeptName());

            XSSFCell areaCell = row.createCell(11);
            areaCell.setCellValue(empInfo.getSalary());

            if (empInfo.getSalary() > 600) {
                movieNameCell.setCellStyle(warnStyle);
                scoreCell.setCellStyle(warnStyle);
                showDateCell.setCellStyle(warnDateStyle);
                typeCell.setCellStyle(warnStyle);
                areaCell.setCellStyle(warnStyle);
            }

        }
    }

    //查询
    @RequestMapping("/emp/findEmployee")
    @ResponseBody
    public ServerResponse findEmployee(Integer draw, Employee emp) {

        if (StringUtils.isNotEmpty(emp.getStaffName())) {
            emp.setStaffName("%" + emp.getStaffName() + "%");
        }
        Map map = new HashMap();
        Long count = employeeService.countPage(emp);
        List<Employee> empList = employeeService.findEmployee(emp);
        map.put("data", empList);
        map.put("iTotalRecords", count);
        map.put("iTotalDisplayRecords", count);
        return ServerResponse.success(map);
    }

    //新增
    @RequestMapping("/emp/addEmployee")
    @ResponseBody
    public ServerResponse addEmployee(Employee emp) {

        employeeService.addEmployee(emp);

        return ServerResponse.success();
    }


    //删除
    @RequestMapping("/emp/deleteEmployee")
    @ResponseBody
    public ServerResponse deleteEmp(@RequestParam("ids[]") List<Integer> ids) {

        employeeService.deleteEmp(ids);

        return ServerResponse.success();
    }

    //回显
    @RequestMapping("emp/toUpdateEmp")
    @ResponseBody
    public ServerResponse toUpdateEmp(Employee emp) {

        return employeeService.toUpdateEmp(emp.getId());
    }

    //修改
    @RequestMapping("emp/updateByIdEmp")
    @ResponseBody
    public ServerResponse updateByIdEmp(Employee emp) {

        employeeService.updateByIdEmp(emp);

        return ServerResponse.success();
    }
}
