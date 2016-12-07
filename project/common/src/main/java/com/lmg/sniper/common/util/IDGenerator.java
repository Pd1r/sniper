package com.lmg.sniper.common.util;

import java.util.Date;
import java.util.UUID;

public class IDGenerator {
	public static String getUUID() {
		String uuid = UUID.randomUUID().toString();
		return uuid.substring(0, 8) + uuid.substring(9, 13)
				+ uuid.substring(14, 18) + uuid.substring(19, 23)
				+ uuid.substring(24);
	}

	public static String getOrderID() {
		String id = DateTimeUtil.getDate(new Date(), "yyMMdd");
		String code = String.format("%010d", Math.abs(getUUID().hashCode()));
		return id + code;
	}
}
