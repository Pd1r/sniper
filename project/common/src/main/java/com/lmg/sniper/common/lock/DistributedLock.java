package com.lmg.sniper.common.lock;

/**
 * 分布式锁
 *
 * @author Frank
 */
public interface DistributedLock {

    /**
     * 是否已经锁定
     *
     * @param key
     * @return
     */
    boolean isLock(String key);

    /**
     * 以阻塞方式获取锁
     *
     * @param key
     */
    void lock(String key);

    /**
     * 一次性获取锁,默认只锁三分钟
     *
     * @param key
     * @return
     */
    boolean tryLock(String key);

    /**
     * 一次性获取锁 锁expireMinutes分钟
     *
     * @param key
     * @return
     */
    boolean tryLock(String key, Long expireMinutes);

    /**
     * 释放锁
     *
     * @param key
     */
    void unlock(String key);
}
