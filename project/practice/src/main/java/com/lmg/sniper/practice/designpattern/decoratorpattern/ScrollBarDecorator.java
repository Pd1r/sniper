package com.lmg.sniper.practice.designpattern.decoratorpattern;

/**
 * Created by Zzzz on 2016/12/9.
 * Copyright © mizlicai
 */
public class ScrollBarDecorator extends ComponentDecorator {

    public ScrollBarDecorator(Component component) {
        super(component);
    }

    @Override
    public void display() {
        this.setScrollBar();
        super.display();
    }

    public void setScrollBar() {
        System.out.println("set scrollBar for component...");
    }

}
