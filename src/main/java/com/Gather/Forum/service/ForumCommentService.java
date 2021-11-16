package com.Gather.Forum.service;

import java.util.List;

import com.Gather.Forum.model.ForumBean;
import com.Gather.Forum.model.ForumCommentBean;


public interface ForumCommentService {
	
	//R all
	List<ForumCommentBean> getAllForumComment();
	
	//R by id
	public ForumCommentBean getForumCommentByForumCommentId(Integer forumcommentID);
	
	//C
	public void addForumComment(ForumCommentBean forumcommentBean);
	
	//U
	public void updateForumComment(ForumCommentBean forumcommentBean);
	
	//D
	public void deleteForumCommentByForumCommentId(Integer forumcommentID);
	
	//一對多留言
	List<ForumCommentBean> findForumCommentbyforumid (ForumBean forumId);
	
}
