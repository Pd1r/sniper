package com.lmg.sniper.common.lock;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 基于redis分布式锁
 *
 * @author Frank
 */
@Component("redisLock")
public class DistributedRedisLock implements DistributedLock {
    private static Logger log = LoggerFactory.getLogger(DistributedRedisLock.class);

    // 将分布式锁与线程绑定，实现重入锁
    private static ThreadLocal<Map<String, Boolean>> threadlock = new ThreadLocal<>();

    /**
     * 重入锁引用计数
     */
    private static ThreadLocal<Map<String, Integer>> threadRefCount = new ThreadLocal<>();

    private final String LockSetKey = "mp_lockSet";

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    /**
     * 增加锁引用计数
     *
     * @param key key
     * @return int
     */
    private int addRefCount(final String key) {
        if (threadRefCount.get() == null) {
            threadRefCount.set(new HashMap<>());
        }
        Integer count = threadRefCount.get().get(key);
        count = count == null ? 1 : count + 1;
        threadRefCount.get().put(key, count);
        return count;
    }

	/*
     * public void lockInterruptibly() throws InterruptedException { throw new
	 * InterruptedException("不支持"); }
	 */

    @Override
    public boolean isLock(String key) {
        if (key == null) {
            return false;
        }
        key = lockKey(key);
        try {
            final String value = stringRedisTemplate.opsForValue().get(key);
            return value != null;
        } catch (final Exception e) {
            log.error(e.toString(), e);
            return false;
        }
    }

    /**
     * 以阻塞的方式获取锁，
     *
     * @param key key
     */
    @Override
    public void lock(final String key) {
        while (true) {
            if (tryLock(key)) {
                return;
            } else {
                try {
                    Thread.sleep(1000);
                } catch (final InterruptedException e) {
                    throw new RuntimeException("获取锁失败", e);
                }
            }
        }
    }

    private String lockKey(final String key) {
        if (key.endsWith("_lock")) {
            return key;
        } else {
            return key + "_lock";
        }
    }

    /**
     * 减少锁引用计数
     *
     * @param key key
     * @return int
     */
    private int subRefCount(final String key) {
        if (threadRefCount.get() == null) {
            return 0;
        }
        Integer count = threadRefCount.get().get(key);
        if (count == null || count == 0) {
            return 0;
        }
        count--;
        threadRefCount.get().put(key, count);
        return count;
    }

    /**
     * 获取线程上下文锁标识
     *
     * @param key 锁
     * @return boolean
     */
    private Boolean threadlockGet(final String key) {
        return threadlock.get() != null && threadlock.get().get(key) != null && threadlock.get().get(key);
    }

    /**
     * 清除线程上下文锁标识
     *
     * @param key key
     */
    private void threadlockRemove(final String key) {
        if (threadlock.get() == null) {
            return;
        }
        threadlock.get().remove(key);
    }

    /**
     * 线程上下文锁标识
     *
     * @param key 锁
     */
    private void threadlockSet(final String key) {
        if (threadlock.get() == null) {
            threadlock.set(new HashMap<>());
        }
        threadlock.get().put(key, true);
    }

    /**
     * 一次性获取锁,默认只锁三分钟
     *
     * @param key key
     * @return true 成功，false 失败
     */
    @Override
    public boolean tryLock(final String key) {
        return tryLock(key, 3L);
    }

    /*
     * (non-Javadoc)
     *
     * @see
     * com.miz.alchemist.common.lock.DistributedLock#tryLock(java.lang.String,
     * java.lang.Long)
     */
    @Override
    public boolean tryLock(final String key, final Long expireMinutes) {
        if (key == null || key.equals("")) {
            throw new RuntimeException("key 不能为空");
        }
        final String keylock = lockKey(key);

        // 检查线程上下文，是否已获得锁
        if (threadlockGet(keylock)) {
            // 检查分布式锁是否真存在
            final boolean isexsit = stringRedisTemplate
                    .execute((RedisCallback<Boolean>) connection -> connection.get(keylock.getBytes()) != null);
            if (isexsit) {
                addRefCount(keylock);
                return true;
            } else {
                subRefCount(keylock);
                // 如果分布式锁不存在，则清除标识
                threadlockRemove(keylock);
            }
        }
        // redisTemplate.setEnableTransactionSupport(false);
        final Boolean result = stringRedisTemplate
                .execute((RedisCallback<Boolean>) connection -> {
                    final Boolean result1 = connection.setNX(keylock
                                    .getBytes(),
                            String.valueOf(System.currentTimeMillis())
                                    .getBytes());
                    if (result1) {
                        connection.expire(keylock.getBytes(),
                                60 * expireMinutes); // 默认只锁三分钟
                        connection.sAdd(LockSetKey.getBytes(),
                                keylock.getBytes());
                        threadlockSet(keylock); // 在线程上下文中标识
                        addRefCount(keylock);
                    }
                    return result1;
                });
        if (result == null) {
            log.error("调用redis 发现Null, 可能无法连接redis.");
            return false;
        }
        return result;
    }

    @Override
    public void unlock(final String key) {
        if (key == null || key.equals("")) {
            throw new RuntimeException("key 不能为空");
        }
        final String keylocal = lockKey(key);
        if (subRefCount(keylocal) > 0) {
            // 如果引用计数>0 ,则减完直接返回
            return;
        }
        stringRedisTemplate.execute((RedisCallback<Long>) connection -> {
            connection.multi();
            connection.del(keylocal.getBytes());
            connection.sRem(LockSetKey.getBytes(), keylocal.getBytes());
            final List<Object> list = connection.exec();
            threadlockRemove(keylocal);
            return (Long) list.get(0);
        });
    }

}
