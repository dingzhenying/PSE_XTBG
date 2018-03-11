package com.inspur.demo1.service;

import java.util.List;

import com.inspur.demo1.bean.User;

public interface OrgService {
	public List<User> findAllNodes(String sjid);
}
