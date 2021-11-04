package com.Gather.Activity.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.Gather.Activity.model.ActivityParticipationBean;


public interface ActivityParticipationRepository extends JpaRepository<ActivityParticipationBean,Integer > {

	
	 
	
	@Query("SELECT u FROM ActivityParticipationBean u WHERE u.activityid = :activityid and u.m_id = :m_id")
	ActivityParticipationBean findUserByM_idAndActivityId(
	  @Param("activityid") Integer activityid, 
	  @Param("m_id") Integer m_id);
	
	
	 
//	 @Query(value = "Select a from ActivityParticipationBean as a where a.activityid=?1 and a.m_id=?2",nativeQuery = true)
//	 ActivityParticipationBean searchloginrecord(Integer activityid,Integer memberid);
	

//	 @Query(value = "SELECT * FROM ActivityParticipationBean u WHERE  u.m_id =?1",nativeQuery = true)
//	 List<ActivityParticipationBean> memberloginrecord(Integer memberid);
	
	 
	 
}
