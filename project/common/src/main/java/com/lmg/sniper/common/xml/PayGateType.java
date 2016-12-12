package com.lmg.sniper.common.xml;


/**
 * 支付网关枚举类型
 *
 * @author lmg
 * @since 1.1.0
 */
public enum PayGateType implements IPayGateType {// IStrategyType
	/**
	 * 宝付支付
	 */
	BAO_FOO("BAO_FOO", "宝付支付"),
	/**
	 * 银联支付
	 */
	CHINA_PAY("ChinaPay", "银联支付"),
	/**
	 * 招行线上打款
	 */
	CMB_PAY("CMB_PAY", "招行线上"),
	/**
	 * 招行线下
	 */
	CMB_PAY_OFFLINE("CMB_PAY_OFFLINE", "招行线下"),
	/**
	 * 易联支付
	 */
	ECO_PAY("PAY_ECO", "易联支付"),
	/**
	 * 连连支付
	 */
	LL_PAY("LLPay", "连连支付"),
	/**
	 * 米庄支付
	 */
	MIZB("Mizb", "米庄支付"),
	/**
	 * 线下支付
	 */
	OFFLINE("OFFLINE", "线下支付"),
	/**
	 * 平安支付
	 */
	PING_AN("PING_AN", "平安支付"),
	/**
	 * 联动优势
	 */
	UM_PAY("UMPay", "联动优势"),
	/**
	 * 易宝支付
	 */
	YEE_PAY("YeePay", "易宝支付"),
	/**
	 * 恒丰
	 */
	HF_PAY("HF_PAY", "恒丰支付"),

	;

	/**
	 * 根据支付网关编号payGateCode得到支付网关类型
	 *
	 * @return 支付网关类型
	 */
	public static PayGateType getTypeByCode(final String payGateCode) {
		for (final PayGateType type : values()) {
			if (type.getPayGateCode().equals(payGateCode)) {
				return type;
			}
		}
		return null;
	}

	/**
	 * 根据支付网关枚举名称name得到支付网关类型
	 *
	 * @return 支付网关类型
	 * @since 1.4.2
	 */
	public static PayGateType getTypeByName(final String name) {
		for (final PayGateType type : values()) {
			if (type.name().equals(name)) {
				return type;
			}
		}
		return null;
	}

	/**
	 * 支付网关编号
	 */
	private String payGateCode;

	/**
	 * 支付网关名称
	 */
	private String payGateName;

	private PayGateType(final String payGateCode, final String payGateName) {
		this.payGateCode = payGateCode;
		this.payGateName = payGateName;
	}

	/**
	 * @return 支付网关编号
	 */
	@Override
	public String getPayGateCode() {
		return this.payGateCode;
	}

	/**
	 * @return 支付网关名称
	 */
	@Override
	public String getPayGateName() {
		return this.payGateName;
	}

}
