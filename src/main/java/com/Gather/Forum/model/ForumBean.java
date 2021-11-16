package com.Gather.Forum.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Forum")
public class ForumBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id; //要改成postid 文章id
	private String name; //要改成title 文章標題
	@Column(columnDefinition = "nvarchar(max)") //通常不建議用，因為換資料庫的話這行指令不一定能用
	private String post;
	private String postTime;
	private String postUpdateTime;
	private String postCategory;
	private String poster; //發文人
	@Column(name = "posterId")
	private Integer posterID; //發文人id
	

	
	//一對多
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy ="forumBean", cascade = CascadeType.ALL )
	private Set<ForumCommentBean> forumcomment=new LinkedHashSet<ForumCommentBean>(0);
	
	
	
	//Constructors
	public ForumBean() {
	}
	
	//舊C
	public ForumBean(String name, String post, String postTime) {
		this.name = name;
		this.post = post;
		this.postTime = postTime;
	}
	
	//新C
	public ForumBean(String postCategory,String name, String post, 
			String postTime, String postUpdateTime, String poster) {
		this.postCategory = postCategory;
		this.name = name;
		this.post = post;
		this.postTime = postTime;
		this.postUpdateTime = postUpdateTime;
		this.poster = poster;
		
	}
	
	//新C T
	public ForumBean(String postCategory,String name, String post, 
			String postTime, String postUpdateTime, String poster, Integer posterID) {
		this.postCategory = postCategory;
		this.name = name;
		this.post = post;
		this.postTime = postTime;
		this.postUpdateTime = postUpdateTime;
		this.poster = poster;
		this.posterID = posterID;
	}
	
	//舊U
	public ForumBean(Integer id, String name, String post, String postTime, String postUpdateTime) {
		this.id = id;
		this.name = name;
	}
	
	//新U
	public ForumBean(Integer id, String postCategory, String name, 
			String post, String postTime, String postUpdateTime, String poster,Integer posterID) {
		this.id = id;
		this.name = name;
		this.post = post;
		this.postTime = postTime;
		this.postUpdateTime = postUpdateTime;
		this.postCategory = postCategory;
		this.poster=poster;
		this.posterID=posterID;
	}
	
	
	
	//Getters and Setters
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

//	public String getfImageCover() { //T
//		return fImageCover;
//	}
//
//	public void setfImageCover(String fImageCover) { //T
//		this.fImageCover = fImageCover;
//	}
	
	public String getPoster() {
		return poster;
	}
	
	public void setPoster(String poster) {
		this.poster = poster;
	}
	
	public String getPostCategory() {
		return postCategory;
	}
	
	public void setPostCategory(String postCategory) {
		this.postCategory = postCategory;
	}

	public Integer getPosterID() {
		return posterID;
	}
	
	public void setPosterID(Integer posterID) {
		this.posterID = posterID;
	}
	
	public Set<ForumCommentBean> getForumcomment() {
		return forumcomment;
	}
	
	public void setForumcomment(Set<ForumCommentBean> forumcomment) {
		this.forumcomment = forumcomment;
	}
	
	
}
