package com.lmg.sniper.practice.designpattern.decoratorpattern;

/**
 * Created by Zzzz on 2016/12/9.
 * Copyright © mizlicai
 */
public class BlackBorderDecorator extends ComponentDecorator {

    public BlackBorderDecorator(Component component) {
        super(component);
    }

    @Override
    public void display() {
        this.setBlackBorder();
        super.display();
    }

    public void setBlackBorder() {
        System.out.println("set blackBorder for component...");
    }
}
