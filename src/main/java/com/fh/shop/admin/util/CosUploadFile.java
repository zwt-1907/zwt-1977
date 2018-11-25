package com.fh.shop.admin.util;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.region.Region;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.UUID;

public class CosUploadFile {
    /**
     * 常用方法
     * @param cosArea
     * @return
     */
    private static COSClient getCosClient(String cosArea) {
        COSCredentials cred = new BasicCOSCredentials(SystemConst.COS_ACCESSKEY, SystemConst.COS_SECRETKEY);
        // 2 设置bucket的区域, COS地域的简称请参照 https://cloud.tencent.com/document/product/436/6224
        // clientConfig中包含了设置region, https(默认http), 超时, 代理等set方法, 使用可参见源码或者接口文档FAQ中说明
        ClientConfig clientConfig = new ClientConfig(new Region(cosArea));
        // 3 生成cos客户端
        return new COSClient(cred, clientConfig);
    }

    //删除
    public static void deleteFile(String key){
        COSClient cosclient = getCosClient(SystemConst.COS_AREA);
        // 指定要删除的 bucket 和对象键
       cosclient.deleteObject(SystemConst.COS_BACKNAME, key);
     }

    //上传
    public static String uploadFiless(InputStream is){
        COSClient cosclient = getCosClient(SystemConst.COS_AREA);

        // 此处填写的存储桶名称必须为此格式
        String bucketName = SystemConst.COS_BACKNAME;


        //文件夹名
        String fileDate = DateUtil.date2String(new Date(), DateUtil.YMD);
        //重命名
        // String newphotoName = UUID.randomUUID().toString().replace("-","");
        String key = fileDate+"/"+UUID.randomUUID().toString().replace("-","").toLowerCase();

        // 方法 2 从输入流上传(需提前告知输入流的长度, 否则可能导致 oom)
        ObjectMetadata objectMetadata = new ObjectMetadata();
        try {
            objectMetadata.setContentLength(is.available());
            // 设置 Content type, 默认是 application/octet-stream
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, is, objectMetadata);
            cosclient.putObject(putObjectRequest);
            cosclient.shutdown();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(null != is){
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                is = null;
            }
            if(null != cosclient){
                cosclient.shutdown();
                cosclient = null;
            }

        }
        //规定好的前缀加地区名加桶名
        return SystemConst.COS_URL+key;
    }
}
