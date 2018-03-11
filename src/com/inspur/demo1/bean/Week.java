/**
 * 
 */
package com.inspur.demo1.bean;

import javax.persistence.Id;
import javax.persistence.Table;

/**
*
* Title:Week
* Description:
* Company:
* @author Ding zhenying
* @date 2017年9月7日
*
**/
@Table(name = "week")
public class Week {
	@Id
	private String weekday;
	
	
	public String getWeekday() {
		return weekday;
	}

	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}

}
