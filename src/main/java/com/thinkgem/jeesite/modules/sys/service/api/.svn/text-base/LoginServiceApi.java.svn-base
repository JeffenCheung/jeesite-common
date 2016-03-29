/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.thinkgem.jeesite.modules.sys.service.api;

import javax.jws.WebParam;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.cxf.jaxrs.model.wadl.Description;

import com.thinkgem.jeesite.modules.sys.entity.AuthenticationInfo;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 用户登录认证服务接口
 * 
 * @author Jeffen
 * @version 2015-11-02
 */
@Path(value = "/login")
public interface LoginServiceApi {
	/**
	 * GET方法验证用户名密码
	 * 
	 * @param userId
	 *            登录用户名
	 * @param password
	 *            密码明文
	 */
	@GET
	@Path("/doGetAuthenticationInfo/{userId}/{password}")
	@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
	@Description("GET方法验证用户名密码")
	public AuthenticationInfo get(@PathParam("userId") String userId,
			@PathParam("password") String password);

	/**
	 * POST方法验证用户名密码
	 * 
	 * @param user
	 *            用户对象
	 */
	@POST
	@Path("/doPostAuthenticationInfo")
	@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
	@Description("POST方法验证用户名密码")
	public AuthenticationInfo post(@WebParam(name = "User") User user);

	/**
	 * POST表单提交的方法验证用户名密码
	 * 
	 * @param userId
	 *            登录用户名
	 * @param password
	 *            密码明文
	 */
	@POST
	@Path("/doPostAuthenticationInfoRS/")
	@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
	@Description("POST表单提交的方法验证用户名密码")
	public AuthenticationInfo getByPostForm(@FormParam("userId") String userId,
			@FormParam("password") String password);
}
