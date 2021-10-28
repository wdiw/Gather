package com.Gather.Activity.model;

import java.io.Serializable;
import java.sql.Blob;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name = "Activity")
@Component
public class ActivityBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private String description;
	private Blob image;
	private String beginDate;
	private String endDate;
	private String fileName;

	@Transient
	private MultipartFile projectImage;
	
	
	
	 public ActivityBean( String name, String description,String beginDate,String endDate) {
			this.name = name;
			this.description = description;
			this.beginDate=beginDate;
			this.endDate=endDate;
		}
		
	 public ActivityBean( Integer id,String name, String description,String beginDate,String endDate) {
		    this.id=id;
			this.name = name;
			this.description = description;
			this.beginDate=beginDate;
			this.endDate=endDate;
		}
	 
	 

	 public ActivityBean( String name, String description,String beginDate,String endDate,Blob image,String fileName,MultipartFile projectImage) {
			this.name = name;
			this.description = description;
			this.beginDate=beginDate;
			this.endDate=endDate;
			this.image=image;
			this.fileName=fileName;
			this.projectImage=projectImage;
	 }
	 
	


	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public MultipartFile getProjectImage() {
		return projectImage;
	}

	public void setProjectImage(MultipartFile projectImage) {
		this.projectImage = projectImage;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}


	

	public String getBeginDate() {
		return beginDate;
	}


	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
   

	public ActivityBean() {

	}

}
