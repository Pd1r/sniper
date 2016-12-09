package com.lmg.sniper.practice.designpattern.compositepattern;

/**
 * 文本文件类,叶子构件
 * Created by Zzzz on 2016/12/9.
 * Copyright © mizlicai
 */
public class TextFile implements AbstractFile {

    private String name;

    public TextFile(String name) {
        this.name = name;
    }

    @Override
    public void add(AbstractFile file) {
        System.out.println("sorry, does not support method...");
    }

    @Override
    public void remove(AbstractFile file) {
        System.out.println("sorry, does not support method...");
    }

    @Override
    public AbstractFile getChild(int i) {
        System.out.println("sorry, does not support method...");
        return null;
    }

    @Override
    public void killVirus() {
        //模拟杀毒
        System.out.println("kill virus for '" + name + "' text file...");
    }
}
