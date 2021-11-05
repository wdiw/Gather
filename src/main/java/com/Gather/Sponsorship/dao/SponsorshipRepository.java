package com.Gather.Sponsorship.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Gather.Sponsorship.model.SponsorshipBean;

public interface SponsorshipRepository extends JpaRepository<SponsorshipBean, Integer> {
	
}
