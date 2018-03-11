package com.inspur.demo1.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import org.loushang.framework.data.StatefulDatabean;

/**
*
* Title:Plan
* Description:
* Company:
* @author Ding zhenying
* @date 2017年9月4日
*
**/
@Table(name = "USER_PLAN")
public class Plan extends StatefulDatabean implements Serializable{
@Id
private Integer id;
@Column(name = "user_id")
private String userid;
@Column(name = "c_time")
private String plantime;
@Column(name = "week")
private Integer week;
@Column(name = "job_zao")
private String job_zao;
@Column(name = "job_zhong")
private String job_zhong;
@Column(name = "job_wan")
private String job_wan;
@Column(name ="day")
private String day;
private String weekday;

public String getWeekday() {
	return weekday;
}
public void setWeekday(String weekday) {
	this.weekday = weekday;
}
public String getDay() {
	return day;
}
public void setDay(String day) {
	this.day = day;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public String getPlantime() {
	return plantime;
}
public void setPlantime(String plantime) {
	this.plantime = plantime;
}
public Integer getWeek() {
	return week;
}
public void setWeek(Integer week) {
	this.week = week;
}
public String getJob_zao() {
	return job_zao;
}
public void setJob_zao(String job_zao) {
	this.job_zao = job_zao;
}
public String getJob_zhong() {
	return job_zhong;
}
public void setJob_zhong(String job_zhong) {
	this.job_zhong = job_zhong;
}
public String getJob_wan() {
	return job_wan;
}
public void setJob_wan(String job_wan) {
	this.job_wan = job_wan;
}
}
