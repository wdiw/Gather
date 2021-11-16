package com.Gather.Forum.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.Gather.Forum.model.ForumBean;

public class ForumRepositoryCustomImpl implements ForumRepositoryCustom {

	
	@PersistenceContext
	private EntityManager entityManager;
	
	//標題搜尋
	@Override
	public List<ForumBean> findforumBytitle(Set<String> forumtitles) {
		
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<ForumBean> query = cb.createQuery(ForumBean.class);
		Root<ForumBean> forumBean = query.from(ForumBean.class);
		
		Path<String> titlepath = forumBean.get("name");
		
		List<Predicate> predicates = new ArrayList<>();
		for (String forumtitle : forumtitles) {
			predicates.add(cb.like(titlepath, forumtitle));
		}
		query.select(forumBean)
		.where(cb.or(predicates.toArray(new Predicate[predicates.size()])));
		
		return entityManager.createQuery(query)
				.getResultList();
		
	}
	
	
	
}
	


