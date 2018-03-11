package com.inspur.demo1.dao;

import java.util.List;

import com.inspur.demo1.bean.User;

/**
 * dingzhenying 丁振莹
 *
 * 
 * 2017年8月31日
 *
 */
public interface UserMapper {
	//查询用户所有信息（用户名+密码）
public List<User> findAll();
public List<User> findOne(String  userid);
public void adduser(User user);
public User getByUserName(String name);
public User getByUserId(String userid);
public int save(User user);
public void update(User user);
public void delete(String userid);

}
