package com.lmg.sniper.practice.cache;

/**
 * Created by Zzzz on 2016/12/23.
 * Copyright © mizlicai
 */
public class mutex {

    //    缓存被“击穿”问题
//
//    对于一些设置了过期时间的key，如果这些key可能会在某些时间点被超高并发地访问，是一种非常“热点”的数据。这个时候，需要考虑另外一个问题：缓存被“击穿”的问题。
//
//    概念：缓存在某个时间点过期的时候，恰好在这个时间点对这个Key有大量的并发请求过来，这些请求发现缓存过期一般都会从后端DB加载数据并回设到缓存，这个时候大并发的请求可能会瞬间把后端DB压垮。
//    如何解决：业界比较常用的做法，是使用mutex。简单地来说，就是在缓存失效的时候（判断拿出来的值为空），
//    不是立即去load db，而是先使用缓存工具的某些带成功操作返回值的操作（比如Redis的SETNX或者Memcache的ADD）去set一个mutex key，当操作返回成功时，再进行load db的操作并回设缓存；否则，就重试整个get缓存的方法。
//    public String get(String key) {
//        String value = redis.get(key);
//        if (value == null) { //代表缓存值过期
//            //设置3min的超时，防止del操作失败的时候，下次缓存过期一直不能load db
//            String key_mutex = "key_mutex";
//            Long expire_secs = 60L;
//            if (redis.setnx(key_mutex, 1, 3 * 60) == 1) {  //代表设置成功
//                value = db.get(key);
//                redis.set(key, value, expire_secs);
//                redis.del(key_mutex);
//                return value;
//            } else {  //这个时候代表同时候的其他线程已经load db并回设到缓存了，这时候重试获取缓存值即可
//                try {
//                    Thread.sleep(50);
//                } catch (InterruptedException e) {
//                    e.printStackTrace();
//                }
//                return get(key);  //重试
//            }
//        } else {
//            return value;
//        }
//    }
}
