/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Post;
import com.thinkgem.jeesite.modules.sys.service.PostService;
import com.thinkgem.jeesite.modules.sys.utils.MutiLangUtils;

import javax.validation.ConstraintViolationException;

import org.springframework.web.multipart.MultipartFile;

import com.orangesignal.csv.CsvConfig;
import com.orangesignal.csv.manager.CsvEntityManager;
import com.orangesignal.csv.manager.CsvSaver;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.Encodes;
/**
 * 职位表Controller
 * @author 刘燎坡
 * @version 2015-11-09
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/post")
public class PostController extends BaseController {

	public static final String URL_ADMIN_REPAGE = "redirect:"+Global.getAdminPath()+"/sys/post/?repage";
	public static final String URL_MODULE_LIST = "modules/sys/postList";
	public static final String URL_MODULE_FORM = "modules/sys/postForm";
	
	public static final String PERMISSION_VIEW = "sys:post:view";
	public static final String PERMISSION_EDIT = "sys:post:edit";
	public static final String PERMISSION_DBA = "sys:post:dba";
	public static final String PERMISSION_IO = "sys:post:io";
	
	@Autowired
	private PostService postService;
	
	@ModelAttribute
	public Post get(@RequestParam(required=false) String id) {
		Post entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = postService.get(id);
		}
		if (entity == null){
			entity = new Post();
		}
		return entity;
	}
	
	
	@RequiresPermissions(PERMISSION_VIEW)
	@RequestMapping(value = {"list", ""})
	public String list(Post post, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Post> page = postService.findPage(new Page<Post>(request, response), post); 
		model.addAttribute("page", page);
		return URL_MODULE_LIST;
	}

	@RequiresPermissions(PERMISSION_VIEW)
	@RequestMapping(value = "form")
	public String form(Post post, Model model) {
		model.addAttribute("post", post);
		return URL_MODULE_FORM;
	}

	@RequiresPermissions(PERMISSION_EDIT)
	@RequestMapping(value = "save")
	public String save(Post post, Model model, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage4DemoMode(redirectAttributes);
			return URL_ADMIN_REPAGE;
		}
		if (!beanValidator(model, post)){
			return form(post, model);
		}
		postService.save(post);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.save.success.param", "【职位表】"));
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_EDIT)
	@RequestMapping(value = "delete")
	public String delete(Post post, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage4DemoMode(redirectAttributes);
			return URL_ADMIN_REPAGE;
		}
		postService.delete(post);
		String physicalDelete = post.getPhysicalDelete().booleanValue()?" <span class='text-warning'>[注：物理删除]</span>":"";
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.delete.success.param", "【职位表】") + physicalDelete);
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_EDIT)
	@RequestMapping(value = "deleteChecked")
	public String deleteChecked(Post post, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage4DemoMode(redirectAttributes);
			return URL_ADMIN_REPAGE;
		}
		postService.deleteList(post);
		String physicalDelete = post.getPhysicalDelete().booleanValue()?" <span class='text-warning'>[注：物理删除]</span>":"";
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.delete.success.param", "【职位表】") + " （共批量删除 " + post.getCbRowDataIds().size() + " 条数据）" + physicalDelete);
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_DBA)
	@RequestMapping(value = "truncateTable")
	public String truncateTable(Post post, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage4DemoMode(redirectAttributes);
			return URL_ADMIN_REPAGE;
		}
		postService.truncateTable(post);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.delete.success.param", "【职位表，<span class='text-warning'>物理清空</span>】"));
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_DBA)
	@RequestMapping(value = "copy")
	public String copy(Post post, RedirectAttributes redirectAttributes) {
		postService.copy(post);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.copy.success.param", "【职位表】"));
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_DBA)
	@RequestMapping(value = "copyChecked")
	public String copyChecked(Post post, RedirectAttributes redirectAttributes) {
		postService.copyList(post);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.copy.success.param", "【职位表】") + " （共批量复制 " + post.getCbRowDataIds().size() + " 条数据）");
		return URL_ADMIN_REPAGE;
	}
	
	/**
	 * 导出CSV数据
	 * @param post
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions(PERMISSION_IO)
	@RequestMapping(value = "export/csv", method = RequestMethod.POST)
	public String exportCsvFile(Post post, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
			String fileName = "【职位表】" + DateUtils.getDateTimeTight() + ".csv";
			List<Post> lst = postService.findList(post);
			CsvEntityManager cet = new CsvEntityManager(new CsvConfig(
					CsvConfig.DEFAULT_SEPARATOR));
			CsvSaver csvSaver = null;
			response.reset();
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ Encodes.urlEncode(fileName));
			csvSaver = cet.save(lst, Post.class);
			csvSaver.to(response.getOutputStream());
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出职位表失败！失败信息：" + e.getMessage());
		}
		return URL_ADMIN_REPAGE;
	}

	/**
	 * 导入CSV数据
	 * 
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions(PERMISSION_IO)
	@RequestMapping(value = "import/csv", method = RequestMethod.POST)
	public String importCsvFile(MultipartFile file,
			RedirectAttributes redirectAttributes) throws Exception {
		if (Global.isDemoMode()) {
			addMessage4DemoMode(redirectAttributes);
			return "redirect:" + Global.getAdminPath()
					+ "/sys/post/?repage";
		}
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			if (StringUtils.isBlank(file.getOriginalFilename())) {
				throw new RuntimeException("导入文档为空!");
			} else if (!file.getOriginalFilename().toLowerCase()
					.endsWith("csv")) {
				throw new RuntimeException("文档格式不正确!");
			} else {
				List<Post> list = new CsvEntityManager().load(
						Post.class).from(file.getInputStream());
				long i = 0;
				for (Post post : list) {

					try {
						BeanValidators.validateWithException(validator, post);
						postService.save(post);
						successNum++;
						++i;
					} catch (ConstraintViolationException ex) {
						failureMsg.append("<br/>CSV数据第" + i + "行导入失败：");
						List<String> messageList = BeanValidators
								.extractPropertyAndMessageAsList(ex, ": ");
						for (String message : messageList) {
							failureMsg.append(message + "; ");
							failureNum++;
						}
					} catch (Exception ex) {
						failureMsg.append("<br/>导入CSV数据失败：" + ex.getMessage());
					}
				}
				if (failureNum > 0) {
					failureMsg.insert(0, "，失败 " + failureNum + " 条数据，导入信息如下：");
				}
				addMessage(redirectAttributes, "已成功导入 " + successNum
						+ " 条CSV数据" + failureMsg);
			}
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入CSV数据失败！失败信息：" + e.getMessage());
		}
		return URL_ADMIN_REPAGE;
	}

	/**
	 * 下载导入CSV数据的模板
	 * 
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions(PERMISSION_IO)
	@RequestMapping(value = "import/csv/template")
	public String importCsvFileTemplate(HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage4DemoMode(redirectAttributes);
			return URL_ADMIN_REPAGE;
		}
		try {
			String fileName = "【职位表】数据导入模板.csv";

			List<Post> list = new ArrayList();
			Post post = new Post();
			//post = post.getSinglePoJoByDefaultValue();
			list.add(post);

			CsvEntityManager cet = new CsvEntityManager();
			response.reset();
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ Encodes.urlEncode(fileName));
			cet.save(list, Post.class).to(response.getOutputStream());
			return null;

		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息：" + e.getMessage());
		}
		return URL_ADMIN_REPAGE;
	}
	
}