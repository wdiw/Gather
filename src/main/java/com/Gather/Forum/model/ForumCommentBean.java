package com.Gather.Forum.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "ForumComment")
public class ForumCommentBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer forumcommentID; //留言id
	private Integer forumcommenterID; //留言人id
	private String forumcommenter; //留言人
	@Column(columnDefinition = "nvarchar(max)") //通常不建議用，因為換資料庫的話這行指令不一定能用
	private String forumcomment; //留言
	private String forumcommentTime; //留言時間
	
	//T
	@Transient //不會在資料庫加這個欄位
	private Integer forumid; //留言對應的文章
	
	//留言對應的project，刪掉這個project，所有留言要跟著被刪掉
    //多對一
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "id")
	ForumBean forumBean;
	
	
	//Constructors
	public ForumCommentBean() {
	}
	
	public ForumCommentBean(Integer forumcommentID, String forumcommenter, String forumcomment, 
			String forumcommentTime) {
		this.forumcommentID = forumcommentID;
		this.forumcommenter = forumcommenter;
		this.forumcomment = forumcomment;
		this.forumcommentTime = forumcommentTime;
	}

	//C 新增留言
	public ForumCommentBean(String forumcommenter, String forumcomment, 
			String forumcommentTime, ForumBean forumBean, Integer forumcommenterID) {
		this.forumcommenter = forumcommenter;
		this.forumcomment = forumcomment;
		this.forumcommentTime = forumcommentTime;
		this.forumBean=forumBean;
		this.forumcommenterID = forumcommenterID;
	}
	
	
	
	
	
	//Getters and Setters
	public Integer getForumcommentID() {
		return forumcommentID;
	}


	public void setForumcommentID(Integer forumcommentID) {
		this.forumcommentID = forumcommentID;
	}


	public String getForumcommenter() {
		return forumcommenter;
	}


	public void setForumcommenter(String forumcommenter) {
		this.forumcommenter = forumcommenter;
	}


	public String getForumcomment() {
		return forumcomment;
	}


	public void setForumcomment(String forumcomment) {
		this.forumcomment = forumcomment;
	}


	public String getForumcommentTime() {
		return forumcommentTime;
	}


	public void setForumcommentTime(String forumcommentTime) {
		this.forumcommentTime = forumcommentTime;
	}


	public ForumBean getForumBean() {
		return forumBean;
	}


	public void setForumcommentBean(ForumBean forumBean) {
		this.forumBean = forumBean;
	}
	
	
	public Integer getForumid() {
		return forumid;
	}

	public void setForumid(Integer forumid) {
		this.forumid = forumid;
	}

	public Integer getForumcommenterID() {
		return forumcommenterID;
	}

	public void setForumcommenterID(Integer forumcommenterID) {
		this.forumcommenterID = forumcommenterID;
	}
	
	
	
	
	
}
