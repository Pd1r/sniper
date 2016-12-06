package com.lmg.sniper.common;


import com.github.kevinsawicki.http.HttpRequest;
import org.junit.Test;

/**
 * Created by Zzzz on 2016/10/20 18:12.
 * <p>
 * Copyright © mizhuanglicai
 */
public class HttpRequestUtilTest {
    @Test
    public void testGet() {
        int response = HttpRequest.get("http://baidu.com").code();
        System.out.println(response);
    }
}
