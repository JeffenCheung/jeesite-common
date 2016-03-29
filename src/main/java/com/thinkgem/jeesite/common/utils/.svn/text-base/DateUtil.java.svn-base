package com.thinkgem.jeesite.common.utils;
import java.sql.Time;
import java.sql.Timestamp;

import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

/**
 * This class is used to convert Dates to ISO 8601 formatted dates and back.
 *
 * This class is an implementation of the ISO 8601 International Date Format standard.
 * The ISO 8601 helps to alleviate the following problem:
 *
 * <p>Ever been to a webpage to see that the time-sensitive information you are interested
 * in is dated 03/05/01?</p>
 * <p>Is this date the 3rd of May 2001 or the 5th of March 2001 or the 1st of May 2003 and
 * does the 01 refer to 2001 in the first two cases?</p>
 * <p>In order to make the right choice, you must ask yourself some questions :</p>
 * <ul>
 *         <li>Where is the website you are visiting based?</li>
 *         <li>Is the website in a country which supports the U.S.A. style date format
 *     (mm/dd/yy) or the European style (dd/mm/yy)?</li>
 *         <li>Which countries do officially use the U.S.A. style date format? Is there an official list?</li>
 *         <li>Is the page author :
 *             <ul style="square">
 *                <li>American?</li>
 *                <li>European?</li>
 *                <li>Japanese?</li>
 *                <li>someone who thinks or wishes he/she was one of these nationalities?</li>
 *                <li>one of these nationalities living in a foreign country?</li>
 *                <li>someone using a particular format because they think it is a world standard?</li>
 *                <li>confused, and has got the numeric fields in an order different to what they intended?</li>
 *             </ul>
 *         </li>
 * </ul>
 * <b>Which one is it?</b> It could be very important to you.
 *
 * <p>The Internet is a truly International method of communicating - there are no political or cultural
 * boundaries drawn on the www page you call up - the page could have been stored in the Smithsonian
 * Institute or on a small server in a basement in Ulan Bator, Mongolia. Often, you have no way of telling.
 * So, if anyone in the world can read your page, why not ensure that any date references on that page can
 * be read correctly and unambiguously by that person, by using the ISO 8601:1988 International Date Format?</p>
 *
 * <p>The basic format is: <b><i>"CCYYMMDDThhmmsssss&plusmn;nnn"</i></b></p>
 *
 * <table border="1"><tr><th colspan="2">Characters used in place of digits or signs</th></tr>
 * <tr><td nowrap="nowrap">&nbsp;[Y]&nbsp;</td><td>&nbsp;represents a digit used in the time element <b>year</b></td></tr>
 * <tr><td>&nbsp;[M]&nbsp;</td><td>&nbsp;represents a digit used in the time element <b>month</b></td></tr>
 * <tr><td>&nbsp;[D]&nbsp;</td><td>&nbsp;represents a digit used in the time element <b>day</b></td></tr>
 * <tr><td>&nbsp;[T]&nbsp;</td><td>&nbsp;place holder denoting time</td></tr>
 * <tr><td>&nbsp;[h]&nbsp;</td><td>&nbsp;represents a digit used in the time element <b>hour</b></td></tr>
 * <tr><td>&nbsp;[m]&nbsp;</td><td>&nbsp;represents a digit used in the time element <b>minute</b></td></tr>
 * <tr><td>&nbsp;[s]&nbsp;</td><td>&nbsp;represents a digit used in the time element <b>second</b></td></tr>
 * <tr><td>&nbsp;[n]&nbsp;</td><td>&nbsp;represents digit(s), constituting a positive integer or zero</td></tr>
 * <tr><td>&nbsp;[&plusmn;]&nbsp;</td><td>&nbsp;represents a plus sign [+] if in combination with the following
 *  element a positive value or zero needs to be represented, or a minus sign [&shy;] if in combination with the
 * following element a negative value needs to be represented.</td></tr>
 * </table>
 *
 * <p>The expanded format includes formating: <b><i>"CCYY-MM-DDThh:mm:ss,sss&plusmn;nnn"</i></b></p>
 *
 * <p>Further there are some date math functions for ISO Dates.</p>
 *
 * <h2>Other Functions</h2>
 * <p> funtions for julian dates </p>
 *
 * @author <a href="mailto:snowwolf@wabunoh.com">SnowWolf Wagner</a>
 * @author <a href="mailto:joeo@enigmastation.com">Joseph B. Ottinger</a>
 * @version $Revision: 1.1 $
 */
public class DateUtil {

    /**
     * Base ISO 8601 Date format yyyyMMdd i.e., 20021225 for the 25th day of December in the year 2002
     */
    public static final String ISO_DATE_FORMAT = "yyyyMMdd";

    /**
     * Expanded ISO 8601 Date format yyyy-MM-dd i.e., 2002-12-25 for the 25th day of December in the year 2002
     */
    public static final String ISO_EXPANDED_DATE_FORMAT = "yyyy-MM-dd";

    /**
     * Basic ISO 8601 Time format HHmmssSSSzzz i.e., 143212333-500 for 2 pm 32 min 12 secs 333 mills -5 hours from GMT
     * 24 hour clock
     */
    public static final String ISO_TIME_FORMAT = "HHmmssSSSzzz";

    /**
     * Basic ISO 8601 Time format HH:mm:ss,SSSzzz i.e., 14:32:12,333-500 for 2 pm 32 min 12 secs 333 mills -5 hours from GMT
     * 24 hour clock
     */
    public static final String ISO_EXPANDED_TIME_FORMAT = "HH:mm:ss,SSSzzz";

    /**
     * Base ISO 8601 Date format yyyyMMddTHHmmssSSSzzz i.e., 20021225T143212333-500 for
     * the 25th day of December in the year 2002 at 2 pm 32 min 12 secs 333 mills -5 hours from GMT
     */
    public static final String ISO_DATE_TIME_FORMAT = "yyyyMMdd'T'HHmmssSSSzzz";

    /**
     * Base ISO 8601 Date format yyyy-MM-ddTHH:mm:ss,SSSzzz i.e., 2002-12-25T14:32:12,333-500 for
     * the 25th day of December in the year 2002 at 2 pm 32 min 12 secs 333 mills -5 hours from GMT
     */
    public static final String ISO_EXPANDED_DATE_TIME_FORMAT =
        "yyyy-MM-dd'T'HH:mm:ss,SSSzzz";

    public static final DateFormatSymbols dateFormatSymbles;

    private static final String[][] foo;

    static {

        // override the timezone strings
        foo = new String[0][];
        dateFormatSymbles = new DateFormatSymbols();
        dateFormatSymbles.setZoneStrings(foo);
    }

    protected static final float normalizedJulian(float JD) {

        float f = Math.round(JD + 0.5f) - 0.5f;

        return f;
    }

    /**
         * Returns the Date from a julian. The Julian date will be converted to noon GMT,
         * such that it matches the nearest half-integer (i.e., a julian date of 1.4 gets
     * changed to 1.5, and 0.9 gets changed to 0.5.)
     *
     * @param JD the Julian date
     * @return the Gregorian date
     */
    public static final Date toDate(float JD) {

        /* To convert a Julian Day Number to a Gregorian date, assume that it is for 0 hours, Greenwich time (so
         * that it ends in 0.5). Do the following calculations, again dropping the fractional part of all
         * multiplicatons and divisions. Note: This method will not give dates accurately on the
         * Gregorian Proleptic Calendar, i.e., the calendar you get by extending the Gregorian
             * calendar backwards to years earlier than 1582. using the Gregorian leap year
         * rules. In particular, the method fails if Y<400. */
        float Z = (normalizedJulian(JD)) + 0.5f;
        float W = (int) ( (Z - 1867216.25f) / 36524.25f);
        float X = (int) (W / 4f);
        float A = Z + 1 + W - X;
        float B = A + 1524;
        float C = (int) ( (B - 122.1) / 365.25);
        float D = (int) (365.25f * C);
        float E = (int) ( (B - D) / 30.6001);
        float F = (int) (30.6001f * E);
        int day = (int) (B - D - F);
        int month = (int) (E - 1);

        if (month > 12) {
            month = month - 12;
        }

        int year = (int) (C - 4715); //(if Month is January or February) or C-4716 (otherwise)

        if (month > 2) {
            year--;
        }

        Calendar c = Calendar.getInstance();
        c.set(Calendar.YEAR, year);
        c.set(Calendar.MONTH, month - 1); // damn 0 offsets
        c.set(Calendar.DATE, day);

        return c.getTime();
    }

    /**
     * Returns the days between two dates. Positive values indicate that
     * the second date is after the first, and negative values indicate, well,
     * the opposite. Relying on specific times is problematic.
     *
     * @param early the "first date"
     * @param late the "second date"
     * @return the days between the two dates
     */
    public static final int daysBetween(Date early, Date late) {

        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        c1.setTime(early);
        c2.setTime(late);

        return daysBetween(c1, c2);
    }

    /**
     * Returns the days between two dates. Positive values indicate that
     * the second date is after the first, and negative values indicate, well,
     * the opposite.
     *
     * @param early
     * @param late
     * @return the days between two dates.
     */
    public static final int daysBetween(Calendar early, Calendar late) {

        return (int) (toJulian(late) - toJulian(early));
    }

    /**
     * Return a Julian date based on the input parameter. This is
     * based from calculations found at
     * <a href="http://quasar.as.utexas.edu/BillInfo/JulianDatesG.html">Julian Day Calculations
     * (Gregorian Calendar)</a>, provided by Bill Jeffrys.
     * @param c a calendar instance
     * @return the julian day number
     */
    public static final float toJulian(Calendar c) {

        int Y = c.get(Calendar.YEAR);
        int M = c.get(Calendar.MONTH);
        int D = c.get(Calendar.DATE);
        int A = Y / 100;
        int B = A / 4;
        int C = 2 - A + B;
        float E = (int) (365.25f * (Y + 4716));
        float F = (int) (30.6001f * (M + 1));
        float JD = C + D + E + F - 1524.5f;

        return JD;
    }

    /**
     * Return a Julian date based on the input parameter. This is
     * based from calculations found at
     * <a href="http://quasar.as.utexas.edu/BillInfo/JulianDatesG.html">Julian Day Calculations
     * (Gregorian Calendar)</a>, provided by Bill Jeffrys.
     * @param date
     * @return the julian day number
     */
    public static final float toJulian(Date date) {

        Calendar c = Calendar.getInstance();
        c.setTime(date);

        return toJulian(c);
    }
    
    /**
     * Return an ISO date string as a java.util.Date
     *
     *
     * @param dateString
     * @param expanded use formating charaters
     * @return
     * @throws java.text.ParseException
     */
    public static final Date isoToDate(String dateString, boolean expanded) throws
        ParseException {

        SimpleDateFormat formatter;

        if (expanded) {
            formatter = new SimpleDateFormat(ISO_EXPANDED_DATE_FORMAT,
                                             dateFormatSymbles);
        }
        else {
            formatter = new SimpleDateFormat(ISO_DATE_FORMAT,
                                             dateFormatSymbles);

        }
        return new Date(formatter.parse(dateString).getTime());
    }

    /**
     * Return an ISO date string as a java.sql.Date
     *
     * @param dateString
     * @param expanded    expanded use formating charaters
     * @return
     * @throws java.text.ParseException
     */
    public static final java.sql.Date isoToSQLDate(String dateString,
        boolean expanded) throws ParseException {

        SimpleDateFormat formatter;

        if (expanded) {
            formatter = new SimpleDateFormat(ISO_EXPANDED_DATE_FORMAT,
                                             dateFormatSymbles);
        }
        else {
            formatter = new SimpleDateFormat(ISO_DATE_FORMAT,
                                             dateFormatSymbles);

        }
        return new java.sql.Date(formatter.parse(dateString).getTime());
    }

    /**
     * Return an ISO date string
     *
     * @param date
     * @param expanded use formating char's
     * @return
     */
    public static final String dateToISO(Date date, boolean expanded) {

        SimpleDateFormat formatter;

        if (expanded) {
            formatter = new SimpleDateFormat(ISO_EXPANDED_DATE_FORMAT,
                                             dateFormatSymbles);
        }
        else {
            formatter = new SimpleDateFormat(ISO_DATE_FORMAT,
                                             dateFormatSymbles);

        }
        return formatter.format(date);
    }

    /**
     *
     * @param expanded expanded use formating charaters
     * @param dateString
     * @return
     * @throws java.text.ParseException
     */
    public static final Time isoToTime(String dateString, boolean expanded) throws
        ParseException {

        SimpleDateFormat formatter;

        if (expanded) {
            formatter = new SimpleDateFormat(ISO_EXPANDED_TIME_FORMAT,
                                             dateFormatSymbles);
        }
        else {
            formatter = new SimpleDateFormat(ISO_TIME_FORMAT,
                                             dateFormatSymbles);

        }
        return new Time(formatter.parse(dateString).getTime());
    }

    /**
     *
     * @param expanded expanded use formating charaters
     * @param date
     * @return
     */
    public static final String timeToISO(Time date, boolean expanded) {

        SimpleDateFormat formatter;

        if (expanded) {
            formatter = new SimpleDateFormat(ISO_EXPANDED_TIME_FORMAT,
                                             dateFormatSymbles);
        }
        else {
            formatter = new SimpleDateFormat(ISO_TIME_FORMAT,
                                             dateFormatSymbles);

        }
        return formatter.format(date);
    }

    /**
     *
     * @param expanded expanded use formating charaters
     * @param dateString
     * @return
     * @throws java.text.ParseException
     */
    public static final Timestamp isoToTimestamp(String dateString,
                                                 boolean expanded) throws
        ParseException {

        SimpleDateFormat formatter;

        if (expanded) {
            formatter = new SimpleDateFormat(ISO_EXPANDED_DATE_TIME_FORMAT,
                                             dateFormatSymbles);
        }
        else {
            formatter = new SimpleDateFormat(ISO_DATE_TIME_FORMAT,
                                             dateFormatSymbles);

        }
        return new Timestamp(formatter.parse(dateString).getTime());
    }

    /**
     *
     * @param expanded expanded use formating charaters
     * @param date
     * @return
     */
    public static final String timestampToISO(Timestamp date, boolean expanded) {

        SimpleDateFormat formatter;

        if (expanded) {
            formatter = new SimpleDateFormat(ISO_EXPANDED_DATE_TIME_FORMAT,
                                             dateFormatSymbles);
        }
        else {
            formatter = new SimpleDateFormat(ISO_DATE_TIME_FORMAT,
                                             dateFormatSymbles);

        }
        return formatter.format(date);
    }

    public static final String timestampToString(Timestamp date, String format) {
        if (format != null) {
            SimpleDateFormat formatter;
            formatter = new SimpleDateFormat(format,
                                             dateFormatSymbles);
            return formatter.format(date);
        }
        else {
            return timestampToISO(date, true);
        }
    }

    /**
     * non-expanded
     *
     * @param dateString
     * @return
     * @throws ParseException
     */
    public static final Date isoToDate(String dateString) throws
        ParseException {

        return isoToDate(dateString, false);
    }

    /**
     * non-expanded
     *
     * @param dateString
     * @return
     * @throws ParseException
     */
    public static final java.sql.Date isoToSQLDate(String dateString) throws
        ParseException {

        return isoToSQLDate(dateString, false);
    }

    /**
     * non-expanded
     *
     * @param date
     * @return
     */
    public static final String dateToISO(Date date) {

        return dateToISO(date, false);
    }

    /**
     * non-expanded
     *
     * @param dateString
     * @return
     * @throws java.text.ParseException
     */
    public static final Time isoToTime(String dateString) throws
        ParseException {

        return isoToTime(dateString, false);
    }

    /**
     * non-expanded
     *
     * @param date
     * @return
     */
    public static final String timeToISO(Time date) {

        return timeToISO(date, false);
    }

    /**
     * non-expanded
     *
     * @param dateString
     * @return
     * @throws java.text.ParseException
     */
    public static final Timestamp isoToTimestamp(String dateString) throws
        ParseException {

        return isoToTimestamp(dateString, false);
    }

    /**
     * non-expanded
     *
     * @param date
     * @return
     */
    public static final String timestampToISO(Timestamp date) {

        return timestampToISO(date, false);
    }

    /**
     * Date Arithmetic function.
     * Adds the specified (signed) amount of time to the given time field,
     * based on the GregorianCalendar's rules.
     * @param isoString
     * @param field
     * @param amount
     * @param expanded use formating char's
     * @return ISO 8601 Date String
     * @throws ParseException
     */
    public static final String add(String isoString, int field, int amount,
                                   boolean expanded) throws ParseException {

        Calendar cal = GregorianCalendar.getInstance(TimeZone.getTimeZone(
            "GMT"));
        cal.setTime(isoToDate(isoString, expanded));
        cal.add(field, amount);

        return dateToISO(cal.getTime(), expanded);
    }

    /**
     * Date Arithmetic function.
     * Adds the specified (signed) amount of time to the given time field,
     * based on the GregorianCalendar's rules.
     * no formating char's
     *
     * @param isoString
     * @param field
     * @param amount
     * @return ISO 8601 Date String
     * @throws ParseException
     */
    public static final String add(String isoString, int field, int amount) throws
        ParseException {
        return add(isoString, field, amount, false);
    }

    /**
     * Time Field Rolling function.
     * Rolls (up/down) a single unit of time on the given time field.
     *
     * @param isoString
     * @param field the time field.
     * @param up Indicates if rolling up or rolling down the field value.
     * @param expanded use formating char's
     * @exception ParseException if an unknown field value is given.
     */
    public static final String roll(String isoString, int field, boolean up,
                                    boolean expanded) throws ParseException {

        Calendar cal = GregorianCalendar.getInstance(TimeZone.getTimeZone(
            "GMT"));
        cal.setTime(isoToDate(isoString, expanded));
        cal.roll(field, up);

        return dateToISO(cal.getTime(), expanded);
    }

    /**
     * Time Field Rolling function.
     * Rolls (up/down) a single unit of time on the given time field.
     *
     * @param isoString
     * @param field the time field.
     * @param up Indicates if rolling up or rolling down the field value.
     * @exception ParseException if an unknown field value is given.
     */
    public static final String roll(String isoString, int field, boolean up) throws
        ParseException {

        return roll(isoString, field, up, false);
    }

    /**
     *
     * @param isoString
     * @param expanded
     * @return
     * @throws ParseException
     */
    public static final boolean isLeapYear(String isoString, boolean expanded) throws
        ParseException {

        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(isoToDate(isoString, expanded));

        return cal.isLeapYear(cal.get(Calendar.YEAR));
    }

    public static final boolean isDate(String dateString, String pattern) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat(pattern,
                dateFormatSymbles);
            new Date(formatter.parse(dateString).getTime());
            return true;
        }
        catch (Exception ex) {
            return false;
        }
    }
    public static final boolean isDate(String dateString) {
        return isDate(dateString, "yyyy-MM-dd");
    }


    public static final boolean isTime(String timeString, String pattern){
        return isDate(timeString, pattern);
    }

    public static final boolean isTime(String timeString){
        return isDate(timeString, "HH:mm:ss");
    }

    public static final boolean isDatetime(String datetimeString, String pattern){
        return isDatetime(datetimeString, pattern);
    }
    public static final boolean isDatetime(String datetimeString){
        return isDatetime(datetimeString, "yyyy-MM-dd HH:mm:ss");
    }

    public static final boolean isTimestamp(String timestampString, String pattern){
        return isTimestamp(timestampString, pattern);
    }
    public static final boolean isTimestamp(String timestampString){
        return isDatetime(timestampString, "yyyy-MM-dd HH:mm:ss");
    }

    /**
     *
     * @param isoString
     * @return
     * @throws ParseException
     */
    public static final boolean isLeapYear(String isoString) throws
        ParseException {

        return isLeapYear(isoString, false);
    }

    public static java.sql.Date getSqlDate(String value,
                                           java.sql.Date defaultValue) {

        try {

            return (java.sql.Date.valueOf(value));
        }
        catch (Exception e) {

            return (defaultValue);
        }
    }

    public static java.sql.Time getSqlTime(String value,
                                           java.sql.Time defaultValue) {

        try {

            return (java.sql.Time.valueOf(value));
        }
        catch (Exception e) {

            return (defaultValue);
        }
    }

    public static java.sql.Timestamp getSqlTimestamp(String value,
        java.sql.Timestamp defaultValue) {

        try {

            return (java.sql.Timestamp.valueOf(value));
        }
        catch (Exception e) {

            return (defaultValue);
        }
    }

    /**
     * Default lenient setting for getDate.
     */
    private static boolean LENIENT_DATE = false;

    /**
     * A "default" date format.
     */
    public static String ESCAPE_DATE_PATTERN = "yyyy-MM-dd";

    public static String DATETIME_PATTERN = "yyyy-MM-dd HH:mm:ss";

    /**
     * Convert String to Date using given format.
     * Returns null if conversion fails.
     * Set lenient=false to disallow dates like 2001-9-32.
     * http://java.sun.com/j2se/1.4/docs/api/java/text/SimpleDateFormat.html
     * @author Hal Deadman
     */
    public static Date getDate(String dateText, String format, boolean lenient) {

        if (dateText == null) {

            return null;
        }

        DateFormat df = null;

        try {

            if (format == null) {
                df = new SimpleDateFormat();
            }
            else {
                df = new SimpleDateFormat(format);
            }

            // setLenient avoids allowing dates like 9/32/2001
            // which would otherwise parse to 10/2/2001
            df.setLenient(false);

            return df.parse(dateText);
        }
        catch (ParseException e) {

            return null;
        }
    }

    /**
     * Convert String to Date using given format.
     * Returns null if conversion fails.
     * Uses "strict" coNversion (lenient=false).
     * @author Hal Deadman
     */
    public static Date getDate(String dateString, String format) {

        return getDate(dateString, format, LENIENT_DATE);
    }

    /**
     * Convert String to Date using a medium (weekday day month year) format.
     * Returns null if conversion fails.
     * Uses "strict" coNversion (lenient=false).
     * @author Hal Deadman
     */
    public static Date getDate(String dateString) {
        return getDate(dateString, null, LENIENT_DATE);
    }

    /**
     * Return Date value using a String.
     * Null or conversion error returns null.
     * @param String representing Date
     */
    public static Date toDate(String string) {
        if (string == null) {
            return null;
        }
        else {
            try {
                return getDate(string);
            }
            catch (Throwable t) {
                return null;
            }
        }
    }

    /**
     * Convert date to String for given locale in given style.
     * A null locale will return the default locale.
     */
    public static String getDate(Date date, Locale locale, int style) {
        if (locale == null) {
            return (DateFormat.getDateInstance(style).format(date));
        }
        return (DateFormat.getDateInstance(style, locale).format(date));
    }
    /** 根据时间变量返回时间字符串
     * @return 返回时间字符串
     * @param pattern 时间字符串样式
     * @param date 时间变量
     */
    public static java.sql.Date getDate(Timestamp datetime) {
        String sdate = timestampToString(datetime, ISO_EXPANDED_DATE_FORMAT);
        java.util.Date dd =getDate(sdate, ISO_EXPANDED_DATE_FORMAT, true);
        return (new java.sql.Date(dd.getTime()));
    }

    /**
     * Convert date to String for default locale in given style.
     * A null locale will return the default locale.
     */
    public static String getDate(Date date, int style) {
        return getDate(date, (Locale)null, style);
    }

    /** 根据时间变量返回时间字符串
     * @return 返回时间字符串
     * @param pattern 时间字符串样式
     * @param date 时间变量
     */
    public static String getDate(Date date, String pattern) {
        if (date == null) {
            return null;
        }
        try {
            SimpleDateFormat sfDate = new SimpleDateFormat(pattern);
            sfDate.setLenient(false);
            return sfDate.format(date);
        }
        catch (Exception e) {
            return null;
        }
    }

    /** 返回当前时间字符串
     * @param pattern 时间字符串样式
     * @return 返回当前时间字符串
     */
    public static Date getCurrentDateTime() {
        java.util.Calendar calNow = java.util.Calendar.getInstance();
        java.util.Date dtNow = calNow.getTime();
        return dtNow;
    }


    public static String getCurrentDate(String pattern) {
        return getDate(getCurrentDateTime(), pattern);
    }


    public static java.sql.Date getCurrentSqlDate(boolean expanded) {
        java.sql.Date dt = null;
        try {
            dt = isoToSQLDate(dateToISO(getCurrentDateTime(), expanded),
                              expanded);
        }
        catch (ParseException e) {
        }
        return dt;
    }

    public static java.sql.Date getCurrentSqlDate() {
        return getCurrentSqlDate(true);
    }

    public static java.sql.Date getCurrentSqlDateTime() {
        return new java.sql.Date(new java.util.Date().getTime());
    }

    /**
     * Return String value representing Date.
     * Null returns null.
     * @param <{Date}>
     */
    public static String toString(Date date) {

        if (date == null) {

            return null;
        }
        else {

            return getDate(date);
        }
    }

    /**
     * Return String value representing Date.
     * Null returns null.
     * @param <{Date}>
     */
    public static String getDatetime(Date date) {

        return getDate(date, DATETIME_PATTERN);
    }

    /**
     * Convert date to String for default locale in DEFAULT style.
     * A null locale will return the default locale.
     */
    public static String getDate(Date date) {

        return getDate(date, DATETIME_PATTERN);
    }

    public static Date DateIncrease(Date date, int days) {

        Calendar cal = GregorianCalendar.getInstance(TimeZone.getTimeZone(
            "GMT"));
        cal.setTime(date);
        cal.add(Calendar.DATE, days);

        return cal.getTime();
    }

    public static String DateIncrease(String date, int days, boolean expanded) {

        String ret = null;

        try {
            ret = add(date, Calendar.DATE, days, expanded);
        }
        catch (ParseException e) {
        }

        return ret;
    }

    public static String DateIncrease(String date, int days) {
        return DateIncrease(date, days, true);
    }

    // ---------------------------------------------------------- Timestamp

    /**
     * Escape string to create Timestamp representing
     * "January 1, 1970 00:00:00".
     */
    public static String NULL_TIMESTAMP_TEXT = "1970-01-01 00:00:00";

    /**
     * Value needed to create Timestamp representing
     * "January 1, 1970 00:00:00".
     * From the documentation, you would think this would be
     * Timestamp(0), but empirical tests show it to be
     * Timestamp(18000000).
     */
    public static long NULL_TIME = (long) 18000000;

    /**
     * Timestamp representing "January 1, 1970 00:00:00".
     */
    public static Timestamp NULL_TIMESTAMP = new Timestamp(NULL_TIME);

    /**
     * Return null if timestamp is null or equals
     * "January 1, 1970 00:00:00".
     */
    public static boolean isNull(Timestamp timestamp) {

        return ( (timestamp == null) || (timestamp.getTime() == NULL_TIME));
    }

    /**
     * Factory method to return timestamp initialized to
     * current system time.
     * For timestamp as a String in the default format,
     * use <code>getTimestamp().toString()</code>.
     */
    public static Timestamp getTimestamp() {

        return new Timestamp(System.currentTimeMillis());
    }

    /**
     * 返回当前时间戳
     */
    public static java.sql.Timestamp getCurrentTimetamp() {
        return getTimestamp();
    }

    /**
     * Convert timestamp to String for given locale in given style.
     * A null locale will return the default locale.
     */
    public static String getTimestamp(Timestamp timestamp, Locale locale,
                                      int style) {

        Date date = (Date) timestamp;

        if (locale == null) {

            return (DateFormat.getDateTimeInstance(style, style).format(date));
        }

        return (DateFormat.getDateTimeInstance(style, style, locale).format(
            date));
    }

    /**
     * Convert date to String for default locale in given style.
     * A null locale will return the default locale.
     */
    public static String getTimestamp(Timestamp timestamp, int style) {

        return getTimestamp(timestamp, (Locale)null, style);
    }

    /**
     * Convert date to String for default locale in DEFAULT style.
     * A null locale will return the default locale.
     */
    public static String getTimestamp(Timestamp timestamp) {

        return getTimestamp(timestamp, (Locale)null, DateFormat.DEFAULT);
    }

    /**
     * Return Timestamp value using a String.
     * Null or conversion error returns null.
     * @param String representing Timestamp
     */
    public static Timestamp toTimestamp(String string) {

        if (string == null) {

            return null;
        }
        else {

            try {

                return Timestamp.valueOf(string);
            }
            catch (Throwable t) {

                return null;
            }
        }
    }

    /**
     * Return String value representing Timestamp.
     * Null returns null.
     * @param <{Timestamp}>
     */
    public static String toString(Timestamp timestamp) {

        if (timestamp == null) {

            return null;
        }
        else {

            return timestamp.toString();
        }
    }

    //
    public static String time = "23:45:35.330 china Tue Apr 29 2003";



}