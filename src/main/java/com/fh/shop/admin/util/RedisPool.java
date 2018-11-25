package com.fh.shop.admin.util;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class RedisPool {
    private static JedisPool pool;

    private RedisPool(){};

    private static void initPool(){
        JedisPoolConfig jedis = new JedisPoolConfig();
        jedis.setMaxTotal(1000);
        jedis.setMaxIdle(100);
        jedis.setMinIdle(100);
        jedis.setTestOnBorrow(true);
        jedis.setTestOnReturn(true);
        pool = new JedisPool(jedis ,"192.168.136.129",6379);
    }
    static  {
        initPool();
    }
    public static Jedis getJedis(){
        return pool.getResource();
    }
}
