
package com.inspur.demo1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inspur.demo1.bean.Plan;
import com.inspur.demo1.service.JobService;
import com.inspur.demo1.service.KbjbgService;

/**
*
* Title:kbjbgController
* Description:
* Company:
* @author Ding zhenying
* @date 2017年9月6日
*
**/
@Controller
@RequestMapping("/product")
public class kbjbgController {
	@Autowired
	KbjbgService kbjbgService;
	JobService jobService;
	//添加.修改。修改
	@RequestMapping("/save")
	@ResponseBody
	public Map save(@RequestBody List<Plan> productlist){
		for(Plan plan:productlist){
			BeanMap map1=BeanMap.create(plan);
			System.out.println("controller"+map1);
		}
		kbjbgService.save(productlist);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", "true");
		resultMap.put("errror", "false");
		System.out.println(resultMap);
		return resultMap;
		
	}

	

}
