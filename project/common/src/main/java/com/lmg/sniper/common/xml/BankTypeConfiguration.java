package com.lmg.sniper.common.xml;

import org.apache.commons.lang3.StringUtils;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import java.io.InputStream;

/**
 * 银行编码转换配置
 * Created by Zzzz on 2016/12/12.
 * Copyright © mizlicai
 */
public final class BankTypeConfiguration {

    private static JAXBElement<BanksTypeConfigData> banks = null;

    static {
        try {
            final JAXBContext cxt = JAXBContext
                    .newInstance(BanksTypeConfigData.class);
            final Unmarshaller unmarshaller = cxt.createUnmarshaller();
            final XMLInputFactory xmlFactory = XMLInputFactory.newInstance();
            final InputStream is = BankTypeConfiguration.class
                    .getResourceAsStream("/config/banktype-config.xml");
            XMLStreamReader reader;
            try {
                reader = xmlFactory.createXMLStreamReader(is);
                banks = unmarshaller.unmarshal(reader,
                        BanksTypeConfigData.class);
            } catch (final XMLStreamException e) {
                e.printStackTrace();
            }

        } catch (final JAXBException e) {
            e.printStackTrace();
        }

    }

    /**
     * 根据支付渠道类型和编码得到相应银行统一标识编号
     *
     * @param channel             支付渠道
     * @param thirdPartysBankCode 支付渠道端银行编号
     * @return 银行统一标识编号
     */
    public static String fromChannel(final PayGateType channel,
                                     final String thirdPartysBankCode) {
        String commonCode = "";
        for (final BankCodeBo bankBean : banks.getValue().getBankBeans()) {
            for (final ThirdPartyCodeBo third : bankBean.getThirdPartys()) {
                if (StringUtils.equals(third.getChannel(), channel.toString())
                        && StringUtils.equals(third.getCode(),
                        thirdPartysBankCode)) {
                    commonCode = bankBean.getCode();
                    break;
                }
            }
        }
        return commonCode;
    }

    /**
     * 根据银行统一标识编号得到银行名称
     *
     * @param commonBankCode commonBankCode
     * @return String
     */
    public static String getBankNameByCommonCode(final String commonBankCode) {
        if (StringUtils.isEmpty(commonBankCode)) {
            return "";
        }

        String bankName = "";
        for (final BankCodeBo bankBean : banks.getValue().getBankBeans()) {
            if (StringUtils.equals(commonBankCode, bankBean.getCode())) {
                bankName = bankBean.getName();
                break;
            }
        }
        return bankName;
    }

    public static void main(final String[] args) {
        for (BankCodeBo bean : banks.getValue().getBankBeans()) {
            System.out.println(bean.getCode() + ":" + bean.getName());
            for (ThirdPartyCodeBo third : bean.getThirdPartys()) {
                System.out.println(third.getCode() + ":" + third.getChannel());
            }
        }
    }

    /**
     * 根据支付渠道类型和银行统一标识编号得到相应支付渠道的银行编码
     *
     * @param channel    支付渠道
     * @param commonCode 银行统一标识编号
     * @return 支付渠道端的银行编码
     */
    public static String toChannel(final PayGateType channel,
                                   final String commonCode) {
        String channelCode = "";
        BankCodeBo bank = null;
        for (final BankCodeBo bankBean : banks.getValue().getBankBeans()) {
            if (StringUtils.equals(bankBean.getCode(), commonCode)) {
                bank = bankBean;
                break;
            }
        }

        if (bank != null) {
            for (final ThirdPartyCodeBo third : bank.getThirdPartys()) {
                if (StringUtils.equals(third.getChannel(), channel.toString())) {
                    channelCode = third.getCode();
                    break;
                }
            }
        }
        return channelCode;
    }
}
