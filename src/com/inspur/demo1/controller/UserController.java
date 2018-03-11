package com.inspur.demo1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.inspur.demo1.bean.User;
import com.inspur.demo1.service.UserService;
/**
 * dingzhenying 丁振莹
 *
 * 
 * 2017年8月31日
 *
 */
@Controller
@RequestMapping("demo1/user")

public class UserController {
	
	@Autowired
	private UserService userService;
//	登录验证
	@RequestMapping("/login")
	public ModelAndView login(
		@RequestParam(value="userid", required=false) String userid,
		@RequestParam(value="password", required=false) String password,
		HttpSession session
		){
		ModelAndView mv=new ModelAndView();
		Map<String,String> map = new HashMap<String,String>();
		if(userid!=null && !"".equals(userid) 
				&& !"".equals(password) && password!=null){
			User user=userService.getByUserId(userid);
			if(user==null){//没有该用户
				map.put("msname", "没有该用户");
				mv.setViewName("/login-ls");
			} else if(!password.equals(user.getPassword())){//用户密码不正确
				map.put("mspassword", "用户密码不正确");
				mv.setViewName("/login-ls");
			}else{			
				map.put("username", user.getUsername());
				session.setAttribute("userid",user.getUserid());
				mv.setViewName("/index");
			}
		}else{
			map.put("msg", "用户名和密码不能为空");
			mv.setViewName("/login-ls");
		}
		mv.addObject("data", map);
	   return mv;  
	  
	}
	//获取用户信息
	@RequestMapping("/findAll")
	@ResponseBody
	public Map findAll(){		
		List<User> userList=userService.findAll();		
		Map<String,Object> map=new HashMap<String,Object>();		
		int dataTotal=userList.size();
		map.put("aaData", userList);
		map.put("iTotalDisplayRecords", dataTotal);
		map.put("iTotalRecords", dataTotal);
		return map;		
	}
	//查询一个用户
	@RequestMapping("/findOne")
	@ResponseBody
	public Map findOne(@RequestParam(value="userid",required=false) String userid){
		List<User> user = userService.findOne(userid);
		Map<String,Object> map = new HashMap<String,Object>();
		int dataTotal =1;
		map.put("aaData", user);
		map.put("iTotalRecords", dataTotal);
		map.put("iTotalDisplayRecords", dataTotal);
		return map;
	}
	//用户添加
	@RequestMapping("/adduser")
	public ModelAndView adduser(User user){
		Map<String,String> map = new HashMap<String,String>();
		ModelAndView mv=new ModelAndView();
		userService.adduser(user);
		map.put("msname", "注册成功");
		mv.addObject("data", map);
		mv.setViewName("/queryuser");
		return mv ;
		
	}
	//根据用户名查询用户信息
		@RequestMapping("getUserByName")
		@ResponseBody
		public Map getUserByName(@RequestParam(value="name",required=false) String name){
			User user = userService.getByUserName(name);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("userInfo", user);
			return map;
		}
		//根据用户ID查询用户信息
		@RequestMapping("getUserById")
		@ResponseBody
		public Map getUserById(@RequestParam(value="userid",required=false)String userid){
			User user = userService.getByUserId(userid);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("userInfo", user);
			return map;
		}
		
		//跳转到编辑页面
		@RequestMapping("edits")
		public ModelAndView edits(@RequestParam(value="userid",required=false) String userid) {
			User users = userService.getByUserId(userid);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("usersInfo", users);
			map.put("flags", "edit");
			return new ModelAndView("/adduser", map);
		}
		//删除用户
		@RequestMapping("del")
		@ResponseBody
		public void del(@RequestParam(value="userid",required=false) String userid){
			userService.delete(userid);
		}
		
		// 更新用户信息
		@RequestMapping("update")
		public String update(User user) {
			userService.update(user);
			return "/queryuser";
		}
}
