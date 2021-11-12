package com.Gather.Forum.service;

import java.util.List;

import com.Gather.Forum.model.ForumBean;
import com.Gather.Forum.model.ForumCommentBean;


public interface ForumCommentService {
	
	//新增
	public void addForumComment(ForumCommentBean forumcommentBean);
	
	//依據id刪單筆資料
	public void deleteForumCommentByForumCommentId(Integer forumcommentID);
	
	//修改
	public void updateForumComment(ForumCommentBean forumcommentBean);
	
	//找所有計畫資料
    List<ForumCommentBean> getAllForumComment();
	
    //依據id 找單筆資料
	public ForumCommentBean getForumCommentByForumCommentId(Integer forumcommentID);
	
	//一對多留言
	List<ForumCommentBean> findForumCommentbyforumid (ForumBean forumId);
	
}
