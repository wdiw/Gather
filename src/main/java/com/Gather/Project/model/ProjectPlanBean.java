package com.Gather.Project.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


//@Entity
//@Table(name = "ProjectPlan")
public class ProjectPlanBean implements Serializable {
//	private static final long serialVersionUID = 1L;
//
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Integer ProjectPlanID;//方案ID
//	private Integer ProjectPlanPrice;//方案金額
//	private String ProjectPlanContent;//方案內容
//	private Integer ProjectPlanAmount;//方案數量
//	private String ProjectPlanImage;//方案圖片路徑
//	
////	private Integer pID;//方案對應的Project ID
////	
////	//多中有個一: 多方類別中，要設定對應的一方類別
////		@ManyToOne(fetch=FetchType.EAGER)
////		@JoinColumn(name = "pID")
////		ProjectBean projectBean;
//
//		//空的建構子
//		public ProjectPlanBean() {
//			
//		}
//		
//		
//		public ProjectPlanBean(Integer projectPlanID, Integer projectPlanPrice, String projectPlanContent,
//				Integer projectPlanAmount, String projectPlanImage, Integer pID, ProjectBean projectBean) {
//			super();
//			ProjectPlanID = projectPlanID;
//			ProjectPlanPrice = projectPlanPrice;
//			ProjectPlanContent = projectPlanContent;
//			ProjectPlanAmount = projectPlanAmount;
//			ProjectPlanImage = projectPlanImage;
//			this.pID = pID;
//			this.projectBean = projectBean;
//		}
//
//
//		public Integer getProjectPlanID() {
//			return ProjectPlanID;
//		}
//
//
//		public void setProjectPlanID(Integer projectPlanID) {
//			ProjectPlanID = projectPlanID;
//		}
//
//
//		public Integer getProjectPlanPrice() {
//			return ProjectPlanPrice;
//		}
//
//
//		public void setProjectPlanPrice(Integer projectPlanPrice) {
//			ProjectPlanPrice = projectPlanPrice;
//		}
//
//
//		public String getProjectPlanContent() {
//			return ProjectPlanContent;
//		}
//
//
//		public void setProjectPlanContent(String projectPlanContent) {
//			ProjectPlanContent = projectPlanContent;
//		}
//
//
//		public Integer getProjectPlanAmount() {
//			return ProjectPlanAmount;
//		}
//
//
//		public void setProjectPlanAmount(Integer projectPlanAmount) {
//			ProjectPlanAmount = projectPlanAmount;
//		}
//
//
//		public String getProjectPlanImage() {
//			return ProjectPlanImage;
//		}
//
//
//		public void setProjectPlanImage(String projectPlanImage) {
//			ProjectPlanImage = projectPlanImage;
//		}
//
//
//		public Integer getpID() {
//			return pID;
//		}
//
//
//		public void setpID(Integer pID) {
//			this.pID = pID;
//		}
//
//
//		public ProjectBean getProjectBean() {
//			return projectBean;
//		}
//
//
//		public void setProjectBean(ProjectBean projectBean) {
//			this.projectBean = projectBean;
//		}
//		
		
	
}
