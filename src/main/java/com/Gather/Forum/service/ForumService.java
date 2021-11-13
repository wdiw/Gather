package com.Gather.Forum.service;

import java.util.List;
import java.util.Set;

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
	
	//搜尋
	List<ForumBean> findforumBytitle(Set<String> forumtitles);
	
	//搜尋
	List<ForumBean> findByPostCategory(String forumcategory);
	
//	//倒序排列
//	List<ForumBean> findByIdOrderByidDesc();
	
	
}
