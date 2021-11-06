package com.Gather.Sponsorship.service.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Gather.Sponsorship.dao.SponsorOrderRepository;
import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.model.SponsorshipBean;

import com.Gather.Sponsorship.service.SponsorOrderService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Repository
@Transactional
public class SponsorOrderServiceImpl implements SponsorOrderService {

	SponsorOrderRepository sponsorOrderRepository;

	@Autowired
	public SponsorOrderServiceImpl(SponsorOrderRepository sponsorOrderRepository) {
		this.sponsorOrderRepository = sponsorOrderRepository;
	}

	@Override
	public List<SponsorOrderBean> getOrdersByMemberID(Integer mID) {
		return sponsorOrderRepository.findBymID(mID);
	}

	@Override
	public SponsorOrderBean insertOrder(SponsorOrderBean sBean) {
		return sponsorOrderRepository.save(sBean);
	}

	@Override
	public List<SponsorOrderBean> getOrders() {
		return sponsorOrderRepository.findAll();
	}

	@Override
	public List<SponsorOrderBean> getOrdersByProposerID(Integer proposerID) {
		return sponsorOrderRepository.findByproposerID(proposerID);
	}

	@Override
	public SponsorOrderBean updateOrder(SponsorOrderBean sBean) {
		return sponsorOrderRepository.save(sBean);
	}

	@Override
	public SponsorOrderBean getOrderBySponsorshipID(Integer sID) {
		return sponsorOrderRepository.findBysID(sID);
	}


}
