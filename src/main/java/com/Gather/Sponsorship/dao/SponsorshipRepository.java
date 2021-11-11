package com.Gather.Sponsorship.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.Gather.Sponsorship.model.SponsorshipBean;

public interface SponsorshipRepository extends JpaRepository<SponsorshipBean, Integer> {
	
}
