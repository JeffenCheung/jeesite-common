/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.TreeDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;

/**
 * 机构DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office> {

	/**
	 * 营业部列表
	 * @return
	 */
	List<Office> getYyb();

	/**
	 * 单个组织机构
	 * @param office
	 * @return
	 */
	Office getOffice(Office office);

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
	List<Office> cutChildren(Office office);

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
	List<Office> cutParents(Office office);

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
	List<Office> cutBranch(Office office);

	/**
	 * 父节点开始所有子节点中取出某个子节点
	 * 
	 * @param parentOfficeId
	 * @param childOfficeId
	 * @return
	 * 
	 * @author Jeffen@pactera
	 * @since 1.2.10
	 * @date 2016/3/24
	 */
	List<Office> cutExistChild(@Param("parentOffice") Office parentOfficeId,
			@Param("childOffice") Office childOfficeId);
}
