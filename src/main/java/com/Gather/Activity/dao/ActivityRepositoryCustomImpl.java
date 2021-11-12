package com.Gather.Activity.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.Gather.Activity.model.ActivityBean;

public class ActivityRepositoryCustomImpl implements ActivityRepositoryCustom{
	@PersistenceContext
	 private EntityManager entityManager;
	
	
	@Override
	public List<ActivityBean> searchActivity(Set<String> names) {
		 CriteriaBuilder cb = entityManager.getCriteriaBuilder();
	        CriteriaQuery<ActivityBean> query = cb.createQuery(ActivityBean.class);
	        Root<ActivityBean> activityBean = query.from(ActivityBean.class);

	        javax.persistence.criteria.Path<String> namepath = activityBean.get("name");

	        List<Predicate> predicates = new ArrayList<>();
	        for (String name : names) {
	            predicates.add(cb.like(namepath, name));
	        }
	        query.select(activityBean)
	            .where(cb.or(predicates.toArray(new Predicate[predicates.size()])));

	        return entityManager.createQuery(query)
	            .getResultList();
	    }
	
	
	
	
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
}
