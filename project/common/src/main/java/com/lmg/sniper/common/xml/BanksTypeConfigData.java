package com.lmg.sniper.common.xml;

import com.miz.mekansm.common.pojo.AbstractBo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * entity demo
 * Created by Zzzz on 2016/12/12.
 * Copyright © mizlicai
 */
@XmlRootElement(name = "banks")
@XmlAccessorType(XmlAccessType.FIELD)
public class BanksTypeConfigData extends AbstractBo {
    /**
     *
     */
    private static final long serialVersionUID = 5200098455838229809L;

    @XmlElement(name = "bankBean")
    private List<BankCodeBo> bankBeans;

    public List<BankCodeBo> getBankBeans() {
        return bankBeans;
    }

    public void setBankBeans(final List<BankCodeBo> bankBeans) {
        this.bankBeans = bankBeans;
    }

}
