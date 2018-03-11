package com.inspur.demo1.service.Impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.inspur.demo1.bean.User;
import com.inspur.demo1.dao.UserMapper;
import com.inspur.demo1.service.UserService;
/**
 * dingzhenying 丁振莹
 *
 * 
 * 2017年9月2日
 *
 */
@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	public List<User> findAll(){
		return userMapper.findAll();
		
	}
	public List<User> findOne(String userid){
		return userMapper.findOne(userid);	
	}
	public void adduser(User user){
		userMapper.adduser(user);
		
	}
	public User getByUserName(String name){
		return userMapper. getByUserName (name);
	}
	public User getByUserId(String userid){
		return userMapper.getByUserId (userid);
		
	}
	public void delete(String userid){
		userMapper.delete(userid);
	}
	public void update(User user){
		userMapper.update(user);
	}
}
