package com.Gather.Sponsorship.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Gather.Sponsorship.model.SponsorOrderBean;

public interface SponsorOrderRepository extends JpaRepository<SponsorOrderBean, Integer> {

}
