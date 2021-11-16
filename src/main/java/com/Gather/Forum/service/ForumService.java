package com.Gather.Forum.service;

import java.util.List;
import java.util.Set;

import com.Gather.Forum.model.ForumBean;


public interface ForumService {
	
	//R all
	List<ForumBean> getAllForum();
	
	//R by id
	public ForumBean getForumById(Integer fID);
	
	//C
	public void addForum(ForumBean fBean);
	
	//U
	public void updateForum(ForumBean fBean);
	
	//D by id
	public void deleteForumById(Integer fID);
	
	//文章搜尋
	List<ForumBean> findforumBytitle(Set<String> forumtitles);
	
	//文章分類
	List<ForumBean> findByPostCategory(String forumcategory);
	
	//會員分類 T
	List<ForumBean> getAllByPosterId(Integer posterID);
	
	//文章倒序排列
	List<ForumBean> findByIdOrderByIdDesc();
	
	
}
