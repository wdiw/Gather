package com.Gather.Sponsorship.service.impl;


import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Gather.Sponsorship.dao.SponsorOrderRepository;
import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.service.SponsorOrderService;

@Repository
@Transactional
public class SponsorOrderServiceImpl implements SponsorOrderService {

	SponsorOrderRepository sponsorOrderRepository;
	
	@Override
	public List<SponsorOrderBean> getOrdersByMemberID(Integer mID) {
		return sponsorOrderRepository.findAll();
	}

	@Override
	public SponsorOrderBean insertOrder(SponsorOrderBean sBean) {
		return sponsorOrderRepository.save(sBean);
	}

}
