package com.Gather.Forum.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Gather.Forum.model.ForumBean;

public interface ForumRepository extends JpaRepository<ForumBean, Integer>,ForumRepositoryCustom{
	
	//分類
	List<ForumBean> findByPostCategory(String forumcategory);
	
//	//倒序排列
//	List<ForumBean> findByIdOrderByidDesc();
	
}
