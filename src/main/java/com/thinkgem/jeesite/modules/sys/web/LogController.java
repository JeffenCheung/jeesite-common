/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Log;
import com.thinkgem.jeesite.modules.sys.service.LogService;

/**
 * 日志Controller
 * 
 * @author ThinkGem
 * @version 2013-6-2
 * @date 2015-6-12
 * @since v1.2.8 by jeffen@pactera
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/log")
public class LogController extends BaseController {

	@Autowired
	private LogService logService;

	@RequiresPermissions("sys:log:view")
	@RequestMapping(value = { "list", "" })
	public String list(Log log, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Page<Log> page = logService.findPage(new Page<Log>(request, response),
				log);
		model.addAttribute("page", page);
		return "modules/sys/logList";
	}

	/**
	 * 日志监控
	 * 
	 * @author Jeffen
	 * @date 20155-6-12
	 * @param log
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:log:view")
	@RequestMapping(value = { "charts" })
	public String charts(Log log, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Page<Log> page = new Page<Log>(request,
				response);
		page.setPageSize(15);
		page = logService.findPageGroupByTitle(page, log);
		model.addAttribute("page", page);
		return "modules/sys/logCharts";
	}
}
