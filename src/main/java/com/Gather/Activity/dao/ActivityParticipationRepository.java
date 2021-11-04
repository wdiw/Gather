package com.Gather.Activity.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Gather.Activity.model.ActivityBean;
import com.Gather.Activity.model.ActivityParticipationBean;


public interface ActivityParticipationRepository extends JpaRepository<ActivityParticipationBean,Integer > {

	
	 
	
	
	
	
	 
	 
	 ActivityParticipationBean findByM_IDAndActivityBean(Integer memberid,ActivityBean activityBean);
	

	 @Query(value = "SELECT * FROM ActivityParticipationBean u WHERE  u.m_id =?1",nativeQuery = true)
	 List<ActivityParticipationBean> memberloginrecord(Integer memberid);
	
	 
	 
}
