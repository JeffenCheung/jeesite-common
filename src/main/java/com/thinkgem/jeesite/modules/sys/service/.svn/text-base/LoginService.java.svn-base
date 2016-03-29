/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.modules.sys.entity.AuthenticationInfo;
import com.thinkgem.jeesite.modules.sys.entity.Menu;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.jeesite.modules.sys.security.UsernamePasswordToken;
import com.thinkgem.jeesite.modules.sys.service.api.LoginServiceApi;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 用户登录认证服务实现
 * <p>
 * via. http://shiro.apache.org/java-authentication-guide.html
 * 
 * @author Jeffen
 * @version 2015-11-02
 */
@Service
@Transactional(readOnly = true)
@Component("loginApplication")
public class LoginService implements LoginServiceApi {

	@Autowired
	private SystemAuthorizingRealm systemRealm;

	@Override
	public AuthenticationInfo get(String userId, String password) {
		// init Authority
		AuthenticationInfo ai = new AuthenticationInfo();

		// Example using most common scenario:
		// String username and password. Acquire in
		// system-specific manner (HTTP request, GUI, etc)
		UsernamePasswordToken token = new UsernamePasswordToken(userId,
				password);

		// ”Remember Me” built-in, just do this:
		token.setRememberMe(true);

		// With most of Shiro, you'll always want to make sure you're working
		// with the currently executing user, referred to as the subject
		Subject currentUser = UserUtils.getSubject();

		// Authenticate the subject by passing
		// the user name and password token
		// into the login method
		try {
			// 登录验证
			currentUser.login(token);
			
			// 取得登录后的用户
			User u = UserUtils.getUser();
			
			// 清理登录用户的缓存
			UserUtils.clearCache();
			
			// 获取用户授权角色ID
			String rs = UserUtils.getRoleStr();
			ai.setUserRoles(rs);

			// 获取用户授权ID
			String ms = UserUtils.getMenuStr();
			ai.setUserPermissions(ms);

			// 获取用户角色和授权ID
			String ps = rs + "," + ms;
			ai.setUserAuthority(",".equals(ps)?"":ps);

			// 验证通过
			ai.setId(userId);
			ai.setSessionId(currentUser.getSession().getId().toString());
			ai.setUserName(u.getName());
			ai.setUserProfile(u);

			ai.setSuccess("true");

		} catch (UnknownAccountException uae) {
			uae.printStackTrace();
			ai.setErroMsg("账户不存在。");
			ai.setErrorStack(uae.toString());
		} catch (IncorrectCredentialsException ice) {
			ai.setErroMsg("密码错误。");
			ai.setErrorStack(ice.toString());
		} catch (LockedAccountException lae) {
			ai.setErroMsg("用户锁定。");
			ai.setErrorStack(lae.toString());
		} catch (ExcessiveAttemptsException eae) {
			ai.setErroMsg(eae.toString());
		} catch (AuthenticationException ae) {
			ai.setErroMsg("认证异常。");
			ai.setErrorStack(ae.toString());
		} catch (Exception e) {
			ai.setErroMsg("系统错误。");
			ai.setErrorStack(e.toString());
		}
		// No problems, show authenticated view…
		return ai;
	}

	@Override
	public AuthenticationInfo post(User user) {
		return get(user.getLoginName(), user.getPassword());
	}

	@Override
	public AuthenticationInfo getByPostForm(String userId, String password) {
		return get(userId, password);
	}
}
