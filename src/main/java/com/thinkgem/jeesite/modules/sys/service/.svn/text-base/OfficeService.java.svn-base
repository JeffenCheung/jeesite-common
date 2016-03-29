/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.TreeService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.OfficeDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 机构Service
 * @author ThinkGem
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class OfficeService extends TreeService<OfficeDao, Office> {

	/**
	 * 同步/异步取得组织机构数据
	 * @return List<Office>
	 * 
	 * @author Jeffen@pactera
	 * @date 2015/12/30
	 * @since v1.2.10
	 */
	public List<Office> findAll(){
		// 异步加载 by jeffen@pactera 2015/12/28
		if (Global.getConfigBoolean("widget.ztree.office.async")) {
			String nodeId = Global.getConfig("widget.ztree.office.root");
			if (StringUtils.isBlank(nodeId)) {
				nodeId = "0";
			}
			return findRoot(new Office(nodeId));
		}
			
		return UserUtils.getOfficeList();
	}

	public List<Office> findList(Boolean isAll){
		if (isAll != null && isAll){
			return UserUtils.getOfficeAllList();
		}else{
			return UserUtils.getOfficeList();
		}
	}
	
	@Transactional(readOnly = true)
	public List<Office> findList(Office office){
		office.setParentIds(office.getParentIds()+"%");
		return dao.findByParentIdsLike(office);
	}
	
	@Transactional(readOnly = true)
	public List<Office> findRoot(Office office){
		return dao.findRoot(office);
	}
	
	@Transactional(readOnly = true)
	public List<Office> findChildrenNodeList(Office office){
		return dao.findByParentId(office);
	}
	
	@Transactional(readOnly = false)
	public void save(Office office) {
		super.save(office);
		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}
	
	@Transactional(readOnly = false)
	public void delete(Office office) {
		super.delete(office);
		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}
	
	/**
	 * 获取营业部List
	 * @return
	 */
	@Transactional(readOnly = false)
	public List<Office> getYyb(){
		return dao.getYyb();
	}

	/**
	 * 根据名称获取单个组织机构
	 * @param deptName
	 * @return
	 */
	@Transactional(readOnly = false)
	public Office getByName(Office deptName) {
		return dao.getOffice(deptName);
	}

	/**
	 * 根据机构编码获取机构信息
	 * @param code
	 * @return
	 */
	@Transactional(readOnly = false)
	public Office getByCode(Office code) {
		return dao.getOffice(code);
	}

	/**
	 * 根据机构编码获取所有子节点信息（包括该机构）
	 * 
	 * @param officeId
	 * @return
	 * 
	 * @author Jeffen@pactera
	 * @since 1.2.10
	 * @date 2016/3/24
	 */
	@Transactional(readOnly = false)
	public List<Office> cutChildren(Office officeId) {
		return dao.cutChildren(officeId);
	}

	/**
	 * 根据机构编码获取所有父节点信息（不包括该机构）
	 * 
	 * @param officeId
	 * @return
	 * 
	 * @author Jeffen@pactera
	 * @since 1.2.10
	 * @date 2016/3/24
	 */
	@Transactional(readOnly = false)
	public List<Office> cutParents(Office officeId) {
		return dao.cutParents(officeId);
	}

	/**
	 * 根据机构编码获取所有本枝父子节点信息（包括根节点）
	 * 
	 * @param officeId
	 * @return
	 * 
	 * @author Jeffen@pactera
	 * @since 1.2.10
	 * @date 2016/3/24
	 */
	@Transactional(readOnly = false)
	public List<Office> cutBranch(Office officeId) {
		return dao.cutBranch(officeId);
	}

	/**
	 * 判断父节点开始所有子节点中是否包含某个子节点
	 * 
	 * @param parentOfficeId
	 * @param childOfficeId
	 * @return
	 * 
	 * @author Jeffen@pactera
	 * @since 1.2.10
	 * @date 2016/3/24
	 */
	@Transactional(readOnly = false)
	public boolean isExistChild(Office parentOfficeId, Office childOfficeId) {
		List<Office> nodes = dao.cutExistChild(parentOfficeId, childOfficeId);
		if (nodes != null && nodes.size() > 0)
			return true;
		return false;
	}
}
