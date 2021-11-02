package com.Gather.member.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Member")
public class Member {
	@Id	
	@Column(name = "m_id")
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "m_name")
	private String  name;
	
	@Column(name = "m_status")
	private String  status;
	
	@Column(name = "m_account")
	private String  account;
	
	@Column(name = "m_password")
	private String  password;
	
	
	public Member() {
	}


	public Member(Integer id, String name, String status, String account, String password) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.account = account;
		this.password = password;
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


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", status=" + status + ", account=" + account + ", password="
				+ password + "]";
	}




	
	
}
