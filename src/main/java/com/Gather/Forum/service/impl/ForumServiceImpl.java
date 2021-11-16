package com.Gather.Forum.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Gather.Forum.dao.ForumRepository;
import com.Gather.Forum.model.ForumBean;
import com.Gather.Forum.service.ForumService;

@Repository
@Transactional
public class ForumServiceImpl implements ForumService {
	
	ForumRepository forumRepository;
	
	@Autowired
	public ForumServiceImpl (ForumRepository forumRepository) {
		super();
		this.forumRepository = forumRepository;
		
	}
	
	
	//R all
	@Override
	public List<ForumBean> getAllForum() {
		return forumRepository.findAll();
	}
	
	//R by id
	@Override
	public ForumBean getForumById(Integer fID) {
		return forumRepository.getById(fID);
	}
	
	//C
	@Override
	public void addForum(ForumBean fBean ) {
		forumRepository.save(fBean);
	}
	
	//U
	@Override
	public void updateForum(ForumBean fBean ) {
		forumRepository.save(fBean);
	}
	
	//D
	@Override
	public void deleteForumById(Integer fID) {
		forumRepository.deleteById(fID);
	}
	
	//文章搜尋
	@Override
	public List<ForumBean> findforumBytitle(Set<String> forumtitles) {
		return forumRepository.findforumBytitle(forumtitles);
	}
	
	//文章分類
	@Override
	public List<ForumBean> findByPostCategory(String forumcategory) {
		return forumRepository.findByPostCategory(forumcategory);
	}
	
	//會員分類 T
	@Override
	public List<ForumBean> getAllByPosterId(Integer posterID) {
		return forumRepository.findByPosterID(posterID);
	}
	
	//文章倒序排列
	@Override
	public List<ForumBean> findByIdOrderByIdDesc() {
		return forumRepository.findByIdOrderByIdDesc();
	}
	
	
}
