package com.lmg.sniper.exception;


import com.lmg.sniper.enums.SniperCodeType;

/**
 * 异常类
 * Created by lmg on 16/12/6 20:29
 * Copyright © mizlicai
 */
public class SniperException extends RuntimeException {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * 错误码
     */
    private String errorCode;
    /**
     * 错误描述
     */
    private String errorMsg;

    public SniperException(final SniperCodeType heraclesCodeType, Object... args) {
        super(heraclesCodeType.getResultMsg());
        this.errorCode = heraclesCodeType.getResultCode();
        this.errorMsg = String.format(heraclesCodeType.getResultMsg(), args);
    }

    public String getErrorCode() {
        return errorCode;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorCode(final String errorCode) {
        this.errorCode = errorCode;
    }

    public void setErrorMsg(final String errorMsg) {
        this.errorMsg = errorMsg;
    }


}
