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
import com.Gather.Project.model.ProjectBean;


@Entity
@Table(name = "ProjectPlan")
public class ProjectPlanBean implements Serializable {
	private static final long serialVersionUID = 1L;

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer projectPlanID;//方案ID
	
	private Integer projectPlanPrice;//方案金額
	private String 	projectPlanContent;//方案內容
	private String ETA;//預計實現日期
	private String 	projectPlanImage;//方案圖片路徑
	
	//private Integer pID;//方案對應的Project ID
	
	//多中有個一: 多方類別中，要設定對應的一方類別
		@ManyToOne(fetch=FetchType.EAGER)
		@JoinColumn(name = "pID")
		ProjectBean projectBean;

		//空的建構子
		public ProjectPlanBean() {
			
		}

		
		public ProjectPlanBean( Integer projectPlanPrice, String projectPlanContent,
				String ETA, String projectPlanImage, ProjectBean projectBean) {
			
//			this.projectPlanID = projectPlanID;
			this.projectPlanPrice = projectPlanPrice;
			this.projectPlanContent = projectPlanContent;
			this.ETA = ETA;
			this.projectPlanImage = projectPlanImage;
			this.projectBean = projectBean;
		}


		public Integer getProjectPlanID() {
			return projectPlanID;
		}


		public void setProjectPlanID(Integer projectPlanID) {
			this.projectPlanID = projectPlanID;
		}


		public Integer getProjectPlanPrice() {
			return projectPlanPrice;
		}


		public void setProjectPlanPrice(Integer projectPlanPrice) {
			this.projectPlanPrice = projectPlanPrice;
		}


		public String getProjectPlanContent() {
			return projectPlanContent;
		}


		public void setProjectPlanContent(String projectPlanContent) {
			this.projectPlanContent = projectPlanContent;
		}


		

		public String getETA() {
			return ETA;
		}


		public void setETA(String eTA) {
			ETA = eTA;
		}


		public String getProjectPlanImage() {
			return projectPlanImage;
		}


		public void setProjectPlanImage(String projectPlanImage) {
			this.projectPlanImage = projectPlanImage;
		}


		public ProjectBean getProjectBean() {
			return projectBean;
		}


		public void setProjectBean(ProjectBean projectBean) {
			this.projectBean = projectBean;
		}
		
		
		
		
	
}
