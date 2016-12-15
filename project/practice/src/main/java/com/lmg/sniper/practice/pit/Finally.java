package com.lmg.sniper.practice.pit;

/**
 * 当一个线程在执行 try 语句块或者 catch 语句块时被打断（interrupted）或者被终止（killed），与其相对应的 finally 语句块可能不会执行。
 * 还有更极端的情况，就是在线程运行 try 语句块或者 catch 语句块时，突然死机或者断电，finally 语句块肯定不会执行了
 * <p>
 * ref:http://www.ibm.com/developerworks/cn/java/j-lo-finally
 * Created by Zzzz on 2016/12/15.
 * Copyright © mizlicai
 */
public class Finally {

    public static void main(String[] args) {
        System.out.println("return value of test(): " + test());
    }

    private static int test() {
        int i = 1;

//        if (i == 1) {
//            return 0;
//        }
        System.out.println("the previous statement of try block");
        i = i / 0;

        try {
            System.out.println("try block");
            return i;
        } finally {
            System.out.println("finally block");
        }
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

    /**
     * try catch finally 执行顺序测试
     * finally 语句块在 try 语句块中的 return 语句之前执行
     *
     * @return int
     */
    public static int test2() {
        try {
            System.out.println("try block");

            return 1;
        } finally {
            System.out.println("finally block");
        }
    }

    /**
     * finally 语句块应该是在控制转移语句之前执行，控制转移语句除了 return 外，还有 break 和 continue。
     * 另外，throw 语句也属于控制转移语句。虽然 return、throw、break 和 continue 都是控制转移语句，但是它们之间是有区别的。
     * 其中 return 和 throw 把程序控制权转交给它们的调用者（invoker），而 break 和 continue 的控制权是在当前方法内转移。
     *
     * @return int
     */
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

    /**
     * 实际上，Java 虚拟机会把 finally 语句块作为 subroutine. 直接插入到 try 语句块或者 catch 语句块的控制转移语句之前。
     * 但是，还有另外一个不可忽视的因素，那就是在执行 subroutine（也就是 finally 语句块）之前，try 或者 catch 语句块会保留其返回值到本地变量表（Local Variable Table）中。
     * 待 subroutine 执行完毕之后，再恢复保留的返回值到操作数栈中，然后通过 return 或者 throw 语句将其返回给该方法的调用者（invoker）。
     * 请注意，前文中我们曾经提到过 return、throw 和 break、continue 的区别，对于这条规则（保留返回值），只适用于 return 和 throw 语句，不适用于 break 和 continue 语句，因为它们根本就没有返回值。
     *
     * @return int
     */
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
