package com.Gather.Activity.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name = "Activity")
public class ActivityBean implements Serializable {
	private static final long serialVersionUID = 1L;
	


	@Id@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String name;
	private String description;
	private String beginDate;
	private String endDate;
	private String fileName;
	private String postDate;
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}


	public  String category;



	@Transient
	private MultipartFile photo;
	@Transient
	private String base64String;
	private byte[] image;
	
	@Transient
	private Integer participationcount;
	
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "activityBean",cascade = CascadeType.ALL)
	private Set<ActivityParticipationBean> activityParticipation = new HashSet<ActivityParticipationBean>(0);
	
	 public ActivityBean( Integer id,String name, String description,String beginDate,String endDate, String postDate,String category,String base64String,
			 byte[] image,Integer participationcount) {
		    this.id=id;
			this.name = name;
			this.description = description;
			this.beginDate=beginDate;
			this.endDate=endDate;
			this.postDate=postDate;
			this.category=category;
			this.base64String = base64String;
			this.image = image;
			this.participationcount=participationcount;
			
			
			
	 }
	
	 public Integer getParticipationcount() {
		return participationcount;
	}

	public void setParticipationcount(Integer participationcount) {
		this.participationcount = participationcount;
	}

	public ActivityBean( String name, String description,String beginDate,String endDate,String postDate,String category) {
			this.name = name;
			this.description = description;
			this.beginDate=beginDate;
			this.endDate=endDate;
			this.postDate=postDate;
			this.category=category;
		}
		
	 public ActivityBean( Integer id,String name, String description,String beginDate,String endDate,String postDate,String category) {
		    this.id=id;
			this.name = name;
			this.description = description;
			this.beginDate=beginDate;
			this.endDate=endDate;
			this.postDate=postDate;
			this.category=category;
			
		}
	 
	 

	 public ActivityBean( String name, String description,String beginDate,String endDate, String postDate,String category,byte[] image,
				String base64String) {
			this.name = name;
			this.description = description;
			this.beginDate=beginDate;
			this.endDate=endDate;
			this.postDate=postDate;
			this.category=category;
			this.image = image;
			this.base64String = base64String;
			
			
	 }
	 

	 public ActivityBean( Integer id,String name, String description,String beginDate,String endDate, String postDate,String category,String base64String,
			 byte[] image		) {
		    this.id=id;
			this.name = name;
			this.description = description;
			this.beginDate=beginDate;
			this.endDate=endDate;
			this.postDate=postDate;
			this.category=category;
			this.base64String = base64String;
			this.image = image;
			
			
			
	 }


	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public String getBase64String() {
		return base64String;
	}

	public void setBase64String(String base64String) {
		this.base64String = base64String;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
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

	public Set<ActivityParticipationBean> getActivityParticipation() {
		return activityParticipation;
	}

	public void setActivityParticipation(Set<ActivityParticipationBean> activityParticipation) {
		this.activityParticipation = activityParticipation;
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
	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
   

	public ActivityBean() {

	}
	

//	public Set<ActivityParticipationBean> getActivityParticipation() {
//		return activityParticipation;
//	}
//
//	public void setActivityParticipation(Set<ActivityParticipationBean> activityParticipation) {
//		this.activityParticipation = activityParticipation;
//	}

}
