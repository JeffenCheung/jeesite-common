package com.thinkgem.jeesite.modules.sys.service.api;

import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

public final class Client {

	public static final String URL_PRE = "http://localhost:8080/pactera-jeesite/restService/userservice/0.2/";

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			// Make an HTTP connection to the server
			URL u = new URL(URL_PRE + "login/doPostAuthenticationInfoRS");
			HttpURLConnection httpCon = (HttpURLConnection) u.openConnection();
			// Set the request method as POST
			httpCon.setRequestMethod("POST");
			httpCon.setDoOutput(true);

			OutputStream os = httpCon.getOutputStream();
			// XML encoded in UTF-8 format
			OutputStreamWriter wout = new OutputStreamWriter(os, "UTF-8");
			StringBuffer sb = new StringBuffer();
			sb.append("{'userId':'jeffen','password':'jeffen'}");
			System.out.println("request_info: data=" + sb.toString());
			wout.write(sb.toString());
			wout.flush();

			// Make implicit connection to the server
			httpCon.getContentLength();
			httpCon.disconnect();

			// response info
			int code = httpCon.getResponseCode();
			String message = httpCon.getResponseMessage();
			System.out.println("response_info: code=" + code + " message="
					+ message);

			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
