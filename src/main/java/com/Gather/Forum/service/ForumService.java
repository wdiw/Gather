package com.Gather.Forum.service;

import java.util.List;

import com.Gather.Forum.model.ForumBean;


public interface ForumService {
	
	//新增
	public void addForum(ForumBean fBean);
	
	//依據id刪單筆資料
	public void deleteForumById(Integer fID);
	
	//修改
	public void updateForum(ForumBean fBean);
	
	//找所有計畫資料
    List<ForumBean> getAllForum();
	
    //依據id 找單筆資料
	public ForumBean getForumById(Integer fID);
	
}
