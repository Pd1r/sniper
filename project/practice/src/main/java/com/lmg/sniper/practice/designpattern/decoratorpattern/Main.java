package com.lmg.sniper.practice.designpattern.decoratorpattern;

/**
 * Created by Zzzz on 2016/12/9.
 * Copyright © mizlicai
 */
public class Main {

    public static void main(String args[]) {
        Component component, component1;
        component = new Window();
        component1 = new ScrollBarDecorator(component);
        component1.display();
    }

//    public static void main(String args[]) {
//        Component component, componentSB, componentBB; //全部使用抽象构件定义
//        component = new Window();
//        componentSB = new ScrollBarDecorator(component);
//        componentBB = new BlackBorderDecorator(componentSB); //将装饰了一次之后的对象继续注入到另一个装饰类中，进行第二次装饰
//        componentBB.display();
//    }
}
