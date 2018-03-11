package com.inspur.demo1.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.demo1.bean.User;
import com.inspur.demo1.dao.OrgMapper;
import com.inspur.demo1.service.OrgService;
@Service("orgService")
public class OrgServiceImpl implements OrgService {
	@Autowired
	private OrgMapper orgMapper;
	
	@Override
	public List<User> findAllNodes(String sjid) {
		return orgMapper.findAllNodes(sjid);
	}

}
