package com.lmg.sniper.practice.pit;

import java.util.Map;

/**
 * Java通过传值进行引用传递
 * 所有的变量都是传值，包括引用。这就是说如果你有个变量，它是一个对象的引用，这个引用会被拷贝后再传参，而不是传递的对应的那个对象。
 * Created by Zzzz on 2016/12/28.
 * Copyright © mizlicai
 */
public class ReferenceTransmission {

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder("first");
        addWord(sb);
        addWord(sb);
        System.out.println(sb);
//        Map<String, String> map = new HashMap<>();
//        map.put("a","aaa");
//        map(map);
//        System.out.println(map.toString());
    }

    public static void addWord(StringBuilder sb) {
        sb.append(" word");
        sb = null;
    }

    public static void map(Map<String,String> map) {
        map.put("b","bbb");
        map = null;
    }
}

