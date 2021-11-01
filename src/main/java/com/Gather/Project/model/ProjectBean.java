package com.Gather.Project.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "Project")
public class ProjectBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer pID;//專案ID
	private String pName;//專案名稱
	private Integer pTarget;//專案目標
	private String pDescribe;//專案簡述
	private String pImageCover;//專案封面
	private String pContent;//專案內容
	private String pSDate;//專案開始日期
	private String pEDate;//專案結束日期
	private Integer mID;//會員ID
	private String pStatus;//專案狀態

	// 空的建構子
	public ProjectBean() {

	}

	// 更新的建構子(有換掉圖片)
	public ProjectBean(Integer pID, String pName, Integer pTarget, String pDescribe, String pImageCover) {
		this.pID = pID;
		this.pName = pName;
		this.pDescribe = pDescribe;
		this.pTarget = pTarget;
		this.pImageCover = pImageCover;
	}

	
	
	// 新增的建構子
	public ProjectBean(String pName, Integer pTarget, String pSDate,String pEDate,String pImageCover,String pDescribe,  String pContent,
			  Integer mID,String pStatus) {
		super();
		this.pName = pName;
		this.pTarget = pTarget;
		this.pDescribe = pDescribe;
		this.pImageCover = pImageCover;
		this.pContent = pContent;
		this.pSDate = pSDate;
		this.pEDate = pEDate;
		this.mID = mID;
		this.pStatus=pStatus;
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

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpSDate() {
		return pSDate;
	}

	public void setpSDate(String pSDate) {
		this.pSDate = pSDate;
	}

	public String getpEDate() {
		return pEDate;
	}

	public void setpEDate(String pEDate) {
		this.pEDate = pEDate;
	}

	public Integer getmID() {
		return mID;
	}

	public void setmID(Integer mID) {
		this.mID = mID;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	@Override
	public String toString() {
		return "ProjectBean [pID=" + pID + ", pName=" + pName + ",pTarget=" + pTarget + ",pDescribe=" + pDescribe + "]";
	}

}
