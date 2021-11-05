package com.Gather.Activity.service;

import java.util.List;


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
	
	

}

