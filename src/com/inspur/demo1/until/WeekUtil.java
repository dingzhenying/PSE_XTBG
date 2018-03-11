package com.inspur.demo1.until;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * dingzhenying 丁振莹
 *
 * 
 * 2017年9月2日
 *
 */
public class WeekUtil {
	static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	//1根据日期计算是一年中的第几周
	public static int getWeek(String date) {
		int week=0 ;
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(format.parse(date));
			week = cal.get(Calendar.WEEK_OF_YEAR);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(WeekUtil.dateToWeek(date)=="7"){
			return week-1;
		}else{
			return week;
		}
	}
	//根据日期计算周几
	public static String dateToWeek(String datetime) {
		String[] weekDays = { "7","1", "2", "3", "4", "5", "6" };
		Calendar cal = Calendar.getInstance(); // 获得一个日历
		Date datet = null;
		try {
			datet = format.parse(datetime);
			cal.setTime(datet);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1; // 指示一个星期中的某天。
		if (w < 0)
			w = 0;
		return weekDays[w];
	}

}