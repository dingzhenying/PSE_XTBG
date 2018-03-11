package com.inspur.demo1.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * dingzhenying 丁振莹
 *
 * 
 * 2017年8月31日
 *
 */
@Table (name ="t_user")
public class User {
	@Id 
private Integer id;
	@Column (name="user_id")
private String userid;
	@Column (name="user_name")
private String username;
	@Column (name="user_pwd")
private String password;
	@Column (name="sj_id")
private String sj_id;
	private String isParent;
	
public String getIsParent() {
		return isParent;
	}
	public void setIsParent(String isParent) {
		this.isParent = isParent;
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
public String getSj_id() {
	return sj_id;
}
public void setSj_id(String sj_id) {
	this.sj_id = sj_id;
}
public void setId(int id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
}
