package com.lmg.sniper.practice.designpattern.strategypattern;

/**
 * 学生票折扣类：具体策略类
 * Created by Zzzz on 2016/12/12.
 * Copyright © mizlicai
 */
public class StudentDiscount implements Discount {
    @Override
    public double calculate(double price) {
        System.out.println("student ticket...");
        return price * 0.8;
    }
}
