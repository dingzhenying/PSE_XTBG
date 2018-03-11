package com.inspur.demo1.dao;

import java.util.List;
import java.util.Map;

import com.inspur.demo1.bean.Plan;
import com.inspur.demo1.bean.User;
import com.inspur.demo1.bean.Week;

/**
 * dingzhenying 丁振莹
 *
 * 
 * 2017年8月31日
 *
 */
public interface JobMapper {
	public List<Plan> findAll();
	public void addjob(Plan plan);
	public Plan getById(String id);
	public Plan getByUserId(String userid);
	public int save(Plan plan);
	public void update(Plan plan);
	public void delete(String id);
	public List<Plan> findPlan(Plan plan);
	public Plan getplantime(Map<String, String> getplan);	
	public List<Plan> finddimplan(Plan plan);	
}
