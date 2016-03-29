/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 多国语言Entity
 * @author Jeffen
 * @version 2015-05-26
 */
public class SysMutiLang extends DataEntity<SysMutiLang> {
	
	private static final long serialVersionUID = 1L;
	private String langKey;		// 语言主键
	private String langContext;		// 内容
	private String langCode;		// 语言

	/**key:common.dash_board_en_us, value:Dashboard **/
	public static Map<String, String> mutiLangMap = new HashMap<String, String>(); 
	
	public SysMutiLang() {
		super();
	}

	public SysMutiLang(String id){
		super(id);
	}

	@Length(min=1, max=50, message="语言主键长度必须介于 1 和 50 之间")
	public String getLangKey() {
		return langKey;
	}

	public void setLangKey(String langKey) {
		this.langKey = langKey;
	}
	
	@Length(min=1, max=500, message="内容长度必须介于 1 和 500 之间")
	public String getLangContext() {
		return langContext;
	}

	public void setLangContext(String langContext) {
		this.langContext = langContext;
	}
	
	@Length(min=1, max=50, message="语言长度必须介于 1 和 50 之间")
	public String getLangCode() {
		return langCode;
	}

	public void setLangCode(String langCode) {
		this.langCode = langCode;
	}
	
}