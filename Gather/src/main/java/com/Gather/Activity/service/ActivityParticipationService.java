package com.Gather.Activity.service;

import java.util.List;

import com.Gather.Activity.model.ActivityBean;
import com.Gather.Activity.model.ActivityParticipationBean;

public interface ActivityParticipationService {
	//找所有計畫資料
    List<ActivityParticipationBean> ActivityParticipationBean();
	
    //依據id 找單筆資料
	public ActivityParticipationBean getActivityParticipationBeanById(Integer id);
	
	//依據id刪單筆資料
	public void deleteActivityParticipationById(Integer id);
	
	//新增
	public void addActivityParticipation(ActivityBean activityBean);
	
	//修改
	public void updateActivityParticipation(ActivityBean activityBean);
}
