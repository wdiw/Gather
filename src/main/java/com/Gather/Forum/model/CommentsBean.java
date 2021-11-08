package com.Gather.Forum.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Comments")
public class CommentsBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberid;
	private String membername;
	@Column(columnDefinition = "nvarchar(max)") //通常不建議用，因為換資料庫的話這行指令不一定能用
	private String comment;
	private String commentTime;
	private String commentUpdateTime;
	
	
	
}
