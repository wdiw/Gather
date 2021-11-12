package com.Gather.Activity.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Gather.Activity.dao.ActivityRepository;
import com.Gather.Activity.model.ActivityBean;
import com.Gather.Activity.service.ActivityService;

@Repository
@Transactional
public class ActivityServiceImpl implements ActivityService {
	@PersistenceContext
    private EntityManager entityManager;
	ActivityRepository activityRepository;

	@Autowired
	public ActivityServiceImpl(ActivityRepository activityRepository) {
		super();
		this.activityRepository = activityRepository;
	}

	// 找所有資料
	@Override
	public List<ActivityBean> getAllActivity() {
		return activityRepository.findAll();
	}

	// 透過id找
	// Optional 為容器類別，代表若回傳是null，也可以處理，不用特別寫if去判斷
	@Override
	public ActivityBean getActivityById(Integer id) {
		
		return activityRepository.getById(id);
	}

	//新增
	@Override
	public void addActivity(ActivityBean activityBean ) {
		activityRepository.save(activityBean);
	}

	//修改
	@Override
	public void updateActivity(ActivityBean activityBean) {
		activityRepository.save(activityBean);
		

	}

	//透過id刪除計畫
	@Override
	public void deleteActivityById(Integer id) {
		 activityRepository.deleteById(id);
	}
	
	
	
	
	
	

	@Override
	public List<ActivityBean> searchActivity(Set<String> names) {
		// TODO Auto-generated method stub
		List<ActivityBean> list=activityRepository.searchActivity(names);
		
		return list;
	}

	@Override
	public List<ActivityBean> findActivityByCategory(String category) {
		// TODO Auto-generated method stub
		return activityRepository.findActivityByCategory(category);
	}
	
	
		
		
		
	}
	
	
	
	
	
	
	




