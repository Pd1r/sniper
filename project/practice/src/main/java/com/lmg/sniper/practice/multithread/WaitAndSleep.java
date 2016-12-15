package com.lmg.sniper.practice.multithread;

import java.util.Date;

/**
 * Created by Zzzz on 2016/12/15.
 * Copyright © mizlicai
 */
public class WaitAndSleep {
    public static void main(String[] args) {
        threadWait();
    }

    private static void threadWait() {
        Thread thread1 = new Thread(() -> {
            synchronized (WaitAndSleep.class) {
                try {
                    System.out.println(new Date() + " Thread1 is running");
                    WaitAndSleep.class.wait();
                    System.out.println(new Date() + " Thread1 ended");
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        });
        thread1.start();

        Thread thread2 = new Thread(() -> {
            synchronized (WaitAndSleep.class) {
                try {
                    System.out.println(new Date() + " Thread2 is running");
                    WaitAndSleep.class.notify();
                    // Don't use sleep method to avoid confusing
                    for (long i = 0; i < 2000; i++) {
                        for (long j = 0; j < 1000; j++) {
                        }
                    }
                    System.out.println(new Date() + " Thread2 release lock");
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

            for (long i = 0; i < 2000; i++) {
                for (long j = 0; j < 1000; j++) {
                }
            }
            System.out.println(new Date() + " Thread2 ended");
        });

        // Don't use sleep method to avoid confusing
        for (long i = 0; i < 2000; i++) {
            for (long j = 0; j < 1000; j++) {
            }
        }
        thread2.start();
    }


    private static void threadSleep() {
        Thread thread1 = new Thread(() -> {
            synchronized (WaitAndSleep.class) {
                try {
                    System.out.println(new Date() + " Thread1 is running");
                    Thread.sleep(2000);
                    System.out.println(new Date() + " Thread1 ended");
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        });
        thread1.start();

        Thread thread2 = new Thread(() -> {
            synchronized (WaitAndSleep.class) {
                try {
                    System.out.println(new Date() + " Thread2 is running");
                    Thread.sleep(2000);
                    System.out.println(new Date() + " Thread2 ended");
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

            for (long i = 0; i < 20000; i++) {
                for (long j = 0; j < 10000; j++) {
                }
            }
        });

        // Don't use sleep method to avoid confusing
        for (long i = 0; i < 20000; i++) {
            for (long j = 0; j < 10000; j++) {
            }
        }
        thread2.start();
    }
}
