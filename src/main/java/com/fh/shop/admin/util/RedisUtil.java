package com.fh.shop.admin.util;

import redis.clients.jedis.Jedis;

public class RedisUtil {

    public static void set(String key,String value){
        Jedis pool = null;
        try {
            pool = RedisPool.getJedis();
            pool.set(key,value);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (pool != null){
                pool.close();
                pool = null;
            }
        }
    }


    public static String get(String key){
        String result = "";
        Jedis pool = null;
        try {
            pool = RedisPool.getJedis();
            result =  pool.get(key);
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            if (pool != null){
                pool.close();
                pool = null;
            }
        }
        System.out.println(result);
        return result;
    }

    public static void del(String key){
        Jedis pool = null;
        try {
            pool = RedisPool.getJedis();
            pool.del(key);
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            if (pool != null){
                pool.close();
                pool = null;
            }
        }
    }

    public static void setexprie(String phone,String code,int expries){
        Jedis pool = null;
        try {
            pool = RedisPool.getJedis();
            pool.set(phone,code);
            exprie(phone,expries);
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            if (pool != null){
                pool.close();
                pool = null;
            }
        }
    }

    //设置生命周期
    public static void exprie(String phone,int code){
        Jedis pool = null;
        try {
            pool = RedisPool.getJedis();
            pool.expire(phone,code);
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            if (pool != null){
                pool.close();
                pool = null;
            }
        }
    }

    //setNX  相当于判断是否存在，不存在返回1并创建  存在返回0
    public static boolean setNX(String key, String value, int expries){
        Jedis pool = null;
        try {
            pool = RedisPool.getJedis();
            Long setnx = pool.setnx(key,value);
            if(setnx ==1){
                exprie(key,expries);
                return true;
            }else {
                return false;
            }
        }
        finally {
            if (pool != null){
                pool.close();
                pool = null;
            }
        }
    }

    public static Long incr(String key, int seconds) {
        Jedis pool = null;
        Long incr = null;
        try {
            pool = RedisPool.getJedis();
            incr = pool.incr(key);
            exprie(key,seconds);
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            if (pool != null){
                pool.close();
                pool = null;
            }
        }
        return incr;
    }
}
