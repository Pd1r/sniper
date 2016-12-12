package com.lmg.sniper.practice.designpattern.templatemethodpattern;

/**
 * Created by Zzzz on 2016/12/12.
 * Copyright © mizlicai
 */
public class SavingAccount extends Account {
    @Override
    public void calculateInterest() {
        System.out.println("calculate interest at the rate of saving deposit...");
    }
}
