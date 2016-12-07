package com.lmg.sniper.common.util;

/**
 * 按字节截取字符串
 * GBK：汉字占两个字节；UTF-8：占3个字节
 * SubStringByByte.java
 *
 * @author lmg
 * @since 2016年1月7日
 * Copyright © mizhuanglicai
 */
public class SubStringByByte {
    public static String getSubString(String targetString, int byteIndex)
            throws Exception {

        if (targetString.getBytes("GBK").length < byteIndex) {
            return targetString;
        }
        String temp = targetString;
        for (int i = 0; i < targetString.length(); i++) {
            if (temp.getBytes("GBK").length <= byteIndex) {
                break;
            }
            temp = temp.substring(0, temp.length() - 1);
        }
        return temp + "...";
    }

    public static void main(String[] args) {
        String str1 = "11月11日13:40:00 单日交易额破 1亿！对于这历史性的一刻，整个米庄团队沸腾了，完成1个亿的目标仅仅用了13个小时40分钟！对于一个创立时间仅6个月的新兴平台来说，这是充满荣耀的时刻，我们靠自己的努力和拼搏，走到了这一步";
        //String str = "起息时间：米庄宝每人限购20万，当日购买当日起息；提现规则：1-2个工作日到账，提现金额当日不计收益；起息时间：米庄宝每人限购20万，当日购买当日起息；提现规则：1-2个工作日到账，提现金额当日不计收益；起息时间：米庄宝每人限购20万，当日购买当日起息；提现规则：1-2个工作日到账，提现金额当日不计收益；起息时间：米庄宝每人限购20万，当日购买当日起息；提现规则：1-2个工作日到账，提现金额当日不计收益；起息时间：米庄宝每人限购20万，当日购买当日起息；提现规则：1-2个工作日到账，提现金额当日不计收益";
        try {
            String result = getSubString(str1, 138) + "...";
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
