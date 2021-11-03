package com.Gather.Sponsorship.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SponsorOrder")
public class SponsorOrderBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private Integer sID;
	private Integer mID;
	private Integer sPID;
	private String sName;
	private String sPName;
	private String status;
	private String paymentMethod;
	private Integer sAmount;
	private Integer sDiscount;
	private Integer sBonus;
	private String sTime;
	private String projectImage;
	private String sAddress;
	private String sPhone;
	private String sEmail;
	private Integer sTotal;
	private Integer proposerID;

	public SponsorOrderBean() {
	}



	public SponsorOrderBean(Integer sID, Integer mID, Integer sPID, String sName, String sPName, String status,
			String paymentMethod, Integer sAmount, Integer sDiscount, Integer sBonus, String sTime, String projectImage,
			String sAddress, String sPhone, String sEmail,Integer sTotal,Integer proposerID) {
		super();
		this.sID = sID;
		this.mID = mID;
		this.sPID = sPID;
		this.sName = sName;
		this.sPName = sPName;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.sAmount = sAmount;
		this.sDiscount = sDiscount;
		this.sBonus = sBonus;
		this.sTime = sTime;
		this.projectImage = projectImage;
		this.sAddress = sAddress;
		this.sPhone = sPhone;
		this.sEmail = sEmail;
		this.sTotal = sTotal;
		this.proposerID=proposerID;
	}



	public SponsorOrderBean( Integer mID, Integer sPID, String sName, String sPName, String paymentMethod,
			Integer sAmount, Integer sDiscount, Integer sBonus, String projectImage, String sAddress, String sPhone,
			String sEmail,Integer sTotal,Integer proposerID) {
		super();
		
		this.mID = mID;
		this.sPID = sPID;
		this.sName = sName;
		this.sPName = sPName;
		this.paymentMethod = paymentMethod;
		this.sAmount = sAmount;
		this.sDiscount = sDiscount;
		this.sBonus = sBonus;
		this.projectImage = projectImage;
		this.sAddress = sAddress;
		this.sPhone = sPhone;
		this.sEmail = sEmail;
		this.sTotal = sTotal;
		this.proposerID = proposerID;
	}





	public SponsorOrderBean(Integer sID, Integer mID, Integer sPID, String sName, String sPName, String paymentMethod,
			Integer sAmount, Integer sDiscount, Integer sBonus, String sTime, String projectImage, String sAddress,
			String sPhone, String sEmail,Integer sTotal) {
		super();
		this.sID = sID;
		this.mID = mID;
		this.sPID = sPID;
		this.sName = sName;
		this.sPName = sPName;
		this.paymentMethod = paymentMethod;
		this.sAmount = sAmount;
		this.sDiscount = sDiscount;
		this.sBonus = sBonus;
		this.sTime = sTime;
		this.projectImage= projectImage;
		this.sAddress = sAddress;
		this.sPhone = sPhone;
		this.sEmail = sEmail;
		this.sTotal = sTotal;
	}






	public Integer getsID() {
		return sID;
	}

	public void setsID(Integer sID) {
		this.sID = sID;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public Integer getsAmount() {
		return sAmount;
	}

	public void setsAmount(Integer sAmount) {
		this.sAmount = sAmount;
	}

	public Integer getsDiscount() {
		return sDiscount;
	}

	public void setsDiscount(Integer sDiscount) {
		this.sDiscount = sDiscount;
	}

	public String getsTime() {
		return sTime;
	}

	public void setsTime(String sTime) {
		this.sTime = sTime;
	}


	public Integer getmID() {
		return mID;
	}


	public void setmID(Integer mID) {
		this.mID = mID;
	}




	public String getProjectImage() {
		return projectImage;
	}



	public void setProjectImage(String projectImage) {
		this.projectImage = projectImage;
	}




	public String getsName() {
		return sName;
	}



	public void setsName(String sName) {
		this.sName = sName;
	}



	public Integer getsBonus() {
		return sBonus;
	}



	public void setsBonus(Integer sBonus) {
		this.sBonus = sBonus;
	}







	public String getsPhone() {
		return sPhone;
	}










	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}










	public String getsEmail() {
		return sEmail;
	}










	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}










	public String getsAddress() {
		return sAddress;
	}







	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}





	public Integer getsTotal() {
		return sTotal;
	}





	public void setsTotal(Integer sTotal) {
		this.sTotal = sTotal;
	}



	public Integer getProposerID() {
		return proposerID;
	}



	public void setProposerID(Integer proposerID) {
		this.proposerID = proposerID;
	}
	
	
	

}
