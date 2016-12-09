package com.lmg.sniper.practice.designpattern.compositepattern;

/**
 * 抽象构建类
 * <p>
 * 组合多个对象形成树形结构以表示具有“整体—部分”关系的层次结构。组合模式对单个对象（即叶子对象）和组合对象（即容器对象）的使用具有一致性，组合模式又可以称为“整体—部分”(Part-Whole)模式，它是一种对象结构型模式
 * Created by Zzzz on 2016/12/9.
 * Copyright © mizlicai
 */
public interface AbstractFile {

    void add(AbstractFile file);

    void remove(AbstractFile file);

    AbstractFile getChild(int i);

    void killVirus();
}
