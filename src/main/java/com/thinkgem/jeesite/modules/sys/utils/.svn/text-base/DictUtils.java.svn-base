/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.utils;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;

/**
 * 字典工具类
 * @author ThinkGem
 * @version 2013-5-29
 */
public class DictUtils {
	
	private static DictDao dictDao = SpringContextHolder.getBean(DictDao.class);
	
	public static final String CACHE_DICT_MAP = "dictMap";
	public static final String CACHE_DICT_MAP_PARENT_ID = "dictMapParentId";
	public static final String CACHE_DICT_MAP_TYPE = "dictMapType";
	public static final String CACHE_DICT_MAP_TYPE_DES = "dictMapTypeDes";
	
	
	public static String getDictLabel(String value, String type, String defaultValue){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)){
			for (Dict dict : getDictList(type)){
				if (type.equals(dict.getType()) && value.equals(dict.getValue())){
					return dict.getLabel();
				}
			}
		}
		return defaultValue;
	}
	
	public static String getDictLabels(String values, String type, String defaultValue){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(values)){
			List<String> valueList = Lists.newArrayList();
			for (String value : StringUtils.split(values, ",")){
				valueList.add(getDictLabel(value, type, defaultValue));
			}
			return StringUtils.join(valueList, ",");
		}
		return defaultValue;
	}

	public static String getDictValue(String label, String type, String defaultLabel){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(label)){
			for (Dict dict : getDictList(type)){
				// delete dummy code by jeffen@pactera 2015/12/30
				//List<Dict> findList = dictDao.findList(dict);
				if (type.equals(dict.getType()) && label.equals(dict.getLabel())){
					return dict.getValue();
				}
			}
		}
		return defaultLabel;
	}
	
	public static Dict getDictValue(Dict dict){
		return dictDao.getValue(dict);
	}

	public static Dict getDictLabel(String type, String value) {
		Dict byType = dictDao.getByType(type, value);
		return byType;
	}
	
	public static List<Dict> getDictChildList(String value, String type){
		@SuppressWarnings("unchecked")
		Map<String, List<Dict>> dictMap = (Map<String, List<Dict>>)CacheUtils.get(CACHE_DICT_MAP);
		if (dictMap==null){
			dictMap = Maps.newHashMap();
			for (Dict dict : dictDao.findAllList(new Dict())){
				List<Dict> dictList = dictMap.get(dict.getType());
				if (dictList != null){
					dictList.add(dict);
				}else{
					dictMap.put(dict.getType(), Lists.newArrayList(dict));
				}
			}
			CacheUtils.put(CACHE_DICT_MAP, dictMap);
		}
		List<Dict> dictList = dictMap.get(type);
		if (dictList == null){
			dictList = Lists.newArrayList();
		}
		return dictList;
	}
	
	/**
	 * 根据字典类型查找字典项
	 * @param type
	 * @return
	 */
	public static List<Dict> getDictList(String type){
		@SuppressWarnings("unchecked")
		Map<String, List<Dict>> dictMap = (Map<String, List<Dict>>)CacheUtils.get(CACHE_DICT_MAP);
		if (dictMap==null){
			dictMap = Maps.newHashMap();
			for (Dict dict : dictDao.findAllList(new Dict())){
				List<Dict> dictList = dictMap.get(dict.getType());
				// 根据父类ID判定是否过滤
				if (dictList != null){
					dictList.add(dict);
				}else{
					dictMap.put(dict.getType(), Lists.newArrayList(dict));
				}
			}
			CacheUtils.put(CACHE_DICT_MAP, dictMap);
		}
		List<Dict> dictList = dictMap.get(type);
		if (dictList == null){
			dictList = Lists.newArrayList();
		}
		return dictList;
	}
	
	/**
	 * 查找字典类型描述列表
	 * 
	 * @return type : type description: [type]description
	 */
	public static List<Dict> getDictTypeDesList() {
		@SuppressWarnings("unchecked")
		Map<String, List<Dict>> dictMap = (Map<String, List<Dict>>) CacheUtils
				.get(CACHE_DICT_MAP_TYPE_DES);
		if (dictMap == null) {
			dictMap = Maps.newHashMap();
			dictMap.put(CACHE_DICT_MAP_TYPE_DES,
					dictDao.findTypeDesList(new Dict()));
			CacheUtils.put(CACHE_DICT_MAP_TYPE_DES, dictMap);
		}
		List<Dict> dictList = dictMap.get(CACHE_DICT_MAP_TYPE_DES);
		if (dictList == null) {
			dictList = Lists.newArrayList();
		}
		return dictList;
	}

	/**
	 * 根据树根字典类型查找所有树字典项。
	 * 递归调用，逻辑复杂，性能底下，死结过多，建议放弃；
	 * 建议通过链表遍历等算法处理;
	 * 或通过union脚本检索固定级数的tree
	 * 
	 * @author Jeffen@pactera
	 * @since v1.2.10
	 * @date 2015/12/9
	 * @param type
	 * @return
	 */
	public static List<Dict> getDictTreeByRootType(String type, List<Dict> trunkDictList){
		// 根据字典类型查找字典项列表
		List<Dict> dictList = getDictList(type);
		if (dictList == null){
			dictList = Lists.newArrayList();
			
		}
		if (trunkDictList == null){
			trunkDictList = Lists.newArrayList();
		}
		
		// 根据每个字典项的ID查找所属一级子字典类型列表
		List<Dict> childrenDictList = Lists.newArrayList();
		for (Dict dict : dictList){
			if(dict.getId().equals(dict.getParentId())){
				// 非法父子引用数据
				continue;
			}
			childrenDictList.addAll(getDictListByParentId(dict.getId()));
		}
		
		// 逐级递归调用每个子字典项的一级子字典类型列表
		for (int i = 0; i < childrenDictList.size(); i++) {
			if (i == 0) {
				// 同级的节点递归一个即可
				List<Dict> branckDictList = getDictTreeByRootType(childrenDictList
						.get(i).getType(), trunkDictList);
				
				// 去重枝叶
				for (Dict b : branckDictList){
					for (Dict t : trunkDictList){
						if(b.getId().equals(t.getId())){
							branckDictList.remove(b);
						}
					}
				}
				trunkDictList.addAll(branckDictList);
			}
		}
		
		// 去重枝叶
		for (Dict t : trunkDictList){
			for (Dict d : dictList){
				if(t.getId().equals(d.getId())){
					trunkDictList.remove(t);
				}
			}
		}
		
		// 返回所有主枝干字典树列表
		dictList.addAll(trunkDictList);
		return dictList;
	}

	/**
	 * 根据树根字典类型查找所有树字典项。
	 * 通过union脚本检索固定级数的tree
	 * 
	 * @author Jeffen@pactera
	 * @since v1.2.10
	 * @date 2015/12/9
	 * @param type
	 * @return
	 */
	public static List<Dict> getDictTreeByRootType(String type){
		@SuppressWarnings("unchecked")
		Map<String, List<Dict>> dictMap = (Map<String, List<Dict>>)CacheUtils.get(CACHE_DICT_MAP_TYPE);
		if (dictMap==null){
			dictMap = Maps.newHashMap();
			// 根据字典类型查找并缓存树分支节点的字典项列表
			Dict d = new Dict();
			d.setType(type);
			dictMap.put(type, dictDao.getDictTreeByRootType(d));
			CacheUtils.put(CACHE_DICT_MAP_TYPE, dictMap);
		}
		List<Dict> dictList = dictMap.get(type);
		if (dictList == null){
			dictList = Lists.newArrayList();
		}
		return dictList;
	}
	
	/**
	 * 通过父节点ID取得所有一级子节点字典集合
	 * @param parentId
	 * @return
	 */
	public static List<Dict> getDictListByParentId(String parentId){
		@SuppressWarnings("unchecked")
		Map<String, List<Dict>> dictMap = (Map<String, List<Dict>>)CacheUtils.get(CACHE_DICT_MAP_PARENT_ID);
		if (dictMap==null){
			dictMap = Maps.newHashMap();
			for (Dict dict : dictDao.findAllList(new Dict())){
				List<Dict> dictList = dictMap.get(dict.getParentId());
				// 根据父类ID判定是否过滤
				if (dictList != null){
					dictList.add(dict);
				}else{
					dictMap.put(dict.getParentId(), Lists.newArrayList(dict));
				}
			}
			CacheUtils.put(CACHE_DICT_MAP_PARENT_ID, dictMap);
		}
		List<Dict> dictList = dictMap.get(parentId);
		if (dictList == null){
			dictList = Lists.newArrayList();
		}
		return dictList;
	}
	

	/**
	 * 取得和刷新数据字典项列表
	 * 
	 * @param type
	 *            数据字典项ID
	 * @param parentId
	 *            父类ID
	 * @return
	 */
	public static List<Dict> getDictList(String type, String parentId) {
		@SuppressWarnings("unchecked")
		Map<String, List<Dict>> dictMap = (Map<String, List<Dict>>) CacheUtils
				.get(CACHE_DICT_MAP);
		List<Dict> newDictList=dictDao.getByChild(parentId);
		dictMap.put(type, newDictList);
		CacheUtils.put(CACHE_DICT_MAP, dictMap);
		return newDictList;
	}
	
	/**
	 * 返回字典列表（JSON）
	 * 
	 * @param type
	 * @return
	 */
	public static String getDictListJson(String type) {
		return JsonMapper.toJsonString(getDictList(type));
	}
	 
	/**
	 * 通过id获取lebel值
	 */
	public static String getDictLabelById(String id, String defaultValue){
		if (StringUtils.isNotBlank(id)){
			Dict dict = new Dict();
			dict = dictDao.get(id);
			if(dict!=null){
				return dict.getLabel();
			}else{
				return defaultValue;
			}
		}
		return defaultValue;
	}
	
	/** 刷新字典cach **/
	public static void refleshDictCach() {
		CacheUtils.remove(CACHE_DICT_MAP);
		CacheUtils.remove(CACHE_DICT_MAP_PARENT_ID);
		CacheUtils.remove(CACHE_DICT_MAP_TYPE);
		CacheUtils.remove(CACHE_DICT_MAP_TYPE_DES);
	}
}
