/**
 *
 */
package com.lmg.sniper.common.xml;

import com.miz.mekansm.common.pojo.AbstractBo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;

/**
 * entity demo
 * Created by Zzzz on 2016/12/12.
 * Copyright © mizlicai
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class ThirdPartyCodeBo extends AbstractBo {
    @XmlAttribute(name = "channel")
    private String channel;
    @XmlAttribute(name = "code")
    private String code;

    public String getChannel() {
        return channel;
    }

    public String getCode() {
        return code;
    }

    public void setChannel(final String channel) {
        this.channel = channel;
    }

    public void setCode(final String code) {
        this.code = code;
    }

}
