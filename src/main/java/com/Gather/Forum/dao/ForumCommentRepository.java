package com.Gather.Forum.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Gather.Forum.model.ForumBean;
import com.Gather.Forum.model.ForumCommentBean;



public interface ForumCommentRepository extends JpaRepository<ForumCommentBean, Integer>{

	@Query("Select p from ForumCommentBean p where p.forumBean=?1")
	List<ForumCommentBean> findForumCommentbyforumid (ForumBean forumId);
	
	
}
