package com.lmg.sniper.practice.designpattern.strategypattern;

/**
 * 儿童票折扣类：具体策略类
 * Created by Zzzz on 2016/12/12.
 * Copyright © mizlicai
 */
public class ChildDiscount implements Discount {
    @Override
    public double calculate(double price) {
        System.out.println("child ticket...");
        return price - 10;
    }
}
