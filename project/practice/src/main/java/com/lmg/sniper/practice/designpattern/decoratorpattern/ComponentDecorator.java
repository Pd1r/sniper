package com.lmg.sniper.practice.designpattern.decoratorpattern;

/**
 * Created by Zzzz on 2016/12/9.
 * Copyright © mizlicai
 */
public abstract class ComponentDecorator implements Component {

    private Component component;

    public ComponentDecorator(Component component) {
        this.component = component;
    }

    public void display() {
        component.display();
    }
}
