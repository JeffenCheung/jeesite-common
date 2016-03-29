package com.thinkgem.jeesite.modules.sys.utils;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;

public class BITokenUtil {
	@SuppressWarnings("deprecation")
	public static String getToken(String userRole) throws Exception {
		String token = "";
		URL tokenUrl = new URL(Global.getReportLoginPath());
		HttpURLConnection tokenConn = (HttpURLConnection) tokenUrl
				.openConnection();
		tokenConn.setRequestMethod("GET");
		tokenConn.setRequestProperty("Accept", "application/xml");
		tokenConn.setRequestProperty("X-SAP-TRUSTED-USER", userRole);
		if (tokenConn.getResponseCode() != 200) {
			throw new Exception("网络连接失败！状态码：" + tokenConn.getResponseCode());
		}
		token = tokenConn.getHeaderField("X-SAP-LogonToken");
		if (!StringUtils.isBlank(token)) {
			token = token.substring(1, token.length() - 1);
		}
		tokenConn.disconnect();
		return URLEncoder.encode(token);
	}
}
