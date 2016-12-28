package com.lmg.sniper.practice.pit;

/**
 * 当一个线程在执行 try 语句块或者 catch 语句块时被打断（interrupted）或者被终止（killed），与其相对应的 finally 语句块可能不会执行。
 * 还有更极端的情况，就是在线程运行 try 语句块或者 catch 语句块时，突然死机或者断电，finally 语句块肯定不会执行了
 * <p>
 * ref:http://www.ibm.com/developerworks/cn/java/j-lo-finally
 * Created by Zzzz on 2016/12/15.
 * Copyright © mizlicai
 */
public class FinallyTest {

    public static void main(String[] args) {
        System.out.println("return value of test(): " + test4());
    }

    private static int test1() {
        int i = 1;
        try {
            System.out.println("try block");
            System.exit(0);
            return i;
        } finally {
            System.out.println("finally block");
        }
    }

    public static int test2() {
        try {
            System.out.println("try block");
            return 1;
        } finally {
            System.out.println("finally block");
        }
    }

    public static int test3() {
        int i = 1;
        try {
            System.out.println("try block");
            i = i / 0;
            return i;
        } catch (Exception e) {
            System.out.println("exception block");
            return 2;
        } finally {
            System.out.println("finally block");
        }
    }

    public static int test4() {
        try {
            return 0;
        } finally {
            return 1;
        }
    }

    public static int test5() {
        int i = 1;
        try {
            return i;
        } finally {
            i++;
        }
    }

    public static int test6() {
        int i = 1;
        try {
            i = 4;
        } finally {
            i++;
            return i;
        }
    }

    public static int test7() {
        int i = 1;
        try {
            i = 4;
        } finally {
            i++;
        }
        return i;
    }

    public static String test8() {
        try {
            System.out.println("try block");
            return test8_1();
        } finally {
            System.out.println("finally block");
        }
    }

    private static String test8_1() {
        System.out.println("return statement");
        return "after return";
    }
}
