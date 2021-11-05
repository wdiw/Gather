package com.Gather.Activity.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.Gather.Activity.model.ActivityBean;
import com.Gather.Activity.model.ActivityParticipationBean;


public interface ActivityParticipationRepository extends JpaRepository<ActivityParticipationBean,Integer > {

	
	 

	

	@Query("select p from ActivityParticipationBean p where p.activityBean = ?1 and p.m_id = ?2 ")
	ActivityParticipationBean findActivityParticipationByM_idAndActivityId(ActivityBean activityBean ,Integer m_id);
	
	
	@Query("  SELECT COUNT(*) FROM ActivityParticipationBean p WHERE p.activityBean = ?1")
	Integer getActivityParticipationCount(ActivityBean activityBean );

	 
}
