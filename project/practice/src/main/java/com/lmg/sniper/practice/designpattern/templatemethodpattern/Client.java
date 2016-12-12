package com.lmg.sniper.practice.designpattern.templatemethodpattern;

import com.lmg.sniper.practice.designpattern.XMLUtil;
import com.lmg.sniper.practice.designpattern.strategypattern.Discount;
import com.lmg.sniper.practice.designpattern.strategypattern.MovieTicket;

/**
 * 客户端类
 * Created by Zzzz on 2016/12/12.
 * Copyright © mizlicai
 */
public class Client {

    public static void main(String args[]) {
        Account account = (Account) XMLUtil.getBean(1, "templatemethodpattern");
        account.handle("sniper", "123456");
    }
}
