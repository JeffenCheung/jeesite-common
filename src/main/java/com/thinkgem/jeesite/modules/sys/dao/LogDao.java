/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.Log;

/**
 * 日志DAO接口
 * 
 * @author ThinkGem
 * @version 2014-05-16
 * @date 2015-6-12
 * @since v1.2.8 by jeffen@pactera
 */
@MyBatisDao
public interface LogDao extends CrudDao<Log> {
	/**
	 * 通过菜单分组获取日志列表
	 * 
	 * @author jeffen
	 * @date 2015/6/12
	 * @since v1.2.8
	 * @param page
	 * @param log
	 * @return
	 */
	public List<Log> findTitlePage(Log log);
}
