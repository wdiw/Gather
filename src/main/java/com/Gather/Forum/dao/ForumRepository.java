package com.Gather.Forum.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Gather.Forum.model.ForumBean;

public interface ForumRepository extends JpaRepository<ForumBean, Integer>{

}
