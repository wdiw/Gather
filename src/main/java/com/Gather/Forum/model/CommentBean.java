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

import com.Gather.Project.model.ProjectBean;

@Entity
@Table(name = "Comment")
public class CommentBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer commentID; //留言id
	@Column(columnDefinition = "nvarchar(max)") //通常不建議用，因為換資料庫的話這行指令不一定能用
	private String comment; //留言
	private String commentTime; //留言時間
	private Integer commenterID; //留言人id
	private String commenter; //留言人
	
//	private Integer pID; //留言對應的project ID
	
	// 留言對應的project，刪掉這個project，所有留言要跟著被刪掉
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "pID")
	ProjectBean commentBean;
	
	
	//Constructors
	public CommentBean() {
	}
	
	public CommentBean(String commenter, String comment, String commentTime) {
		this.commenter = commenter;
		this.comment = comment;
		this.commentTime = commentTime;
	}
	

	public CommentBean(Integer commentID, String commenter, String comment, String commentTime) {
		this.commentID = commentID;
		this.commenter = commenter;
		this.comment = comment;
		this.commentTime = commentTime;
	}
	
	public CommentBean(String commenter, String comment, String commentTime, ProjectBean commentBean, Integer commentID) {
		this.commentID = commentID;
		this.comment = comment;
		this.commentTime = commentTime;
		this.commentBean = commentBean;
		this.commenter = commenter;
	}
	
	
	
	
	//Getters and Setters
	public Integer getCommentID() {
		return commentID;
	}

	public void setCommentID(Integer commentID) {
		this.commentID = commentID;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}

	public Integer getCommenterID() {
		return commenterID;
	}

	public void setCommenterID(Integer commenterID) {
		this.commenterID = commenterID;
	}

	public String getCommenter() {
		return commenter;
	}

	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}

	public ProjectBean getCommentBean() {
		return commentBean;
	}

	public void setCommentBean(ProjectBean commentBean) {
		this.commentBean = commentBean;
	}
	
	
}
