package com.inspur.demo1.service;

import java.util.List;

import com.inspur.demo1.bean.User;

/**
*
* Title:UserService
* Description:
* Company:
* @author Ding zhenying
* @date 2017年9月4日
*
**/
public interface UserService {
public User getByUserName(String name);
public User getByUserId(String userid);
public List<User> findAll();
public List<User> findOne(String userid);
public void adduser(User user);
public void delete(String userid);
public void update(User user);
}
