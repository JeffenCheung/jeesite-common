/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.dao.SysMutiLangDao;
import com.thinkgem.jeesite.modules.sys.entity.SysMutiLang;

/**
 * 多国语言Service
 * 
 * @author Jeffen
 * @version 2015-05-26
 */
@Service
@Transactional(readOnly = true)
public class SysMutiLangService extends
		CrudService<SysMutiLangDao, SysMutiLang> {

	public SysMutiLang get(String id) {
		return super.get(id);
	}

	public List<SysMutiLang> findList(SysMutiLang sysMutiLang) {
		return super.findList(sysMutiLang);
	}

	public Page<SysMutiLang> findPage(Page<SysMutiLang> page,
			SysMutiLang sysMutiLang) {
		return super.findPage(page, sysMutiLang);
	}

	@Transactional(readOnly = false)
	public void save(SysMutiLang sysMutiLang) {
		super.save(sysMutiLang);
	}

	@Transactional(readOnly = false)
	public void delete(SysMutiLang sysMutiLang) {
		super.delete(sysMutiLang);
	}

}