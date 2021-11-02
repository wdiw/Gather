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

@Entity
@Table(name = "ActivityParticipation")
@Component
public class ActivityParticipationBean {

	
	@Id@Column(name = "ActivityParticipationid")
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Integer ActivityParticipationid;
	
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "activityid")
	private ActivityBean activityBean;







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
