
package com.inspur.demo1.service.Impl;

import java.util.List;
import java.util.Map;

import org.loushang.framework.util.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanMap;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.inspur.demo1.bean.Plan;
import com.inspur.demo1.dao.JobMapper;
import com.inspur.demo1.service.KbjbgService;

/**
*
* Title:KbjbgServiceImpl
* Description:
* Company:
* @author Ding zhenying
* @date 2017年9月6日
*
**/
@Service("kbjbgService")
public class KbjbgServiceImpl implements KbjbgService{
	
    @Autowired
    private JobMapper jobMapper;
    // ////////////////////////////////新增、修改//////////////////////////////////   
    @Transactional("mybatisTransactionManager")
	public void save(List<Plan> productList) {
        //业务主键处理
        if(productList!=null && productList.size()>0){
            for(int i=0; i<productList.size(); i++){
                if(productList.get(i).getState()==1){
                	
                    Plan aaa=productList.get(i);

                    BeanMap bbb=BeanMap.create(aaa);
                    System.out.println( "新增"+ bbb);
                    jobMapper.addjob(aaa);
                }
                if(productList.get(i).getState()==2){
                    Plan aaa=productList.get(i);
                    BeanMap bbb=BeanMap.create(aaa);
                    System.out.println( "删除"+ bbb);
                    if(aaa.getId()==null){
                    	System.out.println("为空"+aaa.getWeekday());
                    	
                    }else{
                    	
                    	System.out.println("删除");
                    	String id=String.valueOf(aaa.getId());
                    	jobMapper.delete(id);
                    }
                }
                if(productList.get(i).getState()==3){
                    Plan aaa=productList.get(i);
                    aaa.setDay(aaa.getWeekday());
                    System.out.println(aaa.getId());
                    if(aaa.getId()==null){
                    	System.out.println("新增");
                    	jobMapper.addjob(aaa);
                    	
                    }else{
                    	
                    	System.out.println("修改");
                    	jobMapper.update(aaa);
                    }
                    BeanMap bbb=BeanMap.create(aaa);
                    System.out.println( "修改"+ bbb);
                }
                
            }
        }
	}

}
