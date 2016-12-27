package com.lmg.sniper.practice.pit;

import java.util.Random;

/**
 * Created by Zzzz on 2016/12/27.
 * Copyright © mizlicai
 */
public class RandomTest {

    public static void main(String[] args) {
        System.out.println(randomString(-229985452) + " " + randomString(-147909649));
        System.out.println(randBetweenMinAndMax(5, 6));
    }

    public static String randomString(int i) {
        Random ran = new Random(i);
        StringBuilder sb = new StringBuilder();
        while (true) {
            int k = ran.nextInt(27);
            if (k == 0)
                break;
            sb.append((char) ('`' + k));
        }
        return sb.toString();
    }

    public static int randBetweenMinAndMax(int min, int max) {
        Random random = new Random();
        return random.nextInt((max - min) + 1) + min;
    }

}
