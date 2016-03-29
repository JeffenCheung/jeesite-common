/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.dao.PostDao;
import com.thinkgem.jeesite.modules.sys.entity.Post;


/**
 * 职位表Service
 * @author 刘燎坡
 * @version 2015-11-09
 */
@Service
@Transactional(readOnly = true)
public class PostService extends CrudService<PostDao, Post> {

	public Post get(String id) {
		return super.get(id);
	}
	
	public List<Post> findList(Post post) {
		return super.findList(post);
	}
	
	public Page<Post> findPage(Page<Post> page, Post post) {
		return super.findPage(page, post);
	}
	
	@Transactional(readOnly = false)
	public void save(Post post) {
		super.save(post);
	}
	
	@Transactional(readOnly = false)
	public void delete(Post post) {
		super.delete(post);
	}

	@Transactional(readOnly = false)
	public void deleteList(Post post) {
		super.deleteList(post);
	}
		
	@Transactional(readOnly = false)
	public void truncateTable(Post post) {
		super.truncateTable(post);
	}
		
	@Transactional(readOnly = false)
	public void copy(Post post) {
		super.copy(post);
	}
	
	@Transactional(readOnly = false)
	public void copyList(Post post) {
		super.copyList(post);
	}
}