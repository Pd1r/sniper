package com.lmg.sniper.enums;


/**
 * 返回编码和信息
 * Created by lmg on 16/12/6 20:29
 * Copyright © mizlicai
 */
public enum SniperCodeType {

    SUCCESS("00000000", "成功"),
    /**
     * 正在处理中
     */
    HANDLING("00000001", "正在处理中"),

    /**
     * 系统忙，请稍后再提交
     */
    SYSTEM_BUSY("00000002", "系统忙,请稍后再提交");

    /**
     * 错误码
     */
    private String resultCode;

    /**
     * 错误描述
     */
    private String resultMsg;

    SniperCodeType(String resultCode, String resultMsg) {
        this.resultCode = resultCode;
        this.resultMsg = resultMsg;
    }


    public static SniperCodeType getType(final String resultCode) {
        for (final SniperCodeType type : values()) {
            if (type.resultCode.equals(resultCode)) {
                return type;
            }
        }
        return null;
    }

    /**
     * 是否为错误的请求
     *
     * @param resultCode 待判断的错误码
     * @return 是否为错误的请求
     */
    public static boolean isError(final String resultCode) {
        return !isHandling(resultCode) && !isSuccess(resultCode);
    }

    /**
     * 是否为处理中
     *
     * @param resultCode 待判断的错误码
     * @return 是否为处理中
     */
    public static boolean isHandling(final String resultCode) {
        return HANDLING.resultCode.equals(resultCode);
    }

    /**
     * 是否为成功
     *
     * @param resultCode 待判断的错误码
     * @return 是否为成功
     */
    public static boolean isSuccess(final String resultCode) {
        return SUCCESS.resultCode.equals(resultCode);
    }


    public String getResultCode() {
        return resultCode;
    }

    public void setResultCode(String resultCode) {
        this.resultCode = resultCode;
    }

    public String getResultMsg() {
        return resultMsg;
    }

    public void setResultMsg(String resultMsg) {
        this.resultMsg = resultMsg;
    }
}
