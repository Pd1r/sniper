package com.lmg.sniper.practice.multithread;

import java.util.concurrent.Phaser;

/**
 * Created by Zzzz on 2016/12/15.
 * Copyright © mizlicai
 */
public class PhaserDemo {
    public static void main(String[] args) {
        Phaser phaser = new Phaser(3) {// 共有3个工作线程，因此在构造函数中赋值为3
            @Override
            protected boolean onAdvance(int phase, int registeredParties) {
                System.out.println("\n==============================");
                //本例中，当只剩一个线程时，这个线程必定是主线程，返回true表示终结
                return registeredParties == 0;
            }
        };
        System.out.println("start...");
        char a = 'a';
        for (int i = 0; i < 3; i++) { // 创建并启动3个线程
            new MyThread((char) (a + i), phaser).start();
        }

        while (!phaser.isTerminated()) {// 只要phaser不终结，主线程就循环等待
            Thread.yield();
        }
        System.out.println("end...");
    }
}

class MyThread extends Thread {
    private char c;
    private Phaser phaser;

    MyThread(char c, Phaser phaser) {
        this.c = c;
        this.phaser = phaser;
    }

    @Override
    public void run() {
        while (!phaser.isTerminated()) {
            for (int i = 0; i < 5; i++) { // 将当前字母打印10次
                System.out.print(c + " ");
            }
            // 打印完当前字母后，将其更新为其后第三个字母，例如b更新为e，用于下一阶段打印
            c = (char) (c + 3);
            if (c > 'z') {
                // 如果超出了字母z，则在phaser中动态减少一个线程，并退出循环结束本线程
                phaser.arriveAndDeregister();
                break;
            } else {
                // 反之，等待其他线程到达阶段终点，再一起进入下一个阶段
                phaser.arriveAndAwaitAdvance();
            }
        }
    }
}
