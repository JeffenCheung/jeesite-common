/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.orangesignal.csv.annotation.*;

/**
 * 职位表Entity
 * @author 刘燎坡
 * @version 2015-11-09
 */
@CsvEntity(header = true)
public class Post extends DataEntity<Post> {
	
	private static final long serialVersionUID = 1L;
	private String orgId;		// 组织结构编码
	private String postName;		// 职位名称
	private String postDes;		// 职位描述
	private Integer postLevel;		// 职位等级（1~9，数字越高代表等级越高）
	
	public Post() {
		super();
	}

	public Post(String id){
		super(id);
	}

	@Length(min=1, max=64, message="组织结构编码长度必须介于 1 和 64 之间")
	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	
	@Length(min=1, max=30, message="职位名称长度必须介于 1 和 30 之间")
	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}
	
	@Length(min=0, max=50, message="职位描述长度必须介于 0 和 50 之间")
	public String getPostDes() {
		return postDes;
	}

	public void setPostDes(String postDes) {
		this.postDes = postDes;
	}
	
	@NotNull(message="职位等级（1~9，数字越高代表等级越高）不能为空")
	public Integer getPostLevel() {
		return postLevel;
	}

	public void setPostLevel(Integer postLevel) {
		this.postLevel = postLevel;
	}
	
}