package com.Gather.Sponsorship.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Gather.Sponsorship.dao.SponsorshipRepository;
import com.Gather.Sponsorship.model.SponsorshipBean;
import com.Gather.Sponsorship.service.SponsorshipService;

@Repository
@Transactional
public class SponsorshipServiceImpl implements SponsorshipService {

	SponsorshipRepository sponsorshipRepository;

	@Autowired
	public SponsorshipServiceImpl(SponsorshipRepository sponsorshipRepository) {
		this.sponsorshipRepository = sponsorshipRepository;
	}

	@Override
	public SponsorshipBean getOrderByID(Integer sID) {
		SponsorshipBean sBean = sponsorshipRepository.getById(sID);
		return sBean;
	}

	@Override
	public List<SponsorshipBean> getOrders() {
		return sponsorshipRepository.findAll();
	}

	@Override
	public SponsorshipBean insertOrder(SponsorshipBean sBean) {
		return sponsorshipRepository.save(sBean);
	}

	@Override
	public SponsorshipBean updateOrder(SponsorshipBean sBean) {
		return sponsorshipRepository.saveAndFlush(sBean);
	}

	@Override
	public void deleteOrderByOrderID(int sID) {
		sponsorshipRepository.deleteById(sID);
	}
	
	

}
