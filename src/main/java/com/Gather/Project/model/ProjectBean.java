package com.Gather.Project.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
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
	private String reason;//狀態說明
	private Integer pAmountNow;//累積金額
	private String pCategory;//計畫類別
	private Integer sponsorCount;//被贊助數
	
	
	@OneToMany(mappedBy = "projectBean",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	Set<ProjectPlanBean> projectPlanBeans=new HashSet<>();




	// 空的建構子
	public ProjectBean() {

	}

	// 更新的建構子
	public ProjectBean(Integer pID, String pName, Integer pTarget, String pSDate,String pEDate,
			String pImageCover,String pDescribe, String pContent, Integer mID,String pStatus,
			String reason,Integer sponsorCount) {
	
		this.pID = pID;
		this.pName = pName;
		this.pTarget = pTarget;
		this.pDescribe = pDescribe;
		this.pImageCover = pImageCover;
		this.pContent = pContent;
		this.pSDate = pSDate;
		this.pEDate = pEDate;
		this.mID = mID;
		this.pStatus=pStatus;
		this.reason=reason;
		this.sponsorCount=sponsorCount;
	}

	
	
	// 新增的建構子
	public ProjectBean(String pName, Integer pTarget, String pSDate,String pEDate,
			String pImageCover,String pDescribe,  String pContent,Integer mID,
			String pStatus,String reason,String pCategory) {
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
		this.reason=reason;
		this.pCategory=pCategory;
		this.sponsorCount=0;
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
	
	public Set<ProjectPlanBean> getProjectPlanBeans() {
		return projectPlanBeans;
	}

	public void setProjectPlanBeans(Set<ProjectPlanBean> projectPlanBeans) {
		this.projectPlanBeans = projectPlanBeans;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
	public Integer getpAmountNow() {
		return pAmountNow;
	}

	public void setpAmountNow(Integer pAmounNow) {
		this.pAmountNow = pAmounNow;
	}
	
	public String getpCategory() {
		return pCategory;
	}

	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	

	public Integer getSponsorCount() {
		return sponsorCount;
	}

	public void setSponsorCount(Integer sponsorCount) {
		this.sponsorCount = sponsorCount;
	}
	@Override
	public String toString() {
		return "ProjectBean [pID=" + pID + ", pName=" + pName + ",pTarget=" + pTarget + ",pDescribe=" + pDescribe + "]";
	}

}
