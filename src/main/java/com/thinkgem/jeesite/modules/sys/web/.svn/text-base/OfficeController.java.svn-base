/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtil;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Post;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.PostService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 机构Controller
 * @author ThinkGem
 * @version 2013-5-15
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/office")
public class OfficeController extends BaseController {

	@Autowired
	private OfficeService officeService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private PostService postService;
	
	@ModelAttribute("office")
	public Office get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return officeService.get(id);
		}else{
			return new Office();
		}
	}

	@RequiresPermissions("sys:office:view")
	@RequestMapping(value = {""})
	public String index(Office office, Model model) {
//        model.addAttribute("list", officeService.findAll());
		return "modules/sys/officeIndex";
	}
	
	@RequiresPermissions("sys:office:view")
	@RequestMapping(value = {"list"})
	public String list(Office office, HttpServletRequest request, HttpServletResponse response, Model model) {
		if (Global.getConfigBoolean("widget.ztree.office.async")) {
			return pagelist(office, request, response, model);
		}
        model.addAttribute("list", officeService.findList(office));
		return "modules/sys/officeList";
	}
	
	/**
	 * 组织机构分页列表
	 * @param office
	 * @param request
	 * @param response
	 * @param model
	 * 
	 * @author Jeffen@pactera
	 * @date 2015/12/27
	 * @since v1.2.10
	 * @return
	 */
	@RequiresPermissions("sys:office:view")
	@RequestMapping(value = {"pagelist"})
	public String pagelist(Office office, HttpServletRequest request, HttpServletResponse response, Model model) {
        model.addAttribute("page", officeService.findPage(new Page<Office>(request, response), office));
		return "modules/sys/officeList";
	}
	
	@RequiresPermissions("sys:office:view")
	@RequestMapping(value = "form")
	public String form(Office office, Model model) {
		User user = UserUtils.getUser();
		if (office.getParent()==null || office.getParent().getId()==null){
			office.setParent(user.getOffice());
		}
		office.setParent(officeService.get(office.getParent().getId()));
		if (office.getArea()==null){
			office.setArea(user.getOffice().getArea());
		}
		// 自动获取排序号
		if (StringUtils.isBlank(office.getId())&&office.getParent()!=null){
			int size = 0;
			// modify findAll to findList by jeffen@pactera 2015/12/28
			List<Office> list;
			if (Global.getConfigBoolean("widget.ztree.office.async")) {
				list = officeService.findList(office);
			} else {
				list = officeService.findAll();
			}
			for (int i=0; i<list.size(); i++){
				Office e = list.get(i);
				if (e.getParent()!=null && e.getParent().getId()!=null
						&& e.getParent().getId().equals(office.getParent().getId())){
					size++;
				}
			}
			office.setCode(office.getParent().getCode() + StringUtils.leftPad(String.valueOf(size > 0 ? size+1 : 1), 3, "0"));
		}
		model.addAttribute("office", office);
		return "modules/sys/officeForm";
	}
	
	@RequiresPermissions("sys:office:edit")
	@RequestMapping(value = "save")
	public String save(Office office, Model model, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage4DemoMode(redirectAttributes);
			return "redirect:" + adminPath + "/sys/office/";
		}
		if (!beanValidator(model, office)){
			return form(office, model);
		}
		officeService.save(office);
		
		if(office.getChildDeptList()!=null){
			Office childOffice = null;
			for(String id : office.getChildDeptList()){
				childOffice = new Office();
				childOffice.setName(DictUtils.getDictLabel(id, "sys_office_common", "未知"));
				childOffice.setParent(office);
				childOffice.setArea(office.getArea());
				childOffice.setType("2");
				childOffice.setGrade(String.valueOf(Integer.valueOf(office.getGrade())+1));
				childOffice.setUseable(Global.YES);
				officeService.save(childOffice);
			}
		}
		
		addMessage(redirectAttributes, "保存机构'" + office.getName() + "'成功");
		String id = "0".equals(office.getParentId()) ? "" : office.getParentId();
		return "redirect:" + adminPath + "/sys/office/list?id="+id+"&parentIds="+office.getParentIds();
	}
	
	@RequiresPermissions("sys:office:edit")
	@RequestMapping(value = "delete")
	public String delete(Office office, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage4DemoMode(redirectAttributes);
			return "redirect:" + adminPath + "/sys/office/list";
		}
//		if (Office.isRoot(id)){
//			addMessage(redirectAttributes, "删除机构失败, 不允许删除顶级机构或编号空");
//		}else{
			officeService.delete(office);
			addMessage(redirectAttributes, "删除机构成功");
//		}
		return "redirect:" + adminPath + "/sys/office/list?id="+office.getParentId()+"&parentIds="+office.getParentIds();
	}

	/**
	 * 获取机构JSON数据。
	 * @param nodeId 当前节点ID（异步加载用）
	 * @param extId 排除的ID
	 * @param type	类型（1：公司；2：部门/小组/其它：3：用户）
	 * @param grade 显示级别
	 * @param isAll 查询所有
	 * @param isOfficeCode 设定机构编码而非机构ID
	 * @param response
	 * @return
	 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(
			@RequestParam(required = false) String nodeId,
			@RequestParam(required = false) String extId,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) Long grade,
			@RequestParam(required = false) Boolean isAll,
			@RequestParam(required = false) Boolean isOfficeCode,
			HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Office> list = null;
		
		if (Global.getConfigBoolean("widget.ztree.office.async")) {
			// 异步加载
			if (StringUtils.isBlank(nodeId)) {
				nodeId = Global.getConfig("widget.ztree.office.root");
				if (StringUtils.isBlank(nodeId)) {
					nodeId = "0";
				}
				// 初始化根节点
				list = officeService.findRoot(new Office(nodeId));
			} else {
				// 加载单枝节点
				list = officeService.findChildrenNodeList(new Office(nodeId));
			}
		} else {
			// 同步全树加载(需判断nodeId异步乱入，如职务节点自动异步刷新时，防止重复数据)
			if (StringUtils.isBlank(nodeId)) {
				list = officeService.findList(isAll);
			}
		}
		
		if (list != null && list.size() > 0)
		for (int i=0; i<list.size(); i++){
			Office e = list.get(i);
			if (
					// add root sync condition by jeffen@pactera 2015/12/22
					((StringUtils.isNotBlank(nodeId) && nodeId.equals(Global.getConfig("widget.ztree.office.root")))
						|| StringUtils.isBlank(extId)
						|| (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1))
					&& (type == null || (type != null && (type.equals("1") ? type.equals(e.getType()) : true)))
					&& (grade == null || (grade != null && Integer.parseInt(e.getGrade()) <= grade.intValue()))
					&& Global.YES.equals(e.getUseable())){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				if (StringUtil.isNotEmpty(isOfficeCode) && isOfficeCode) {
					map.put("officeCode", e.getCode());
				}
				
				// 登录用户所在机构部门
				if (e.getId().equals(
						UserUtils.getUser().getOffice().getId())) {
					map.put("iconSkin", "ico_diy_profile");
				}
				
				map.put("pId", e.getParentId());
				map.put("pIds", e.getParentIds());
				map.put("name", e.getName());
				if (type != null && "3".equals(type)){
					map.put("isParent", true);
				}
				
				// 异步加载显示子节点收拉图标
				if(Global.getConfigBoolean("widget.ztree.office.async")){
					map.put("isParent", true);
				}
				mapList.add(map);
			}
		}
		
		// 人员选择
		if ("3".equals(type) && StringUtils.isNotBlank(nodeId)) {
			List<User> userList = systemService.findUserByOfficeId(nodeId);
			if (userList != null && userList.size() > 0)
			for (int i = 0; i < userList.size(); i++) {
				User e = userList.get(i);
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", "u_" + e.getId());
				map.put("pId", nodeId);
				map.put("name", StringUtils.replace(e.getName(), " ", ""));
				map.put("iconSkin", "ico_diy_profile");
				mapList.add(map);
			}
		}
		
		// 职务选择
		if ("4".equals(type) && StringUtils.isNotBlank(nodeId)) {
			Post post = new Post();
			post.setOrgId(nodeId);
			List<Post> postList = postService.findList(post);
			if (postList != null && postList.size() > 0)
			for (int i = 0; i < postList.size(); i++) {
				Post e = postList.get(i);
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", "u_" + e.getId());
				map.put("pId", nodeId);
				map.put("name", StringUtils.replace(e.getPostName(), " ", ""));
				map.put("iconSkin", "ico_diy_bag");
				mapList.add(map);
			}
		}
		return mapList;
	}

}
