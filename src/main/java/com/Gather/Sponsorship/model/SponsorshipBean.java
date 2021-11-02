package com.Gather.Sponsorship.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "SponsorshipFee")
public class SponsorshipBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private Integer sID;
	private String sName;
	private Integer sPID;
	private String sPName;
	private Integer sAmount;

	@Transient
	private MultipartFile photo;
	@Transient
	private String base64String;
	private byte[] image;

	public SponsorshipBean() {
	}

	public SponsorshipBean(Integer sID, String sName, Integer sPID, String sPName, Integer sAmount, MultipartFile photo,
			byte[] image) {
		super();
		this.sID = sID;
		this.sName = sName;
		this.sPID = sPID;
		this.sPName = sPName;
		this.sAmount = sAmount;
		this.photo = photo;
		this.image = image;
	}

	public SponsorshipBean(String sName, Integer sPID, String sPName, Integer sAmount, byte[] image,
			String base64String) {
		this.sName = sName;
		this.sPID = sPID;
		this.sPName = sPName;
		this.sAmount = sAmount;
		this.image = image;
		this.base64String = base64String;
	}

	public SponsorshipBean(String sName, Integer sPID, String sPName, Integer sAmount, byte[] image) {
		super();
		this.sName = sName;
		this.sPID = sPID;
		this.sPName = sPName;
		this.sAmount = sAmount;
		this.image = image;
	}
	

	
	public SponsorshipBean(Integer sID, String sName, Integer sPID, String sPName, Integer sAmount,
			MultipartFile photo) {
		this.sID = sID;
		this.sName = sName;
		this.sPID = sPID;
		this.sPName = sPName;
		this.sAmount = sAmount;
		this.photo = photo;
	}

	
	public SponsorshipBean(Integer sID, String sName, Integer sPID, String sPName, Integer sAmount, String base64String,
			byte[] image) {
		this.sID = sID;
		this.sName = sName;
		this.sPID = sPID;
		this.sPName = sPName;
		this.sAmount = sAmount;
		this.base64String = base64String;
		this.image = image;
	}

	public Integer getsID() {
		return sID;
	}

	public void setsID(Integer sID) {
		this.sID = sID;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public Integer getsPID() {
		return sPID;
	}

	public void setsPID(Integer sPID) {
		this.sPID = sPID;
	}

	public String getsPName() {
		return sPName;
	}

	public void setsPName(String sPName) {
		this.sPName = sPName;
	}

	public Integer getsAmount() {
		return sAmount;
	}

	public void setsAmount(Integer sAmount) {
		this.sAmount = sAmount;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}


}
