package com.Gather.Sponsorship.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Gather.Sponsorship.model.SponsorOrderBean;

public interface SponsorOrderRepository extends JpaRepository<SponsorOrderBean, Integer> {
	List<SponsorOrderBean> findBymID(Integer mID);
	List<SponsorOrderBean> findByproposerID(Integer proposerID);
	SponsorOrderBean findBysID(Integer sID);
	
}
