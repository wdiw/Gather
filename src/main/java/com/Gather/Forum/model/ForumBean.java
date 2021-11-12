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

@Entity
@Table(name = "Forum")
public class ForumBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id; //要改成postid
	private String name; //要改成title
	@Column(columnDefinition = "nvarchar(max)") //通常不建議用，因為換資料庫的話這行指令不一定能用
	private String post;
	private String postTime;
	private String postUpdateTime;
	private String postCategory;
	private String poster;
	
	
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
	
	
	

	private String fImageCover;
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy ="forumBean",cascade = CascadeType.ALL )
    private Set<ForumCommentBean> forumcomment=new LinkedHashSet<ForumCommentBean>(0);
	
    public Set<ForumCommentBean> getForumcomment() {
		return forumcomment;
	}

	public void setForumcomment(Set<ForumCommentBean> forumcomment) {
		this.forumcomment = forumcomment;
	}
	
	
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
	
	//舊U
	public ForumBean(Integer id, String name, String post, String postTime, String postUpdateTime) {
		this.id = id;
		this.name = name;
		this.post = post;
		this.postTime = postTime;
		this.postUpdateTime = postUpdateTime;
	}
	
	//新U
	public ForumBean(Integer id, String postCategory, String name, 
			String post, String postTime, String postUpdateTime, String poster) {
		this.id = id;
		this.name = name;
		this.post = post;
		this.postTime = postTime;
		this.postUpdateTime = postUpdateTime;
		this.postCategory = postCategory;
		this.poster = poster;
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

	public String getfImageCover() {
		return fImageCover;
	}

	public void setfImageCover(String fImageCover) {
		this.fImageCover = fImageCover;
	}
	
	
	
}
