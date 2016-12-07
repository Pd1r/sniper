package com.lmg.sniper.common.util;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.ui.Model;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * Created by Zzzz on 2016/12/07 15:09.
 * <p>
 * Copyright © mizlicai
 */
public class TokenHelper {

    private static final Logger LOGGER = LoggerFactory.getLogger(TokenHelper.class);

    /**
     * 保存token值的默认命名空间
     */
    public static final String TOKEN_NAMESPACE = "miz.tokens";

    /**
     * 持有token名称的字段名
     */
    public static final String TOKEN_NAME_FIELD = "token";

    /**
     * token存活时间
     * 单位秒
     */
    public static final long CYCLE = 60 * 30;

    /**
     * 使用随机字串作为token名字保存token
     */
    public static String createToken(Model model, RedisTemplate<String, String> redisTemplate) {
        String tokenName = generateUUID();
        return createToken(model, tokenName, redisTemplate);
    }

    /**
     * 使用给定的字串作为token名字保存token
     */
    private static String createToken(Model model, String tokenName, RedisTemplate<String, String> redisTemplate) {
        String token = generateUUID();
        return createCacheToken(model, tokenName, token, redisTemplate);
    }

    /**
     * 保存一个给定名字和值的token
     */
    private static String createCacheToken(Model model, String tokenName, String token, RedisTemplate<String, String> redisTemplate) {
        String tokenKey = createTokenName(tokenName);

        redisTemplate.opsForList().leftPush(tokenKey, token);
        redisTemplate.expire(tokenKey, CYCLE, TimeUnit.SECONDS);
        String resultToken = tokenName + token;//token 规则定义
        if (model != null) {
            model.addAttribute(TOKEN_NAME_FIELD, resultToken);
        }
        LOGGER.info("tokenName:{} tokenKey:{} token:{} resultToken:{}", tokenName, tokenKey, token, resultToken);
        return resultToken;
    }


    public static String generateUUID() {

        return UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
    }

    /**
     * 构建一个基于token名字的带有命名空间为前缀的token名字
     */
    private static String createTokenName(String tokenName) {
        return TOKEN_NAMESPACE + "." + tokenName;
    }


    public static boolean validToken(String tokenRule, RedisTemplate<String, String> redisTemplate) {

        try {
            String tokenName = tokenRule.substring(0, 32);
            String token = tokenRule.substring(32);
            String tokenCacheName = TokenHelper.createTokenName(tokenName);
            String cacheToken = redisTemplate.opsForList().leftPop(tokenCacheName);
            if (token.equals(cacheToken)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
