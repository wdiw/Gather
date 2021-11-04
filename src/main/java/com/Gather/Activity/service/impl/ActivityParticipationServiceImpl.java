package com.Gather.Activity.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Gather.Activity.dao.ActivityParticipationRepository;
import com.Gather.Activity.model.ActivityParticipationBean;
import com.Gather.Activity.service.ActivityParticipationService;

@Transactional
@Repository
public class ActivityParticipationServiceImpl implements ActivityParticipationService{
	
	ActivityParticipationRepository activityParticipationRepository;

	@Autowired
	public ActivityParticipationServiceImpl(ActivityParticipationRepository activityParticipationRepository)
	{   super();
		this.activityParticipationRepository=activityParticipationRepository;
	}
	
	
	@Override
	public List<ActivityParticipationBean> getAllActivityParticipationBean(){
	return activityParticipationRepository.findAll();
}


	
    //依據id 找單筆資料
	@Override
	public ActivityParticipationBean getActivityParticipationBeanById(Integer id) {
		return activityParticipationRepository.getById(id);
	}
	
	//依據id刪單筆資料
	@Override
	public void deleteActivityParticipationById(Integer id) {
		
		activityParticipationRepository.deleteById(id);
	}
	
	//新增
	@Override
	public void addActivityParticipation(ActivityParticipationBean activityParticipationBean) {
		activityParticipationRepository.save(activityParticipationBean);
	}
	
	//修改
	@Override
	public void updateActivityParticipation(ActivityParticipationBean activityParticipationBean) {
	
	activityParticipationRepository.save(activityParticipationBean);
	
	}
	
	//用活動編號、會員編號查詢有無登錄活動
	@Override
	public ActivityParticipationBean searchloginrecord(Integer activityid,Integer memberid) {
		
		ActivityParticipationBean activityParticipationBean=activityParticipationRepository.searchloginrecord(activityid, memberid);
		
		
		
		return activityParticipationBean;
	}
	
	
	
	
	//用會員編號查詢該會員的登錄活動
	@Override
	public List<ActivityParticipationBean> memberloginrecord(Integer memberid) {
			
		List<ActivityParticipationBean> list=activityParticipationRepository.memberloginrecord(memberid);
			 
			return list;
		}
	
	
}
