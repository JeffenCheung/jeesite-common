/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;

/**
 * 字典DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict> {

	public List<String> findTypeList(Dict dict);
	public List<Dict> findTypeDesList(Dict dict);
	
	public String findListById(String type);
	
	/**
	 * 根据父type 和 value获取父ID
	 * @param dict
	 * @return
	 */
	public Dict getByPid(Dict dict);
	
	/**
	 * 根据父ID查询子type
	 * @param id
	 * @return
	 */
	public List<Dict> getByChild(String id);
	
	/**
	 * 根据树根字典类型查找所有树字典项。
	 * @param dict
	 * @return
	 */
	public List<Dict> getDictTreeByRootType(Dict dict);
	
	/**
	 * 根据字典类型字典项值查询单个字典项
	 * @param ttype
	 * @param tvalue
	 * @return
	 */
	public Dict getByType(String ttype, String tvalue);

	/**
	 * 查询单个数据字典项
	 * @param dict
	 * @return
	 */
	public Dict getValue(Dict dict);

	
	/**
	 * checkboxs 查询选中值
	 * @param fqMd
	 * @return
	 */
	public List<Dict> getChecked(String ttype);

	/**
	 * 查询所有省
	 * @param d 
	 * @return Object
	 */
	public List<Dict> getProvinces(Dict d);

	/**
	 * 根据省查询市，级联查询
	 * @param province
	 * @return
	 */
	public List<Dict> getCities(String province);

	/**
	 * 产品类型级联查询
	 * @param dict
	 * @return
	 */
	public List<Dict> getProductsType(Dict dict);

}
