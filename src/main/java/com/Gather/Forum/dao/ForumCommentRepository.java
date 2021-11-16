package com.Gather.Forum.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.Gather.Forum.model.ForumBean;
import com.Gather.Forum.model.ForumCommentBean;



public interface ForumCommentRepository extends JpaRepository<ForumCommentBean, Integer> {
	
	//文章留言
	@Query("Select p from ForumCommentBean p where p.forumBean=?1")
	List<ForumCommentBean> findForumCommentbyforumid (ForumBean forumId);
	
//	//刪除的改寫 T
//	@Query(value = "DELETE FROM ForumComment WHERE forumcommentID=:forumcommentID", nativeQuery=true)
//	void deleteForumCommentByForumCommentIdo(Integer forumcommentID);
	
	//內建刪除的改寫
	@Modifying
	@Query("Delete from ForumCommentBean p where  p.forumcommentID = ?1 ")
	void deleteForumCommentByForumCommentIdo(Integer forumcommentID);
	
	
}
