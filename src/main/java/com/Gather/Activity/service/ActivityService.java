package com.Gather.Activity.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.Query;

import com.Gather.Activity.model.ActivityBean;


public interface ActivityService {

	//找所有計畫資料
    List<ActivityBean> getAllActivity();
	
    //依據id 找單筆資料
	public ActivityBean getActivityById(Integer id);
	
	//依據id刪單筆資料
	public void deleteActivityById(Integer id);
	
	//新增
	public void addActivity(ActivityBean activityBean);
	
	//修改
	public void updateActivity(ActivityBean activityBean);
	
	
	//關鍵字查詢活動
	 List<ActivityBean> searchActivity(Set<String> names);
	 
	 @Query("select p from ActivityBean p where  p.category = ?1 ")
		List<ActivityBean>  findActivityByCategory(String category);

	
	

}

