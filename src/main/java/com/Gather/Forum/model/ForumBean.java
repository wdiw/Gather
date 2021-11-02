package com.Gather.Forum.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Forum")
public class ForumBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private String post;
	private String postTime; //T
	private String postUpdateTime; //T
	
	
	
	public ForumBean() {
	}
	
	public ForumBean(String name, String post) {
		this.name = name;
		this.post = post;
	}
	
	public ForumBean(Integer id, String name, String post) {
		this.id = id;
		this.name = name;
		this.post = post;
	}
	
	public ForumBean(String name, String post, String postTime) { //新
		this.name = name;
		this.post = post;
		this.postTime = postTime;
	}
	
	public ForumBean(Integer id, String name, String post, String postTime, String postUpdateTime) {//改
		this.id = id;
		this.name = name;
		this.post = post;
		this.postTime = postTime;
		this.postUpdateTime = postUpdateTime;
	}
	
//	public ForumBean(Integer id, String name, String post, String postUpdateTime) { //改T
//		this.id = id;
//		this.name = name;
//		this.post = post;
//		this.postUpdateTime = postUpdateTime;
//	}
	
	
	
	
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
	
	public String getPost() {
		return post;
	}
	
	public void setPost(String post) {
		this.post = post;
	}
	
	public String getPostTime() {
		return postTime;
	}
	
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
	
	public String getPostUpdateTime() {
		return postUpdateTime;
	}
	
	public void setPostUpdateTime(String postUpdateTime) {
		this.postUpdateTime = postUpdateTime;
	}
	
}
