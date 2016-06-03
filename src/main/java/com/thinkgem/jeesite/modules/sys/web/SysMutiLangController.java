/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.SysMutiLang;
import com.thinkgem.jeesite.modules.sys.service.SysMutiLangService;
import com.thinkgem.jeesite.modules.sys.utils.MutiLangUtils;

/**
 * 多国语言Controller
 * @author Jeffen
 * @version 2015-05-26
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/sysMutiLang")
public class SysMutiLangController extends BaseController {

	@Autowired
	private SysMutiLangService sysMutiLangService;
	
	@ModelAttribute
	public SysMutiLang get(@RequestParam(required=false) String id) {
		SysMutiLang entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysMutiLangService.get(id);
		}
		if (entity == null){
			entity = new SysMutiLang();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:sysMutiLang:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysMutiLang sysMutiLang, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysMutiLang> page = sysMutiLangService.findPage(new Page<SysMutiLang>(request, response), sysMutiLang); 
		model.addAttribute("page", page);
		return "modules/sys/sysMutiLangList";
	}

	@RequiresPermissions("sys:sysMutiLang:view")
	@RequestMapping(value = "form")
	public String form(SysMutiLang sysMutiLang, Model model) {
		model.addAttribute("sysMutiLang", sysMutiLang);
		return "modules/sys/sysMutiLangForm";
	}

	@RequiresPermissions("sys:sysMutiLang:edit")
	@RequestMapping(value = "save")
	public String save(SysMutiLang sysMutiLang, Model model, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage4DemoMode(redirectAttributes);
			return "redirect:"+Global.getAdminPath()+"/sys/sysMutiLang/?repage";
		}
		if (!beanValidator(model, sysMutiLang)){
			return form(sysMutiLang, model);
		}
		sysMutiLangService.save(sysMutiLang);
		addMessage(redirectAttributes, "保存语言成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysMutiLang/?repage";
	}
	
	@RequiresPermissions("sys:sysMutiLang:edit")
	@RequestMapping(value = "delete")
	public String delete(SysMutiLang sysMutiLang, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage4DemoMode(redirectAttributes);
			return "redirect:"+Global.getAdminPath()+"/sys/sysMutiLang/?repage";
		}
		sysMutiLangService.delete(sysMutiLang);
		addMessage(redirectAttributes, "删除语言成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysMutiLang/?repage";
	}

	/**
	 * 刷新语言内容
	 * 
	 * @param sysMutiLang
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("sys:sysMutiLang:refreshCach")
	@RequestMapping(value = "refreshCach")
	public String refreshCach(SysMutiLang sysMutiLang, RedirectAttributes redirectAttributes) {
		MutiLangUtils.refleshMutiLangCach();
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.refresh.success"));
		return "redirect:"+Global.getAdminPath()+"/sys/sysMutiLang/?repage";
	}
}