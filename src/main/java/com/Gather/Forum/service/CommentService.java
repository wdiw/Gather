package com.Gather.Forum.service;

import java.util.List;

import com.Gather.Forum.model.CommentBean;


public interface CommentService {
	
	//新增
	public void addComment(CommentBean commentBean);
	
	//依據id刪單筆資料
	public void deleteCommentByCommentId(Integer commentID);
	
	//修改
	public void updateComment(CommentBean commentBean);
	
	//找所有計畫資料
    List<CommentBean> getAllComment();
	
    //依據id 找單筆資料
	public CommentBean getCommentByCommentId(Integer commentID);
	
}
