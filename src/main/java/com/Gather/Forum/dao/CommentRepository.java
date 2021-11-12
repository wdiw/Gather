package com.Gather.Forum.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Gather.Forum.model.CommentBean;

public interface CommentRepository extends JpaRepository<CommentBean, Integer>{

}
