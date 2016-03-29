package com.pactera.jeesite.modules.soa.entity;

/**
 * User Entity for RestService test DTO
 * @author JeffenPC
 *
 */
public class UserRsDto {
	String userId;
	String password;

	public UserRsDto() {

	}

	public String getUserVO() {
		// TODO Auto-generated method stub
		return "userId:" + this.userId + ", password:" + this.password;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
