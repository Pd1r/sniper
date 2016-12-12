package com.lmg.sniper.practice.designpattern.strategypattern;

/**
 * 策略模式环境类
 * Created by Zzzz on 2016/12/12.
 * Copyright © mizlicai
 */
public class MovieTicket {

    private double price;

    private Discount discount;

    public void setPrice(double price) {
        this.price = price;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public double getPrice() {
        //调用折扣类的折扣价计算方法
        return discount.calculate(this.price);
    }
}
