package com.Gather.Project.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Project")
public class ProjectBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer pID;
	private String pName;
	private Integer pTarget;
	private String pDescribe;
	private String pImageCover;

	// 空的建構子
	public ProjectBean() {

	}

	

	

	//更新的建構子(有換掉圖片)
	public ProjectBean(Integer pID, String pName, Integer pTarget, String pDescribe,String pImageCover) {
		this.pID = pID;
		this.pName = pName;
		this.pDescribe = pDescribe;
		this.pTarget = pTarget;
		this.pImageCover=pImageCover;
	}
	
	
	
	

	// 新增的建構子
	public ProjectBean(String pName, Integer pTarget, String pDescribe,String pImageCover) {

		this.pName = pName;
		this.pDescribe = pDescribe;
		this.pTarget = pTarget;
		this.pImageCover=pImageCover;
	}

	public Integer getpID() {
		return pID;
	}

	public void setpID(Integer pID) {
		this.pID = pID;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpDescribe() {
		return pDescribe;
	}

	public void setpDescribe(String pDescribe) {
		this.pDescribe = pDescribe;
	}

	public Integer getpTarget() {
		return pTarget;
	}

	public void setpTarget(Integer pTarget) {
		this.pTarget = pTarget;
	}
	
	public String getpImageCover() {
		return pImageCover;
	}


	public void setpImageCover(String pImageCover) {
		this.pImageCover = pImageCover;
	}

	
	
	

	@Override
	public String toString() {
		return "ProjectBean [pID=" + pID + ", pName=" + pName + ",pTarget=" + pTarget + ",pDescribe=" + pDescribe + "]";
	}

}
