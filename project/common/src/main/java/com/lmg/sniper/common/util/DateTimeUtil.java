package com.lmg.sniper.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期工具类 提供日期时间辅助方法
 * <p>
 * <p>
 * <p>
 * <p>
 * Created by chars on 2015 下午4:31:29.
 * <p>
 * Copyright © mizhuanglicai
 */
public class DateTimeUtil {

    public static final String TIME_START = " 00:00:00";
    public static final String TIME_END = " 23:59:59";

    /**
     * 获取日期时间的日期
     *
     * @param date 日期,格式yyyy-MM-dd
     * @return 日期
     */
    public static Date getDateDay(String date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return dateFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取日期的最后时刻
     *
     * @param date
     * @return
     */
    public static Date getDateWithLastTime(String date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss");
        try {
            return dateFormat.parse(date + " 23:59:59");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取日期的最早时刻
     *
     * @param date
     * @return
     */
    public static Date getDateWithFirstTime(String date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss");
        try {
            return dateFormat.parse(date + " 00:00:00");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Date getDateWithLastTime(Date date) {
        return getDateWithLastTime(getDate(date));
    }

    /**
     * 获取日期时间的
     *
     * @param date 日期,格式yyyy-MM-dd HH:mm:ss
     * @return
     */
    public static Date getDateTime(String time) {
        if (time == null) {
            return null;
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss");
        try {
            return dateFormat.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取日期时间的日期
     *
     * @param date 日期时间
     * @return 日期
     */
    public static Date getDateDay(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return dateFormat.parse(dateFormat.format(date));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取日期时间的当天最大时间的日期时间
     *
     * @param date 日期时间
     * @return 当天最大时间的日期时间
     */
    public static Date getDateAndMaxTime(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss");
        Date newDate = null;
        try {
            newDate = dateTimeFormat.parse(dateFormat.format(date)
                    + " 23:59:59");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return newDate;
    }

    /**
     * 获取yyyy-MM-dd格式日期
     *
     * @param date 日期
     * @return yyyy-MM-dd格式日期
     */
    public static String getDate(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(date);
    }

    public static String getDate(Date date, String format) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        return dateFormat.format(date);
    }

    public static String getCurrentDate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(new Date());
    }

    /**
     * 返回当前日期的昨日日期
     *
     * @return 日期的String类型
     */
    public static String getLastDay() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, -1);
        Date createDate = calendar.getTime();

        return new SimpleDateFormat("yyyy-MM-dd").format(createDate);
    }

    public static String getLastDay(String day) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(getDateDay(day));
        calendar.add(Calendar.DATE, -1);
        Date createDate = calendar.getTime();
        return new SimpleDateFormat("yyyy-MM-dd").format(createDate);
    }

    public static String getNextDay(String day) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(getDateDay(day));
        calendar.add(Calendar.DATE, 1);
        Date createDate = calendar.getTime();
        return new SimpleDateFormat("yyyy-MM-dd").format(createDate);
    }

    /**
     * 获取前天日期
     *
     * @return
     */
    public static String getDayBeforeYesterday() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, -2);
        Date createDate = calendar.getTime();

        return new SimpleDateFormat("yyyy-MM-dd").format(createDate);
    }

    /**
     * 获取前后日期
     *
     * @param date
     * @param day
     * @return
     */
    public static String getDateByDay(Date date, int day) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DATE, day);
        Date createDate = calendar.getTime();
        return new SimpleDateFormat("yyyy-MM-dd").format(createDate);
    }

    /**
     * 获取相差天数
     *
     * @param date1
     * @param date2
     * @return
     */
    public static int getBetweenDay(Date date1, Date date2) {

        Calendar cal = Calendar.getInstance();
        cal.setTime(date1);
        long time1 = cal.getTimeInMillis();

        cal.setTime(date2);
        long time2 = cal.getTimeInMillis();
        long between_days = (time1 - time2) / (1000 * 3600 * 24);

        return Integer.parseInt(String.valueOf(between_days));
    }

    /**
     * 获取相差秒 date1>date2
     *
     * @param date1
     * @param date2
     * @return
     */
    public static int getBetweenSeconds(Date date1, Date date2) {

        Calendar cal = Calendar.getInstance();
        cal.setTime(date1);
        long time1 = cal.getTimeInMillis();

        cal.setTime(date2);
        long time2 = cal.getTimeInMillis();
        long between_days = (time1 - time2) / 1000;

        return Integer.parseInt(String.valueOf(between_days));
    }

    /**
     * 获取上一天的月份
     *
     * @return
     */
    public static String getLastMonth() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, -1);
        Date createDate = calendar.getTime();
        return new SimpleDateFormat("yyyy-MM").format(createDate);
    }

    public static void main(String[] args) {
        System.out.println(new Date().after(DateTimeUtil
                .getDateTime(DateTimeUtil.getCurrentDate() + " 15:00:00")));
    }

}
