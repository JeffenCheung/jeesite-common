/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.common.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.commons.lang3.time.DateFormatUtils;

/**
 * 日期工具类, 继承org.apache.commons.lang.time.DateUtils类
 * 
 * @author ThinkGem
 * @version v1.2.8
 * @date 2016-6-17
 * @since 2016-6-17
 */
public class DateUtils extends org.apache.commons.lang3.time.DateUtils {

	private static String[] parsePatterns = { "yyyy-MM-dd",
			"yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy-MM", "yyyy/MM/dd",
			"yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy/MM", "yyyy.MM.dd",
			"yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm", "yyyy.MM" };

	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd）
	 */
	public static String getDate() {
		return getDate("yyyy-MM-dd");
	}

	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd）
	 */
	public static String getDateTime() {
		return getDate("yyyy-MM-dd");
	}
	
	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String getDate(String pattern) {
		return DateFormatUtils.format(new Date(), pattern);
	}

	/**
	 * 得到日期字符串 默认格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String formatDate(Date date, Object... pattern) {
		String formatDate = null;
		if (pattern != null && pattern.length > 0) {
			formatDate = DateFormatUtils.format(date, pattern[0].toString());
		} else {
			formatDate = DateFormatUtils.format(date, "yyyy-MM-dd");
		}
		return formatDate;
	}

	/**
	 * 得到日期时间字符串，转换格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String formatDateTime(Date date) {
		return formatDate(date, "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 得到当前时间字符串 格式（HH:mm:ss）
	 */
	public static String getTime() {
		return formatDate(new Date(), "HH:mm:ss");
	}

	/**
	 * 得到当前日期和时间字符串 格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String getDateTimeTight() {
		return formatDate(new Date(), FMT_DATE_DATETIME_TIGHT);
	}

	/**
	 * 得到当前年份字符串 格式（yyyy）
	 */
	public static String getYear() {
		return formatDate(new Date(), "yyyy");
	}

	/**
	 * 得到当前月份字符串 格式（MM）
	 */
	public static String getMonth() {
		return formatDate(new Date(), "MM");
	}

	/**
	 * 得到当天字符串 格式（dd）
	 */
	public static String getDay() {
		return formatDate(new Date(), "dd");
	}

	/**
	 * 得到当前星期字符串 格式（E）星期几
	 */
	public static String getWeek() {
		return formatDate(new Date(), "E");
	}

	/**
	 * 日期型字符串转化为日期 格式 { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm",
	 * "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy.MM.dd",
	 * "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm" }
	 */
	public static Date parseDate(Object str) {
		if (str == null) {
			return null;
		}
		try {
			return parseDate(str.toString(), parsePatterns);
		} catch (ParseException e) {
			return null;
		}
	}

	/**
	 * 获取过去的天数
	 * 
	 * @param date
	 * @return
	 */
	public static long pastDays(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (24 * 60 * 60 * 1000);
	}

	/**
	 * 获取过去的小时
	 * 
	 * @param date
	 * @return
	 */
	public static long pastHour(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (60 * 60 * 1000);
	}

	/**
	 * 获取过去的分钟
	 * 
	 * @param date
	 * @return
	 */
	public static long pastMinutes(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (60 * 1000);
	}

	/**
	 * 转换为时间（天,时:分:秒.毫秒）
	 * 
	 * @param timeMillis
	 * @return
	 */
	public static String formatDateTime(long timeMillis) {
		long day = timeMillis / (24 * 60 * 60 * 1000);
		long hour = (timeMillis / (60 * 60 * 1000) - day * 24);
		long min = ((timeMillis / (60 * 1000)) - day * 24 * 60 - hour * 60);
		long s = (timeMillis / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		long sss = (timeMillis - day * 24 * 60 * 60 * 1000 - hour * 60 * 60
				* 1000 - min * 60 * 1000 - s * 1000);
		return (day > 0 ? day + "," : "") + hour + ":" + min + ":" + s + "."
				+ sss;
	}

	/**
	 * 获取两个日期之间的天数
	 * 
	 * @param before
	 * @param after
	 * @return
	 */
	public static double getDistanceOfTwoDate(Date before, Date after) {
		long beforeTime = before.getTime();
		long afterTime = after.getTime();
		return (afterTime - beforeTime) / (1000 * 60 * 60 * 24);
	}

	/**
	 * @param args
	 * @throws ParseException
	 */
	public static void main(String[] args) throws ParseException {
		System.out.println(formatDate(parseDate("2010/3/6")));
		System.out.println(getDate("yyyy年MM月dd日 E"));
		long time = new Date().getTime() - parseDate("2012-11-19").getTime();
		System.out.println(time / (24 * 60 * 60 * 1000));
		getMonsByDate("2008-01-01");
		String[] a = get2DateBetweenMonths("2007-11", "2009-12");
		for (int i = 0; i < a.length; i++) {
			System.out.println(a[i]);
		}
		System.out.println(isDateBefore("2009-08-30", "2009-08-30"));
		String ctime = addDate(new Date(), 1);
		System.out.println(getFirstDayOfWeek());
		System.out.println(getChineseDate(new Date()));
		System.out.println(isDateBefore("2016-01-27 12:12:12"));//false
		System.out.println(isDateBefore("2016-01-29 12:12:12"));//true
	}

	public static String formatDate(Date date, String strExpression) {
		SimpleDateFormat sdfDate = new SimpleDateFormat(strExpression);
		return sdfDate.format(date);
	}

	public static Date getDateYMD(String strDate) {
		SimpleDateFormat sdfDate = new SimpleDateFormat(FMT_DATE_YYYY_MM_DD);
		Date date = null;
		try {
			date = sdfDate.parse(strDate);
		} catch (Exception e) {
			date = null;
		}
		return date;
	}

	public static String getChineseDate(Date date) {
		return getChineseDate(formatDate(date, FMT_DATE_YYYY_MM_DD));
	}

	/**
	 * "2015年06月16日"
	 * 
	 * @param strDate
	 * @return
	 */
	public static String getChineseDate(String strDate) {
		if (strDate == null || strDate.length() != 10)
			return "";
		else
			return strDate.substring(0, 4) + "\u5E74" + strDate.substring(5, 7)
					+ "\u6708" + strDate.substring(8, 10) + "\u65E5";
	}

	public static Date getFirstDayOfYear(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(2, 1);
		c.set(5, 1);
		return c.getTime();
	}

	public static Date getLastDayOfYear(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(2, 12);
		c.set(5, 31);
		return c.getTime();
	}

	public static Date getFirstDayOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(5, 1);
		return c.getTime();
	}

	public static Date getLastDayOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(2, c.get(2) + 1);
		c.set(5, 1);
		c.add(5, -1);
		return c.getTime();
	}

	public static Date getFirstDayOfWeek(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(7, 1);
		return c.getTime();
	}

	public static Date getLastDayOfWeek(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(7, 7);
		return c.getTime();
	}

	/**
	 * 得到上一年的1月1号
	 * 
	 * @param str
	 * @return String
	 * @throws Exception
	 */
	static public String getPreviousYearStart() {
		return ""
				+ (Long.valueOf(getSystemDate(FMT_DATE_YYYY)).longValue() - 1)
				+ "-01-01";
	}

	/**
	 * 得到上一年的年末
	 * 
	 * @return String
	 */
	static public String getPreviousYearEnd() {
		return ""
				+ (Long.valueOf(getSystemDate(FMT_DATE_YYYY)).longValue() - 1)
				+ "-12-31";
	}

	/**
	 * 得到上 N 个月.
	 * 
	 * @author weiliao
	 * @param String
	 *            如 200402
	 * @param int 如 3
	 * @return String 得到如 200311
	 */
	static public String getPreviousAppointMonth(String strThisMonth,
			int lAppointMonth) {
		String strYear = "";
		String strMonth = "";
		long lYear = 0;
		long lMonth = 0;
		String strReturn = "";
		try {
			if (!"".equals(strThisMonth)) {
				// 转换之前的 year 和 month
				strYear = strThisMonth.substring(0, 4);
				strMonth = strThisMonth.substring(4, 6);
				lYear = Long.valueOf(strYear).longValue();
				lMonth = Long.valueOf(strMonth).longValue();
				// 转换中的
				lMonth = lMonth - lAppointMonth;
				while (lMonth <= 0) {
					lMonth = lMonth + 12;
					lYear = lYear - 1;
				}
				// 转换后的
				if (lMonth < 10) {
					strMonth = "0" + lMonth;
				} else {
					strMonth = String.valueOf(lMonth);
				}
				strReturn = String.valueOf(lYear) + strMonth;
			}
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return strReturn;
	}

	/**
	 * 得到上一个月.
	 * 
	 * @author weiliao
	 * @param String
	 *            如 200401
	 * @return String 得到如 200312
	 */
	static public String getPreviousMonth(String strThisMonth) {
		String strYear = "";
		String strMonth = "";
		String strReturn = "";
		try {
			if (!"".equals(strThisMonth)) {
				strYear = strThisMonth.substring(0, 4);
				strMonth = strThisMonth.substring(4, 6);
				// strReturn = strYear + strMonth;
				if ("01".equals(strMonth)) {
					strMonth = "12";
					strYear = String
							.valueOf(Long.valueOf(strYear).longValue() - 1);
				} else {
					strMonth = String.valueOf(Long.valueOf(strMonth)
							.longValue() - 1);
					if (strMonth.length() < 2) {
						strMonth = "0" + strMonth;
					}
				}
			}
			strReturn = strYear + strMonth;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return strReturn;
	}

	/**
	 * 得到去年的１２月份.
	 * 
	 * @author weiliao
	 * @param String
	 *            如 200401
	 * @return String 得到如 200312
	 */
	static public String getPreviousDec(String strThisMonth) {
		return (Long.parseLong(strThisMonth.substring(0, 4)) - 1) + "12";
	}

	/**
	 * 得到上一个月.
	 * 
	 * @param strThisMonth
	 *            formated as YYYY-MM
	 * @return String formated as YYYY-MM
	 */
	static public String getPreviousMonth1(String strThisMonth) {
		String strYear = "";
		String strMonth = "";
		String strReturn = "";
		try {
			if (!"".equals(strThisMonth)) {
				strYear = strThisMonth.substring(0, 4);
				strMonth = strThisMonth.substring(5, 7);
				if ("01".equals(strMonth)) {
					strMonth = "12";
					strYear = String
							.valueOf(Long.valueOf(strYear).longValue() - 1);
				} else {
					strMonth = String.valueOf(Long.valueOf(strMonth)
							.longValue() - 1);
					if (strMonth.length() < 2) {
						strMonth = "0" + strMonth;
					}
				}
			}
			strReturn = strYear + "-" + strMonth;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return strReturn;
	}

	/**
	 * 下一个月
	 * 
	 * @param strThisMonth
	 * @return String
	 */
	static public String getNextMonth(String strThisMonth) {
		String strYear = "";
		String strMonth = "";
		String strReturn = "";
		try {
			if (!"".equals(strThisMonth)) {
				strYear = strThisMonth.substring(0, 4);
				strMonth = strThisMonth.substring(5, 7);
				// strReturn = strYear + strMonth;
				if ("12".equals(strMonth)) {
					strMonth = "01";
					strYear = String
							.valueOf(Long.valueOf(strYear).longValue() + 1);
				} else {
					strMonth = String.valueOf(Long.valueOf(strMonth)
							.longValue() + 1);
					if (strMonth.length() < 2) {
						strMonth = "0" + strMonth;
					}
				}
			}
			strReturn = strYear + "-" + strMonth;
			// System.out.println( strYear + strMonth );
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return strReturn;
	}

	/**
	 * 得到去年的同一个月.
	 * 
	 * @author weiliao
	 * @param String
	 *            如 200401
	 * @return String 得到如 200301
	 */
	static public String getLastyearMonth(String strThisMonth) {
		String strYear = "";
		String strMonth = "";
		String strReturn = "";
		try {
			if (!"".equals(strThisMonth)) {
				strYear = strThisMonth.substring(0, 4);
				strMonth = strThisMonth.substring(4, 6);
				strYear = String.valueOf(Long.valueOf(strYear).longValue() - 1);
			}
			strReturn = strYear + strMonth;
			// System.out.println( strYear + strMonth );
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return strReturn;
	}

	/**
	 * 计算某日期的前后的日期
	 * 
	 * @param strDate
	 * @param days
	 * @return
	 * @throws ParseException
	 */
	public static String addDate(String strDate, int days)
			throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat(FMT_DATE_YYYY_MM_DD);
		Date cDate = df.parse(strDate);
		GregorianCalendar gcalendar = new GregorianCalendar();
		gcalendar.setTime(cDate);
		gcalendar.add(Calendar.DATE, days);
		// System.out.print(df.format(gcalendar.getTime()));
		return df.format(gcalendar.getTime()).toString();
	}

	/**
	 * 计算某日期的前后的日期
	 * 
	 * @param strDate
	 * @param days
	 * @return
	 * @throws ParseException
	 */
	public static String addDate(Date date, int days) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat(FMT_DATE_YYYY_MM_DD);
		GregorianCalendar gcalendar = new GregorianCalendar();
		gcalendar.setTime(date);
		gcalendar.add(Calendar.DATE, days);
		// System.out.print(df.format(gcalendar.getTime()));
		return df.format(gcalendar.getTime()).toString();
	}

	/**
	 * 计算某日期的前后的时间
	 * 
	 * @param strDate
	 * @param days
	 * @return
	 * @throws ParseException
	 */
	public static String addDatetime(Date date, int days) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		GregorianCalendar gcalendar = new GregorianCalendar();
		gcalendar.setTime(date);
		gcalendar.add(Calendar.DATE, days);
		// System.out.print(df.format(gcalendar.getTime()));
		return df.format(gcalendar.getTime()).toString();
	}

	/**
	 * 计算某日期的前后的日期
	 * 
	 * @param strDate
	 * @param days
	 * @return
	 * @throws ParseException
	 */
	public static String addmonth(Date date) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
		GregorianCalendar gcalendar = new GregorianCalendar();
		gcalendar.setTime(date);
		gcalendar.add(Calendar.DATE, 0);
		// System.out.print(df.format(gcalendar.getTime()));
		return df.format(gcalendar.getTime()).toString();
	}

	public static boolean checkTime(String d, String h) {
		String[] a = h.split(":");
		long hh = Long.parseLong(a[0]);
		String m = a[1];
		String time = "";
		if (hh > 4) {
			hh = hh - 5;
			time = d + " " + hh + ":" + m + ":00";
		} else {
			hh = hh + 19;
			// 得到前一天
			time = getPreviousDate(d) + " " + hh + ":" + m + ":00";
		}
		System.out.println(time);
		return isDateBefore(time);
	}

	/**
	 * 得到前一天
	 * 
	 * @param strDate
	 *            日期format as YYYY-MM-DD
	 */
	static public String getPreviousDate(String strDate) {
		String strReturn = "";
		if (strDate != null && !strDate.equals("")) {
			String strYear = strDate.substring(0, 4);
			String strMonth = strDate.substring(5, 7);
			String strDay = strDate.substring(8, 10);
			java.util.Calendar calendar = Calendar.getInstance();
			calendar.set(Integer.parseInt(strYear, 10),
					Integer.parseInt(strMonth, 10) - 1,
					Integer.parseInt(strDay, 10) - 1);
			strReturn = new SimpleDateFormat(FMT_DATE_YYYY_MM_DD)
					.format(calendar.getTime());
		}
		return strReturn;
	}

	/**
	 * 
	 * 判断当前时间是否在时间date之后
	 * 时间格式 2005-04-21 16:16:34
	 * @param date 如空则返回false;如果现在时刻之前返回true,
	 * @return
	 */
	public static boolean isDateAfter(Date date) {
		return !isDateBefore(date);
	}

	/**
	 * 判断当前时间是否在时间date之前
	 * 时间格式 2005-04-21 16:16:34
	 * @param date 如空则返回true;如果现在时刻之后返回true
	 * @return
	 */
	public static boolean isDateBefore(Date date) {
		if (date == null) return true;
		return isDateBefore(formatDate(date, FMT_DATE_DATETIME));
	}

	// 判断当前时间是否在时间date2之前
	// 时间格式 2005-04-21 16:16:34
	public static boolean isDateBefore(String date2) {
		try {
			if (date2.length() < 11) {
				date2 = date2 + " 00:00:00";
			}
			Date date1 = new Date();
			DateFormat df = DateFormat.getDateTimeInstance();
			return date1.before(df.parse(date2));
		} catch (ParseException e) {
			System.out.print("[SYS] " + e.getMessage());
			return false;
		}
	}

	public static boolean isDateBefore(String date1, String date2) {
		try {
			if (date1.length() < 11) {
				date1 = date1 + " 00:00:00";
			}
			if (date2.length() < 11) {
				date2 = date2 + " 00:00:00";
			}
			DateFormat df = DateFormat.getDateTimeInstance();
			return df.parse(date1).before(df.parse(date2));
		} catch (ParseException e) {
			System.out.print("[SYS] " + e.getMessage());
			return false;
		}
	}

	public static Date addTime(Date date, int year, int month, int day, int week) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(1, year);
		c.add(2, month);
		c.add(5, day);
		c.add(3, week);
		return c.getTime();
	}

	public static String nextMonthFirstDay(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-d");
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(c.MONTH, 1);
		c.set(c.DATE, 1);
		return sdf.format(c.getTime());
	}

	public static String backMonthFirstDay(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(FMT_DATE_YYYY_MM_DD);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(c.MONTH, -1);
		// c.set(c.DATE, 1);
		return sdf.format(c.getTime());
	}

	public static Date getSystemDate() {
		Calendar c = Calendar.getInstance();
		return c.getTime();
	}

	public static String getSystemDate(String strExpression) {
		return formatDate(getSystemDate(), strExpression);
	}

	/**
	 * "2015-06-16"
	 * 
	 * @param strExpression
	 * @return
	 */
	public static String getSystemDateDefault() {
		return getSystemDate(FMT_DATE_YYYY_MM_DD);
	}

	/**
	 * "2015-06-16"
	 * 
	 * @return
	 */
	public static Date getCurrentYMD() {

		SimpleDateFormat df = new SimpleDateFormat(FMT_DATE_YYYY_MM_DD);
		try {
			return df.parse(getSystemDateDefault());
		} catch (ParseException e) {
			e.printStackTrace();
			return new Date();
		}
	}

	public static String getSystemTime(String strTime) {
		return getSystemDate(strTime);
	}

	public static int getDateCompare(Date startDate, Date endDate) {
		int compareValue = -2;
		try {
			double diffMilliSeconds = endDate.getTime() - startDate.getTime();
			if (diffMilliSeconds > 0) {
				compareValue = 1;
			} else if (diffMilliSeconds == 0) {
				compareValue = 0;
			} else if (diffMilliSeconds < 0) {
				compareValue = -1;
			}
		} catch (Exception ex) {
		}

		return compareValue;
	}

	// startDate,endDate格式为2009-01
	public static String[] get2DateBetweenMonths(String startDate,
			String endDate) {
		String startDates[] = startDate.split("-");
		String endDates[] = endDate.split("-");
		int yearStart = Integer.parseInt(startDates[0]);
		int monthStart = Integer.parseInt(startDates[1]);
		int yearEnd = Integer.parseInt(endDates[0]);
		int monthEnd = Integer.parseInt(endDates[1]);
		int months = (yearEnd - yearStart) * 12 + (monthEnd - monthStart);
		if (months == 0) {
			return new String[] { startDate };
		}
		if (months < 0) {
			months = -months;
			int tempYear = yearStart;
			yearStart = yearEnd;
			yearEnd = tempYear;
			int tempMonth = monthStart;
			monthStart = monthEnd;
			monthEnd = tempMonth;
		}
		String[] dates = new String[months + 1];
		int n = 0;
		int m = 0;
		for (int i = yearStart * 12 + monthStart; i <= yearEnd * 12 + monthEnd; i++) {
			m = i % 12;
			if (m == 0) {
				dates[n] = ((i / 12) - 1) + "-" + 12;
			} else {
				if (i % 12 < 10) {
					dates[n] = (i / 12) + "-0" + (m);
				} else {
					dates[n] = (i / 12) + "-" + (m);
				}
			}
			n++;

		}

		return dates;

	}

	// 取出月份数组
	public static String[] getMonsByDate(String dateStr) throws ParseException {

		String[] lookDates = new String[12];
		SimpleDateFormat sf = new SimpleDateFormat(FMT_DATE_YYYY_MM_DD);
		SimpleDateFormat sf2 = new SimpleDateFormat("MM");
		Date d = sf.parse(dateStr);
		for (int i = -11; i <= 0; i++) {
			GregorianCalendar gc = new GregorianCalendar();
			gc.setTime(d);
			gc.add(2, i);
			gc.set(gc.get(Calendar.YEAR), gc.get(Calendar.MONTH),
					gc.get(Calendar.DATE));
			lookDates[11 + i] = sf2.format(gc.getTime());
		}

		return lookDates;
	}

	public static String getFirstDayOfWeek() {
		SimpleDateFormat sf = new SimpleDateFormat(FMT_DATE_YYYY_MM_DD);
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.set(Calendar.DAY_OF_WEEK_IN_MONTH, c.getFirstDayOfWeek());
		return sf.format(c.getTime());
	}

	public static String changeToWeek(String week) {

		String strWeek = "";
		switch (Integer.parseInt(week)) {
		case 1:
			strWeek = "一";
			break;
		case 2:
			strWeek = "二";
			break;
		case 3:
			strWeek = "三";
			break;
		case 4:
			strWeek = "四";
			break;
		case 5:
			strWeek = "五";
			break;
		case 6:
			strWeek = "六";
			break;
		case 7:
			strWeek = "日";
			break;

		}
		return strWeek;
	}

	public static final String FMT_DATE_YYYY = "yyyy";

	public static final String FMT_DATE_YYMMDD = "yyMMdd";

	public static final String FMT_DATE_YYYYMMDD = "yyyyMMdd";

	public static final String FMT_DATE_YYYY_MM_DD = "yyyy-MM-dd";

	public static final String FMT_DATE_DATETIME = "yyyy-MM-dd HH:mm:ss";

	public static final String FMT_DATE_DATETIME2 = "yyyy-MM-dd HH:mm";

	public static final String FMT_DATE_DATETIME_TIGHT = "yyyyMMddHHmmss";

	public static final String FMT_DATE_YY_MM = "yy-MM";

	public static final String FMT_DATE_MM = "MM";

	public static final String FMT_DATE_DD = "dd";

	public static final String FMT_DATE_TIME = "HH:mm:ss";
}
