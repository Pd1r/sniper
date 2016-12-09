package com.lmg.sniper.practice.designpattern.compositepattern;

import java.util.ArrayList;

/**
 * 文件夹类：容器构件
 * Created by Zzzz on 2016/12/9.
 * Copyright © mizlicai
 */
public class Folder implements AbstractFile {

    private String name;

    //定义集合fileList，用于存储AbstractFile类型的成员
    private ArrayList<AbstractFile> fileList = new ArrayList<>();

    public Folder(String name) {
        this.name = name;
    }

    @Override
    public void add(AbstractFile file) {
        fileList.add(file);
    }

    @Override
    public void remove(AbstractFile file) {
        fileList.remove(file);
    }

    @Override
    public AbstractFile getChild(int i) {
        return fileList.get(i);
    }

    @Override
    public void killVirus() {
        //模拟杀毒
        System.out.println("kill virus for '" + name + "' folder...");

        for (Object o :
                fileList) {
            ((AbstractFile) o).killVirus();
        }
    }
}
