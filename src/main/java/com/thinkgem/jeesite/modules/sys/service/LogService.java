/**
 * Copyright &copy; 2012-2013 <a href="httparamMap://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.sys.dao.LogDao;
import com.thinkgem.jeesite.modules.sys.entity.Log;

/**
 * 日志Service
 * 
 * @author ThinkGem
 * @version 2014-05-16
 * @date 2015-6-12
 * @since v1.2.8 by jeffen@pactera
 */
@Service
@Transactional(readOnly = true)
public class LogService extends CrudService<LogDao, Log> {

	@Autowired
	private LogDao logDao;

	public Page<Log> findPage(Page<Log> page, Log log) {

		// 设置默认时间范围，默认当前月
		log.setDateIntervalDefaultThisMonth();

		return super.findPage(page, log);

	}

	/**
	 * 获取菜单分组的访问日志数据
	 * 
	 * @author Jeffen
	 * @date 2015-6-12
	 * @since v1.2.8
	 * @param page
	 * @param log
	 * @return
	 */
	public Page<Log> findPageGroupByTitle(Page<Log> page, Log log) {

		// 设置默认时间范围，默认当前月
		log.setDateIntervalDefaultThisMonth();
		
		log.setPage(page);
		page.setList(logDao.findTitlePage(log));
		
		return page;

	}
}
