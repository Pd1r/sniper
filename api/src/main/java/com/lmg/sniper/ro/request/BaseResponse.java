package com.lmg.sniper.ro.request;

import com.lmg.sniper.enums.SniperCodeType;
import com.lmg.sniper.exception.SniperException;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.codehaus.jackson.annotate.JsonIgnore;

import java.io.Serializable;

/**
 * Created by lmg on 16/12/6 20:29
 * Copyright © mizlicai
 */
public class BaseResponse implements Serializable {

    private static final long serialVersionUID = 1L;

    @JsonIgnore
    private String resultCode;

    @JsonIgnore
    private String resultMsg;

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this,
                ToStringStyle.SHORT_PREFIX_STYLE);
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

    /**
     * 设置错误码和错误描述
     *
     * @param type HeraclesCodeType
     */
    public BaseResponse setResult(SniperCodeType type) {
        this.resultCode = type.getResultCode();
        this.resultMsg = type.getResultMsg();
        return this;
    }

    /**
     * 设置错误码和错误描述
     *
     * @param excption HeraclesRuntimeException
     */
    public BaseResponse setResult(SniperException excption) {
        this.resultCode = excption.getErrorCode();
        this.resultMsg = excption.getErrorMsg();
        return this;
    }

}
