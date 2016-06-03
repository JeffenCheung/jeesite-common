package com.thinkgem.jeesite.modules.sys.utils;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtil;
import com.thinkgem.jeesite.modules.sys.dao.SysMutiLangDao;
import com.thinkgem.jeesite.modules.sys.entity.SysMutiLang;

/**
 * 国际化字符串处理及转换静态工具类
 * 
 * @author Jeffen@pactera
 * @date 2015/05/26
 */
public class MutiLangUtils {

	private static SysMutiLangDao sysMutiLangDao = SpringContextHolder
			.getBean(SysMutiLangDao.class);
	public static String language;

	/** 初始化语言信息，TOMCAT启动时直接加入到内存中 **/
	public static void initAllMutiLang() {
		List<SysMutiLang> mutiLang = sysMutiLangDao.findList(new SysMutiLang());

		for (SysMutiLang mutiLangEntity : mutiLang) {
			SysMutiLang.mutiLangMap.put(mutiLangEntity.getLangKey() + "_"
					+ mutiLangEntity.getLangCode(),
					mutiLangEntity.getLangContext());
		}
	}
	


	/**
	 * 取 sys_muti_lang.lang_key 的值返回当前语言的值，如果为空则设定默认值
	 * 
	 * @param langKey
	 * @param defaultValue
	 * @return
	 * 
	 * @author Jeffen
	 * @since v1.2.11 2016/5/20
	 */
	public static String getLangDef(String langKey, String defaultValue) {
		String lang = getLang(langKey);
		if (StringUtils.isEmpty(lang) || langKey.equals(lang))
			lang = defaultValue;
		return lang;
	}

	/**
	 * 根据 sys_muti_lang.lang_key 的值，返回当前语言的值
	 * 
	 * @param langKey
	 * @return 当前语言的值，如果不存在value则返回key
	 */
	public static String getLang(String langKey) {

		if (UserUtils.getSession().getAttribute("lang") != null) {
			language = (String) UserUtils.getSession().getAttribute("lang");
		} else {
			// default language
			language = "zh-cn";
		}

		if (SysMutiLang.mutiLangMap.size() == 0) {
			initAllMutiLang();
		}
		String langContext = SysMutiLang.mutiLangMap.get(langKey + "_"
				+ language);

		if (StringUtil.isEmpty(langContext)) {
			langContext = SysMutiLang.mutiLangMap.get("common.notfind.langkey"
					+ "_" + UserUtils.getSession().getAttribute("lang"));
			if ("null".equals(langContext) || langContext == null
					|| langKey.startsWith("?")) {
				langContext = "";
			}
			langContext = langContext + langKey;
		}
		return langContext;
	}

	/**
	 * 根据key从语言表取得对应信息，并根据参数通配符进行替换。
	 * 
	 * @param langKey 语言表sys_muti_lang.lang_key
	 * @param langArg 参数通配符，半角逗号分割
	 * @return
	 */
	public static String getLang(String langKey, String langArg) {
		String langContext = StringUtil.getEmptyString();
		if (StringUtil.isEmpty(langArg)) {
			langContext = getLang(langKey);
		} else {
			String[] argArray = langArg.split(",");
			langContext = getLang(langKey);

			for (int i = 0; i < argArray.length; i++) {
				String langKeyArg = argArray[i].trim();
				String langKeyContext = getLang(langKeyArg);
				langContext = StringUtil.replace(langContext, "{" + i + "}",
						langKeyContext);
			}
		}
		return langContext;
	}

	/** 刷新多语言cach **/
	public static void refleshMutiLangCach() {
		SysMutiLang.mutiLangMap.clear();
		initAllMutiLang();
	}
}
