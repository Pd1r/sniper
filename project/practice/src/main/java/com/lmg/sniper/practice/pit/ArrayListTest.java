package com.lmg.sniper.practice.pit;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Zzzz on 2016/12/28.
 * Copyright © mizlicai
 */
public class ArrayListTest {
    public static void main(String[] args) {
        asList();
//        remove();
    }

    public static void asList() {
        List<String> list = Arrays.asList("a", "b", "c");
        System.out.println(list.toString());
        list.add("d");
        System.out.println(list.toString());

//        ArrayList<String> arrayList = new ArrayList<>(list);
//        arrayList.add("e");
//        System.out.println(arrayList.toString());
    }

    public static void remove() {
        ArrayList<String> list = new ArrayList<>(Arrays.asList("a", "b", "c", "d"));
        for (int i = 0; i < list.size(); i++) {
            list.remove(i);
        }
        System.out.println(list);

//        ArrayList<String> list = new ArrayList<>(Arrays.asList("a", "b", "c", "d"));
//        for(String s:list){
//            if(s.equals("a")){
//                list.remove(s);
//            }
//        }
//        System.out.println(list);
    }

    public static void removeOfRight() {
        ArrayList<String> list = new ArrayList<>(Arrays.asList("a", "b", "c", "d"));
        Iterator<String> iter = list.iterator();
        while (iter.hasNext()) {
            String s = iter.next();
            if (s.equals("a")) {
                iter.remove();
            }
        }
    }







































//    迭代器（Iterator）是工作在一个独立的线程中，并且拥有一个 mutex 锁。
//    迭代器被创建之后会建立一个指向原来对象的单链索引表，当原来的对象数量发生变化时，
//    这个索引表的内容不会同步改变，所以当索引指针往后移动的时候就找不到要迭代的对象，
//    所以按照 fail-fast 原则 迭代器会马上抛出java.util.ConcurrentModificationException 异常。
}
