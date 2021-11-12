package com.Gather.Forum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Gather.Forum.dao.CommentRepository;
import com.Gather.Forum.model.CommentBean;
import com.Gather.Forum.service.CommentService;

@Repository
@Transactional
public class CommentServiceImpl implements CommentService {
	
	CommentRepository commentRepository;
	
	@Autowired
	public CommentServiceImpl (CommentRepository commentRepository) {
		super();
		this.commentRepository = commentRepository;
		
	}
	
	
	//R all
	@Override
	public List<CommentBean> getAllComment() {
		return commentRepository.findAll();
	}
	
	//R by id
	@Override
	public CommentBean getCommentByCommentId(Integer commentID) {
		return commentRepository.getById(commentID);
	}
	
	//C
	@Override
	public void addComment(CommentBean commentBean ) {
		commentRepository.save(commentBean);
	}
	
	//U
	@Override
	public void updateComment(CommentBean commentBean ) {
		commentRepository.save(commentBean);
	}
	
	//D
	@Override
	public void deleteCommentByCommentId(Integer commentID) {
		commentRepository.deleteById(commentID);
	}
	
}
