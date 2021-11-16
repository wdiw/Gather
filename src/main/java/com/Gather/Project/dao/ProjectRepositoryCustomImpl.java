package com.Gather.Project.dao;

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

import com.Gather.Project.model.ProjectBean;

public class ProjectRepositoryCustomImpl implements ProjectRepositoryCustom {

	@PersistenceContext
    private EntityManager entityManager;
	
	
	
	@Override
	public List<ProjectBean> findProjectBySearch(Set<String> searches) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<ProjectBean> query = cb.createQuery(ProjectBean.class);
        Root<ProjectBean> projectBean = query.from(ProjectBean.class);
        Path<String> reasultList = projectBean.get("pName");
//        Path<String> pass = projectBean.get("pName");
        
        List<Predicate> predicates = new ArrayList<>();
        for (String search : searches) {
            predicates.add(cb.like(reasultList, search));
           // predicates.add(cb.and());
        }
        query.select(projectBean)
            .where(cb.or(predicates.toArray(new Predicate[predicates.size()])));

        return entityManager.createQuery(query).getResultList();
    }

}
