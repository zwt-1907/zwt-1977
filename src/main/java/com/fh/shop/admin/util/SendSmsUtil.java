package com.fh.shop.admin.util;

import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class SendSmsUtil {
    public static String smsUtil(String url, Map<String,String> params,Map<String,String> header){
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        HttpPost httpPost = new HttpPost(url);

        List<NameValuePair> pairs =null;
        if (params != null && params.size() > 0){
            Iterator<Map.Entry<String, String>> iterator = params.entrySet().iterator();
             pairs = new ArrayList();
            while (iterator.hasNext()){
                Map.Entry<String, String> next = iterator.next();
                String key = next.getKey();
                String value = next.getValue();
                pairs.add(new BasicNameValuePair(key,value));
            }
        }
        if (header != null && header.size() > 0){
            Iterator<Map.Entry<String, String>> iterator = header.entrySet().iterator();
            while(iterator.hasNext()){
                Map.Entry<String, String> next = iterator.next();
                String key = next.getKey();
                String value = next.getValue();
                httpPost.setHeader(key,value);
            }
        }
        CloseableHttpResponse response =null;
        String toString = null;
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(pairs));
            response = httpClient.execute(httpPost);
            toString = EntityUtils.toString(response.getEntity(),"utf-8");

        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                    if (response != null){
                        response.close();
                        response = null;
                    }
                    if (null != httpPost){
                        httpPost.releaseConnection();
                    }
                    if (null  != httpClient){
                        httpClient.close();
                        httpClient = null;
                    }
            } catch (IOException e) {
                    e.printStackTrace();
                }
        }
        return toString;
    }
}
