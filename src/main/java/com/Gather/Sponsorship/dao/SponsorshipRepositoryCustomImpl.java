package com.Gather.Sponsorship.dao;

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
import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.model.SponsorshipBean;

public class SponsorshipRepositoryCustomImpl implements SponsorshipRepositoryCustom {

	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public List<SponsorOrderBean> findSponsorshipBySearch(Set<String> searches) {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<SponsorOrderBean> query = cb.createQuery(SponsorOrderBean.class);
        Root<SponsorOrderBean> SponsorOrderBean = query.from(SponsorOrderBean.class);
        Path<String> reasultList = SponsorOrderBean.get("sPName");

        
        List<Predicate> predicates = new ArrayList<>();
        for (String search : searches) {
            predicates.add(cb.like(reasultList, search));
         
        }
        query.select(SponsorOrderBean)
            .where(cb.or(predicates.toArray(new Predicate[predicates.size()])));

        return entityManager.createQuery(query).getResultList();
	}

	@Override
	public List<SponsorOrderBean> findOrdersBySearch(Set<String> searches) {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<SponsorOrderBean> query = cb.createQuery(SponsorOrderBean.class);
        Root<SponsorOrderBean> SponsorOrderBean = query.from(SponsorOrderBean.class);
        Path<String> reasultList = SponsorOrderBean.get("sPName");

        
        List<Predicate> predicates = new ArrayList<>();
        for (String search : searches) {
            predicates.add(cb.like(reasultList, search));
         
        }
        query.select(SponsorOrderBean)
            .where(cb.or(predicates.toArray(new Predicate[predicates.size()])));

        return entityManager.createQuery(query).getResultList();
	}

}
