package com.Gather.Activity.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.Gather.member.entity.Member;



@Entity
@Table(name = "ActivityParticipation")
public class ActivityParticipationBean {

	
	@Id@Column(name = "id")
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Integer ActivityParticipationid;
	
	

	
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "activityid")
	private ActivityBean activityBean;
	
	
	private Integer m_id;
	
	
	String logintime;
	


   









	public Integer getM_id() {
		return m_id;
	}






	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}






	public String getLogintime() {
		return logintime;
	}






	public void setLogintime(String logintime) {
		this.logintime = logintime;
	}






	public Integer getActivityParticipationid() {
		return ActivityParticipationid;
	}



	public void setActivityParticipationid(Integer activityParticipationid) {
		ActivityParticipationid = activityParticipationid;
	}



	public ActivityBean getActivityBean() {
		return activityBean;
	}



	public void setActivityBean(ActivityBean activityBean) {
		this.activityBean = activityBean;
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
