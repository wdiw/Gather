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
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.Gather.member.entity.Member;



@Entity
@Table(name = "ActivityParticipation")
public class ActivityParticipationBean {

	
	@Id@Column(name = "activityParticipationid")
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Integer activityParticipationid;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "activityid")
	private ActivityBean activityBean;
	
	private Integer m_id;
	
	
	String logintime;
	
	
	private String membername;
	
	private String activityname;
	
	@Transient
	private Integer activityid;
	
	
	
	
	
	
	public ActivityParticipationBean() {
		
	}
	
	





	public String getMembername() {
		return membername;
	}






	public void setMembername(String membername) {
		this.membername = membername;
	}






	public String getActivityname() {
		return activityname;
	}






	public void setActivityname(String activityname) {
		this.activityname = activityname;
	}

















	public Integer getActivityid() {
		return activityid;
	}






	public void setActivityid(Integer activityid) {
		this.activityid = activityid;
	}






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
		return activityParticipationid;
	}






	public void setActivityParticipationid(Integer activityParticipationid) {
		this.activityParticipationid = activityParticipationid;
	}






	public ActivityBean getActivityBean() {
		return activityBean;
	}



	public void setActivityBean(ActivityBean activityBean) {
		this.activityBean = activityBean;
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
