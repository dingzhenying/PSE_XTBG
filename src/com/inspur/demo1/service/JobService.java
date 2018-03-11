package com.inspur.demo1.service;

import java.util.List;
import java.util.Map;

import com.inspur.demo1.bean.Plan;
import com.inspur.demo1.bean.Week;

/**
*
* Title:JobService
* Description:
* Company:
* @author Ding zhenying
* @date 2017年9月4日
*
**/
public interface JobService {
	public List<Plan> findAll();
	public Plan getById(String id);
	public Plan getByUserId(String userid);
	public void addjob(Plan plan);
	public void delete(String id);
	public void update(Plan plan);
	public List<Plan> findPlan(Plan plan);
//	public Plan getplantime(String userid,String plantime);
	public Plan getplantime(Map<String, String> getplan);
	
	public List<Plan> finddimplan(Plan plan);
}
