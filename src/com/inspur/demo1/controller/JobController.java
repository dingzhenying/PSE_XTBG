package com.inspur.demo1.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.inspur.demo1.bean.Plan;
import com.inspur.demo1.bean.Week;
import com.inspur.demo1.service.JobService;
import com.inspur.demo1.until.WeekUtil;

/**
 * dingzhenying 丁振莹
 *
 * 
 * 2017年8月31日
 *
 */
@Controller
@RequestMapping("demo1/job")
public class JobController {
		@Autowired
		private JobService jobService;
		//获取所有数据
		@RequestMapping("/findJob")
		@ResponseBody
		public Map findJob(){		
			List<Plan> jobList=jobService.findAll();		
			Map<String,Object> map=new HashMap<String,Object>();		
			map.put("data", jobList);
			// 获取总记录条数
			map.put("total",jobList.size());
			return map;	
		}
		//计划添加
		@RequestMapping("/addjob")
		public ModelAndView adduser(Plan plan){
			String planTime=plan.getPlantime();
			int week= WeekUtil.getWeek(planTime);
			String day = WeekUtil.dateToWeek(planTime);
			plan.setWeek(week);
			plan.setDay(day);
			Map<String,String> map = new HashMap<String,String>();
			ModelAndView mv=new ModelAndView();
			jobService.addjob(plan);
			map.put("msname", "注册成功");			
			mv.addObject("data", map);			
			mv.setViewName("/userjob");
			return mv;			
		}
		//获取某天是否创建计划
		@RequestMapping("/getplantime")
		@ResponseBody
		public Map getplantime(
			@RequestParam(value="plantime",required=false)String plantime,
			@RequestParam(value="userid",required=false)String userid
			){
			Map<String, String> getplan = new HashMap<String,String>();
			getplan.put("plantime", plantime);
			getplan.put("userid", userid);
			 Plan plan=jobService.getplantime(getplan);
			 Map<String,Object> map = new HashMap<String,Object>();
			 if(plan!=null){
				 map.put("weekinfo", "fail");
				 map.put("info", "该天计划已创建，请修改时间");	
			 }else{
				 map.put("weekinfo", "success");
				 map.put("info", "允许");
			 }
			return map;
		}
			//根据用户ID查询用户所有工作信息
			@RequestMapping("getUserById")
			@ResponseBody
			public Map getUserById(@RequestParam(value="userid",required=false)String userid){
				Plan plan = jobService.getByUserId(userid);
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("userInfo", map);
				return map;
			}
			//登录页面跳转到“添加”
			@RequestMapping("adds")
			public ModelAndView adds(@RequestParam(value="userid",required=false) String userid) {
				Plan plan=new Plan();
				plan.setUserid(userid);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("usersInfo", plan);
				map.put("flags", "add");
				return new ModelAndView("/addjob", map);
			}
			
			//根据结果跳转到 添加/编辑 页面
			@RequestMapping("edits")
			public ModelAndView edits(
				@RequestParam(value="id",required=false) String id
				,@RequestParam(value="userid",required=false) String userid
				) {
				if("null".equals(id) ||"".equals(id)){
					Plan plan=new Plan();
					plan.setUserid(userid);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("usersInfo", plan);
					map.put("flags", "add");
					return new ModelAndView("/addjob", map);
				}else{
					Plan plan = jobService.getById(id);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("usersInfo", plan);
					map.put("flags", "edit");
					return new ModelAndView("/addjob", map);					
				}				
			}

			//根据week周查询用户一周信息
			@RequestMapping("findPlan")
			@ResponseBody
			public Map findPlan(
				@RequestParam(value="week",required=false) String week,
				@RequestParam(value="userid",required=false) String userid
			){
				//强制类型装换
				Integer week1 = Integer.valueOf(week);
				//set存值
				Plan plan1=new Plan();
				plan1.setUserid(userid);
				plan1.setWeek(week1);
				
//				List<Plan> user = jobService.findPlan(plan1);
				List<Plan> user = jobService.finddimplan(plan1);
				for(Plan plan:user){
					if(plan.getUserid()==null){
						plan.setUserid(userid);												
					}					
				}
				
				Map<String,Object> map = new HashMap<String,Object>();
				int dataTotal =user.size();
				map.put("data", user);
				// 获取总记录条数
				map.put("total",dataTotal);
				return map;
			}
			
			
			
			//删除一条计划
			@RequestMapping("del")
			@ResponseBody
			public void del(@RequestParam(value="id",required=false) String id){
				jobService.delete(id);
			}
			
			// 更新用户信息
			@RequestMapping("update")
			public String update(Plan plan) {
				String planTime=plan.getPlantime();
//				获取周
				int week= WeekUtil.getWeek(planTime);
//				获取星期
				String day = WeekUtil.dateToWeek(planTime);
				plan.setWeek(week);
				plan.setDay(day);
				jobService.update(plan);
				return "/userjob";
				
			}
//////////////////////////////下属工作信息查询////////////////////////////////////////////////////////		
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
			@RequestMapping("/userinfo")
			public ModelAndView edits(
					@RequestParam(value="id",required=false) String id
			){
				Plan plan = jobService.getById(id);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("usersInfo", plan);
				map.put("flags", "edit");
				return new ModelAndView("/jobinfo", map);
					
			}
			
			//根据week周查询用户一周信息
			@RequestMapping("text")
			@ResponseBody
			public Map text(
				@RequestParam(value="week",required=false) String week,
				@RequestParam(value="userid",required=false) String userid
			){
				//强制类型装换
				Integer week1 = Integer.valueOf(week);
				//set存值
				Plan plan1=new Plan();
				List<Week> newuser=new ArrayList<Week>();
				plan1.setUserid(userid);
				plan1.setWeek(week1);
				List<Plan> user = jobService.findPlan(plan1);
				Map<String,Object> map = new HashMap<String,Object>();
				int dataTotal =user.size();
				map.put("rows", newuser);
				// 获取总记录条数
				map.put("total",newuser.size());
				return map;
			}
}
