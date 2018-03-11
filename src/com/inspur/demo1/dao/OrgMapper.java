package com.inspur.demo1.dao;

import java.util.List;

import com.inspur.demo1.bean.User;

public interface OrgMapper {
	public List<User> findAllNodes(String usreid);
}
