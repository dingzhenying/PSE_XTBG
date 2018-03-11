package com.inspur.demo1.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanMap;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import com.inspur.demo1.bean.Plan;
import com.inspur.demo1.bean.User;
import com.inspur.demo1.bean.Week;
import com.inspur.demo1.dao.JobMapper;
import com.inspur.demo1.service.JobService;
/**
 * dingzhenying 丁振莹
 *
 * 
 * 2017年8月31日
 *
 */
@Service("jobService")
public class JobServiceImpl implements JobService{
	@Autowired
	private JobMapper jobMapper;
	public List<Plan> findAll(){
		return jobMapper.findAll();
	}
	public void addjob(Plan plan){
		jobMapper.addjob(plan);
	}
	public Plan getById(String id){
		return jobMapper. getById (id);
	}
	public Plan getByUserId(String userid){
		return jobMapper.getByUserId (userid);	
	}
	public void delete(String id){
		jobMapper.delete(id);
	}
	public void update(Plan plan){
		jobMapper.update(plan);
	}
	public List<Plan> findPlan(Plan plan){
		return jobMapper.findPlan(plan);
	};
	
	public List<Plan> finddimplan(Plan plan){
		return jobMapper.finddimplan(plan);
		
	};
//	public Plan getplantime(String userid,String plantime){
//		Map<String,String> paramMap=new HashMap<String,String>();  
//		paramMap.put("userid",userid);  
//		paramMap.put("plantime",plantime); 
//		return jobMapper.getplantime(userid,plantime);
//		
//		
//	};
	public Plan getplantime(Map<String, String> getplan){
		System.out.println("service="+getplan);
//		BeanMap plan1=BeanMap.create(jobMapper.getplantime(getplan));
//		System.out.println("servicebean="+plan1);
		return jobMapper.getplantime(getplan);
		
	}
}
