/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.BITokenUtil;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 报表拦截器
 * 
 * @author ThinkGem
 * @version 2014-8-19
 */
public class BILoginInterceptor extends BaseService implements HandlerInterceptor {
	private Logger log=LoggerFactory.getLogger(BILoginInterceptor.class);
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		User currentUser = UserUtils.getUser();
		String token="";
		HttpSession session=request.getSession();
		String uRoles=currentUser.getRoleNames();
		String[] roles=uRoles.split(",");
		for (int i = 0; i < roles.length; i++) {
			if(StringUtils.isBlank(roles[i])){
				continue;
			}
			if (roles[i].contains("bi_")) {
				uRoles=roles[i];
			}
		}
		uRoles="clk";
		if (session.getAttribute("starttime")==null) {
			long startmillis=System.currentTimeMillis();
			session.setAttribute("starttime", startmillis);
		}
		long startmillis=(Long)session.getAttribute("starttime");
		long currentMillis=System.currentTimeMillis();
		long between=currentMillis-startmillis;
		if(between>3600000){
			token = BITokenUtil.getToken(uRoles);
			session.setAttribute("reportToken", token);
		}
		if (session.getAttribute("reportToken")==null||StringUtils.isBlank(session.getAttribute("reportToken").toString())) {
			token = BITokenUtil.getToken(uRoles);
			session.setAttribute("reportToken", token);
		}
		log.info("BI Token StartTime At "+(Long)session.getAttribute("starttime"));
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//System.out.println("postHandle");
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		//System.out.println("afterCompletion");
	}
}
