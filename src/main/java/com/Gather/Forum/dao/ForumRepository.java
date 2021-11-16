package com.Gather.Forum.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Gather.Forum.model.ForumBean;

public interface ForumRepository extends JpaRepository<ForumBean, Integer>, ForumRepositoryCustom{
	
	//文章分類
	List<ForumBean> findByPostCategory(String forumcategory);
	
	//會員分類 T
	List<ForumBean> findByPosterID(Integer posterID);
	
	//文章倒序排列
	@Query(value="select * from Forum order by id desc", nativeQuery=true) //nativeQuery=true代表原生SQL語法必寫
	List<ForumBean> findByIdOrderByIdDesc();
	
}
