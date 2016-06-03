package com.pactera.jeesite.modules.soa;

import javax.ws.rs.core.MediaType;

import org.apache.cxf.jaxrs.client.WebClient;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.pactera.jeesite.modules.soa.entity.UserRsDto;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.modules.sys.entity.AuthenticationInfo;

/**
 * <b>function:</b> RESTful风格WebService client for common project
 * 
 * @author jeffen
 * @createDate 205-10-18 下午 23:26:18
 * @file RSETServiceClient.java
 * @package soa
 * @project CXFWebService
 * @blog http://
 * @email jeffencheung@gmail.com
 * @version 0.1
 */
public class RSETServiceClientCommon {

	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());

	private static WebClient client;
	private static String req;

	@Before
	public void init() {
		// 手动创建webClient对象，注意这里的地址是发布的那个/rest地址
		// String url = "http://localhost:8000/CXFWebService/rest/";
		// client = WebClient.create(url);

		// 从Spring Ioc容器中拿webClient对象
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"spring-context-cxf-client.xml");
		String webClient = "webClient_0.2";
		client = ctx.getBean(webClient, WebClient.class);
		logger.info("init()" + webClient);
	}

	@After
	public void destory() {
	}

	@Test
	public void testGet() {
		req = client.path("user/sayHello/jeffentest")
				.accept(MediaType.TEXT_PLAIN).get(String.class);
		System.out.println("testGet().response=" + req);
	}

	@Test
	public void testLoginGet() {
		req = client.path("login/doGetAuthenticationInfo/jeffen/jeffen")
				.accept(MediaType.APPLICATION_JSON).get(String.class);
		System.out.println("testLoginGet().response=" + req);
	}

	@Test
	public void testLoginRS() {
		UserRsDto user = new UserRsDto();
		user.setUserId("jeffen");
		user.setPassword("jeffen");
		req = JsonMapper.toJsonString(user);

		System.out.println("testLoginRS().response=" + 
				client.path("login/doPostAuthenticationInfoRS")
					.accept(MediaType.APPLICATION_FORM_URLENCODED)
					.post(user, AuthenticationInfo.class).getSuccess());
	}

}
