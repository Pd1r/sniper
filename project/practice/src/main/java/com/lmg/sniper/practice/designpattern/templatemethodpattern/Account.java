package com.lmg.sniper.practice.designpattern.templatemethodpattern;

/**
 * 账户类:抽象类
 * Created by Zzzz on 2016/12/12.
 * Copyright © mizlicai
 */
public abstract class Account {

    public boolean validate(String account, String password) {
        if (account.equals("sniper") && password.equals("123456")) {
            System.out.println("access...");
            return true;
        } else {
            return false;
        }
    }

    //基本方法——抽象方法
    public abstract void calculateInterest();

    //基本方法——具体方法
    public void display() {
        System.out.println("display interest...");
    }

    //模板方法
    public void handle(String account, String password) {
        if (!validate(account, password)) {
            System.out.println("account or passowrd is error, no access...");
            return;
        }

        calculateInterest();

        display();
    }
}
