/**
 * Copyright &copy; 2014-2016 <a href="https://github.com/jeffencheung/jeesite">Pactera-JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.common.persistence.multiple;

/**
 * 多数据源切换开关
 * 
 * @author Jeffen
 * @version 2015-10-22
 */
public class DataSourceSwitch {

	private static final ThreadLocal contextHolder = new ThreadLocal();

	public static void setDataSourceType(String dataSourceType) {
		contextHolder.set(dataSourceType);
	}

	public static String getDataSourceType() {
		return (String) contextHolder.get();
	}

	public static void clearDataSourceType() {
		contextHolder.remove();
	}
}