package com.Gather.Activity.service;

import java.util.List;

import com.Gather.Activity.model.ActivityBean;
import com.Gather.Activity.model.ActivityParticipationBean;

public interface ActivityParticipationService {
	//找所有計畫資料
    List<ActivityParticipationBean> getAllActivityParticipationBean();
	
    //依據id 找單筆資料
	public ActivityParticipationBean getActivityParticipationBeanById(Integer id);
	
	//依據id刪單筆資料
	public void deleteActivityParticipationById(Integer id);
	
	//新增
	public void addActivityParticipation(ActivityParticipationBean activityParticipationBean);
	
	//修改
	public void updateActivityParticipation(ActivityParticipationBean activityParticipationBean);
	
	//用活動編號、會員編號查詢有無登錄活動
	 ActivityParticipationBean findByM_IDAndActivityBean(Integer memberid,ActivityBean activityBean);
	
	//用會員編號查詢該會員的登錄活動
		public List<ActivityParticipationBean> memberloginrecord(Integer memberid);
}
