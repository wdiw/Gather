package com.Gather.Activity.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.Gather.Activity.dao.ActivityParticipationRepository;
import com.Gather.Activity.model.ActivityBean;
import com.Gather.Activity.model.ActivityParticipationBean;
import com.Gather.Activity.service.ActivityParticipationService;

@Repository
@Transactional
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
	
//	@Query("SELECT u FROM ActivityParticipationBean u WHERE u.activityid = :activityid and u.m_id = :m_id")
//	public ActivityParticipationBean findUserByM_idAndActivityId(
//	  @Param("activityid") Integer activityid, 
//	  @Param("m_id") Integer m_id) {
//		
//		ActivityParticipationBean activityParticipationBean=activityParticipationRepository.findUserByM_idAndActivityId(activityid, m_id);
//		return activityParticipationBean;
//		
//	}
//	
	
	
	//用會員編號查詢該會員的登錄活動
//	@Override
//	public List<ActivityParticipationBean> memberloginrecord(Integer memberid) {
//			
//		List<ActivityParticipationBean> list=activityParticipationRepository.memberloginrecord(memberid);
//			 
//			return list;
//		}
//	
	
	
	
	public ActivityParticipationBean findActivityParticipationByM_idAndActivityId(ActivityBean activityBean ,Integer m_id) {
		return activityParticipationRepository.findActivityParticipationByM_idAndActivityId(activityBean, m_id);
	}
	
	
	public Integer getActivityParticipationCount(ActivityBean activityBean ) {
		
		return activityParticipationRepository.getActivityParticipationCount(activityBean);
		
		
	};
	
}
