/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

/**
 * 字典Service
 * @author ThinkGem
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class DictService extends CrudService<DictDao, Dict> {
	
	/**
	 * 查询字段类型列表
	 * @return
	 */
	public List<String> findTypeList(){
		return dao.findTypeList(new Dict());
	}

	@Transactional(readOnly = false)
	public void save(Dict dict) {
		super.save(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}

	@Transactional(readOnly = false)
	public void delete(Dict dict) {
		super.delete(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}
	
	/**
	 * 根据父type和value查询父ID
	 */
	public Dict getByPid(Dict dict){
		return dao.getByPid(dict);
	}
	
	/**
	 * 根据父ID查询子dict
	 * @param id
	 * @return
	 */
	public List<Dict> getChildList(String id){
		return dao.getByChild(id);
	}
	
	/**
	 * 按类型查询dict，级联查询
	 * @param ttype
	 * @param tvalue
	 * @return
	 */
	public Dict getByType(String ttype, String tvalue) {
		Dict dict = dao.getByType(ttype, tvalue);
		return dict;
	}

	/**
	 * checkboxs 查询选中值
	 * @param string 
	 * @param fqMd
	 * @return
	 */
	public List<Dict> getChecked(String ttype) {
		List<Dict>  list = dao.getChecked(ttype);
		return list;
	}

	/**
	 * 查询所有省
	 * @param object 
	 * @return Object
	 */
	public List<Dict> getProvinces(Dict d) {
		List<Dict> list = dao.getProvinces(d);
		return list;
	}

	/**
	 * 根据省查询市，级联查询
	 * @param province
	 * @return
	 */
	public List<Dict> getCities(String province) {
		List<Dict> list = dao.getCities(province);
		return list;
	}
	
	/**
	 * 产品类型级联
	 * @param province
	 * @return
	 */
	public List<Dict> getProductsType(Dict dict) {
		List<Dict> list = dao.getProductsType(dict);
		return list;
	}

}
