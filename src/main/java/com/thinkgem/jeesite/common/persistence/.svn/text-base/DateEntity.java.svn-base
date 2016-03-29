/**
 * Copyright &copy; 2014-2016 <a href="https://github.com/jeffencheung/jeesite">Pactera-JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.common.persistence;

import java.util.Date;

import com.thinkgem.jeesite.common.utils.DateUtils;

/**
 * 日期Entity类
 * 
 * @author Jeffen
 * @version 2015-06-13
 */
public abstract class DateEntity<T> extends DataEntity<T> {

	private static final long serialVersionUID = 1L;
	private Date beginDate; // 开始日期
	private Date endDate; // 结束日期

	public DateEntity() {
		super();
	}

	public DateEntity(String id) {
		super(id);
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	/**
	 * 设置默认时间范围，默认当前月
	 * 
	 * @author Jeffen
	 * @since v1.2.8
	 * @date 2015-6-13
	 * @param entity
	 * @return
	 */
	public void setDateIntervalDefaultThisMonth() {
		if (this.getBeginDate() == null) {
			this.setBeginDate(DateUtils.setDays(
					DateUtils.parseDate(DateUtils.getDate()), 1));
		}
		if (this.getEndDate() == null) {
			this.setEndDate(DateUtils.addMonths(this.getBeginDate(), 1));
		}
	}
}
