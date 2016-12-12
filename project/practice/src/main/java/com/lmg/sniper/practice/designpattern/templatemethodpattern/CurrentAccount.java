package com.lmg.sniper.practice.designpattern.templatemethodpattern;

/**
 * 活期账户类:具体子类
 * Created by Zzzz on 2016/12/12.
 * Copyright © mizlicai
 */
public class CurrentAccount extends Account {

    //覆盖父类的抽象基本方法
    @Override
    public void calculateInterest() {
        System.out.println("calculate interest at the rate of current deposit...");
    }

    @Override
    public void display() {
        System.out.println("display current account's interest...");
    }
}
