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
	//最新
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
	
	@Column(name = "m_address")
	private String  address;
	
	@Column(name = "m_sexual")
	private String  sexual;
	
	@Column(name = "m_birthday")
	private String  birthday;
	
	public Member() {
	}

	public Member(Integer id, String name, String status, String account, String password, String address,
			String sexual, String birthday) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.account = account;
		this.password = password;
		this.address = address;
		this.sexual = sexual;
		this.birthday = birthday;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSexual() {
		return sexual;
	}

	public void setSexual(String sexual) {
		this.sexual = sexual;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", status=" + status + ", account=" + account + ", password="
				+ password + ", address=" + address + ", sexual=" + sexual + ", birthday=" + birthday + "]";
	}
	
	


	
}
