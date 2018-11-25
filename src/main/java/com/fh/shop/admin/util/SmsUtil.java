package com.fh.shop.admin.util;

import org.apache.commons.lang.RandomStringUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class SmsUtil {
    public static String SendSms(String mobile) {
        String nonce  = RandomStringUtils.randomAlphanumeric(10);
        String dataValue = new Date().getTime() + "";

        Map header = new HashMap();
        header.put("AppKey", SystemSmsConst.APPKEY);
        header.put("Nonce",nonce);
        header.put("CurTime",dataValue);
        header.put("CheckSum",CheckSumBuilder.getCheckSum(SystemSmsConst.APPSECRET ,nonce ,dataValue));

        Map params = new HashMap();
        params.put("mobile",mobile);
        params.put("codeLen",SystemSmsConst.CODELEN);
        params.put("templateid",SystemSmsConst.TEMPLATEID);

        String url = "https://api.netease.im/sms/sendcode.action";
        String msg = SendSmsUtil.smsUtil(url,params,header);
        return msg;
    }
}
