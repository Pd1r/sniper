package com.lmg.sniper.common.util;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

/**
 * 地域归属常用类
 * 
 * 
 * 
 *
 * Created by chars on 2015 下午4:29:39.
 *
 * Copyright © mizhuanglicai
 */
public class RegionalUtil {
	/**
	 * 根据手机号码获取城市
	 * 
	 * @param mobile
	 * @return 返回城市数组，数组[0]为省份，数组[1]为城市
	 */
	public static String[] getCityByMobile(String mobile) {
		// 防止数据泄露进行号码处理
		mobile = mobile.substring(0, mobile.length() - 4) + "0000";
		String[] city = {};

		int timeout = 5000;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		RequestConfig config = RequestConfig.custom().setConnectionRequestTimeout(timeout).setConnectTimeout(timeout).setSocketTimeout(timeout).build();

		HttpGet httpGet = new HttpGet("http://life.tenpay.com/cgi-bin/mobile/MobileQueryAttribution.cgi?chgmobile=" + mobile);
		httpGet.setConfig(config);
		try {
			CloseableHttpResponse response1 = httpclient.execute(httpGet);
			HttpEntity entity1 = response1.getEntity();
			if (entity1 != null) {
				String response = EntityUtils.toString(entity1, "gb2312");
				city = ArrayUtils.add(city, parseValue(response, "province"));
				city = ArrayUtils.add(city, parseValue(response, "city"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return city;
	}

	private static String parseValue(String xml, String tag) {
		try {
			int start = xml.indexOf("<" + tag + ">") + tag.length() + 2;
			int end = xml.indexOf("</" + tag + ">", start);
			return xml.substring(start, end).trim();
		} catch (Exception e) {
		}
		return null;
	}

}
