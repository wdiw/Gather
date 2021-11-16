package com.Gather.Forum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Gather.Forum.dao.ForumCommentRepository;
import com.Gather.Forum.model.ForumBean;
import com.Gather.Forum.model.ForumCommentBean;
import com.Gather.Forum.service.ForumCommentService;

@Repository
@Transactional
public class ForumCommentServiceImpl implements ForumCommentService {
	
	ForumCommentRepository forumcommentRepository;
	
	@Autowired
	public ForumCommentServiceImpl (ForumCommentRepository forumcommentRepository) {
		super();
		this.forumcommentRepository = forumcommentRepository;
		
	}
	
	
	//R all
	@Override
	public List<ForumCommentBean> getAllForumComment() {
		return forumcommentRepository.findAll();
	}
	
	//R by id
	@Override
	public ForumCommentBean getForumCommentByForumCommentId(Integer forumcommentID) {
		return forumcommentRepository.getById(forumcommentID);
	}
	
	//C
	@Override
	public void addForumComment(ForumCommentBean forumcommentBean ) {
		forumcommentRepository.save(forumcommentBean);
	}
	
	//U
	@Override
	public void updateForumComment(ForumCommentBean forumcommentBean ) {
		forumcommentRepository.save(forumcommentBean);
	}
	
//	//D
//	@Override
//	public void deleteForumCommentByForumCommentId(Integer forumcommentID) {
//		forumcommentRepository.deleteById(forumcommentID);
//	}
	
	//D 內建的失效，自行改寫
	@Override
	public void deleteForumCommentByForumCommentId(Integer forumcommentID) {
		forumcommentRepository.deleteForumCommentByForumCommentIdo(forumcommentID);
	}
	
	//留言
	@Override
	public List<ForumCommentBean> findForumCommentbyforumid(ForumBean forumId) {
		return forumcommentRepository.findForumCommentbyforumid(forumId);
	}
	
}
