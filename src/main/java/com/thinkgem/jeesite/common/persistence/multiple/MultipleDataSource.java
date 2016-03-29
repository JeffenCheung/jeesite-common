/**
 * Copyright &copy; 2014-2016 <a href="https://github.com/jeffencheung/jeesite">Pactera-JeeSite</a> All rights reserved.
 */

package com.thinkgem.jeesite.common.persistence.multiple;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;


/**
 * 多数据源路由器
 * 
 * @author Jeffen
 * @version 2015-10-22
 */
public class MultipleDataSource extends AbstractRoutingDataSource {

	@Override
	protected Object determineCurrentLookupKey() {
		// TODO Auto-generated method stub
		return DataSourceSwitch.getDataSourceType();
	}

}
