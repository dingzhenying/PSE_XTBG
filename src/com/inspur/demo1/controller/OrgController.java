package com.inspur.demo1.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.inspur.demo1.bean.Plan;
import com.inspur.demo1.bean.User;
import com.inspur.demo1.bean.Week;
import com.inspur.demo1.service.JobService;
import com.inspur.demo1.service.OrgService;

@Controller
@RequestMapping("/organ")
public class OrgController {
	@Autowired
	private OrgService orgService;
	private JobService jobService;
	// 初始化所有的节点
	@RequestMapping(value = "/getAllNodes")
	@ResponseBody
	public List<User> findAllNodes(HttpServletRequest request) {
		String parentId = request.getParameter("userid");
		List<User> users = new ArrayList<User>();
		users = orgService.findAllNodes(parentId);
		
		return users;
	} 
	//查询某一周数据mv
	@RequestMapping("/finduserjob")
	public ModelAndView finduserjob(
		@RequestParam(value="week",required=false) String week,
		@RequestParam(value="userid",required=false) String userid,
		HttpSession session
	){	
		session.setAttribute("branchuser", userid);
		ModelAndView mv=new ModelAndView();
		//强制类型装换
		Integer week1 = Integer.valueOf(week);
		//set存值
		Plan plan1=new Plan();
		plan1.setUserid(userid);
		plan1.setWeek(week1);
		List<Plan> user = jobService.findPlan(plan1);
//		List<Week> user = jobService.findPlan(plan1);
		Map<String,Object> map = new HashMap<String,Object>();
		int dataTotal =user.size();
		map.put("aaData", user);
		map.put("iTotalRecords", dataTotal);
		map.put("iTotalDisplayRecords", dataTotal);
		mv.addObject("data", map);			
		mv.setViewName("/branchjob");
		return mv;
		
	}
	//跳转到用户详情页面
	@RequestMapping("edits")
	public ModelAndView edits(
		@RequestParam(value="id",required=false) String id
		){
			Plan plan = jobService.getById(id);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("usersInfo", plan);
			map.put("flags", "edit");
			return new ModelAndView("/jobinfo", map);
			
		}
		
	
	
}
