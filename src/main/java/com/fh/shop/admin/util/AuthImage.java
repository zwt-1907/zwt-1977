package com.fh.shop.admin.util;


import org.apache.commons.lang.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.io.IOException;
import java.util.UUID;

public class AuthImage extends HttpServlet  {  
    static final long serialVersionUID = 1L;  
  
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
       //设置头文件信息以及文本类型
    	response.setHeader("Pragma", "No-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        response.setContentType("image/jpeg");  
          
        //生成随机字串  
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);  
        //存入会话session  
        HttpSession session = request.getSession();  
       // session.setAttribute("code", verifyCode.toLowerCase());


        String fhCodeId = CookieUtil.readCookie(request, "fhCodeId");
        if (StringUtils.isEmpty(fhCodeId)){
            //生成sessionId
            fhCodeId= UUID.randomUUID().toString().replace("-","").toUpperCase();
            //将验证码写入cookie中							hei.com
            CookieUtil.writeCookie("fhCodeId",fhCodeId,"hei.com",-1,response);
       }
       //写入redis
        RedisUtil.set("code:"+fhCodeId,verifyCode.toLowerCase());
        //设置redis的生命周期
        RedisUtil.exprie("code:"+fhCodeId,1*60);

        //生成图片  
        int w = 100, h = 35;  
        VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);  
    }  
} 