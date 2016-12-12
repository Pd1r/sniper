package com.lmg.sniper.common.xml;

import com.miz.mekansm.common.pojo.AbstractBo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import java.util.List;

/**
 * entity demo
 * Created by Zzzz on 2016/12/12.
 * Copyright © mizlicai
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class BankCodeBo extends AbstractBo {

    @XmlElement(name = "code")
    private String code;
    @XmlElement(name = "name")
    private String name;
    @XmlElementWrapper(name = "thirdPartys")
    @XmlElement(name = "third")
    private List<ThirdPartyCodeBo> thirdPartys;

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public List<ThirdPartyCodeBo> getThirdPartys() {
        return thirdPartys;
    }

    public void setCode(final String code) {
        this.code = code;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public void setThirdPartys(final List<ThirdPartyCodeBo> thirdPartys) {
        this.thirdPartys = thirdPartys;
    }

}
