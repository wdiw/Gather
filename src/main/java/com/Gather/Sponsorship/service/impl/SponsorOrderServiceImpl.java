package com.Gather.Sponsorship.service.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Gather.Sponsorship.dao.FavoriteRepository;
import com.Gather.Sponsorship.dao.SponsorOrderRepository;
import com.Gather.Sponsorship.model.FavoriteBean;
import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.model.SponsorshipBean;

import com.Gather.Sponsorship.service.SponsorOrderService;
import com.Gather.member.entity.Member;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Repository
@Transactional
public class SponsorOrderServiceImpl implements SponsorOrderService{

	SponsorOrderRepository sponsorOrderRepository;
	FavoriteRepository favoriteRepository;
	

	@Autowired
	public SponsorOrderServiceImpl(SponsorOrderRepository sponsorOrderRepository,
			FavoriteRepository favoriteRepository) {
		this.sponsorOrderRepository = sponsorOrderRepository;
		this.favoriteRepository = favoriteRepository;
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

	@Override
	public List<SponsorOrderBean> getOrdersByPIDAndStatus(Integer pID,String status) {
		return sponsorOrderRepository.findBysPIDAndStatus(pID,status);
	}

	@Override
	public FavoriteBean insertFavorite(FavoriteBean favoriteBean) {
		return favoriteRepository.save(favoriteBean);
	}


	@Override
	public void deleteFavorite(FavoriteBean favoriteBean) {
		favoriteRepository.delete(favoriteBean);
	}


	@Override
	public List<FavoriteBean> getFavoriteByMemberID(Integer mID) {
		return favoriteRepository.findByMemberID(mID);
	}


	@Override
	public FavoriteBean getFavoriteByMemberIDAndProjectID(Integer mID, Integer pID) {
		return favoriteRepository.findByMemberIDAndProjectID(mID, pID);
	}


	@Override
	public List<SponsorOrderBean> getSponsorshipBySearch(Set<String> search) {
		return sponsorOrderRepository.findSponsorshipBySearch(search);
	}


	@Override
	public void updateOrderBysID(Integer sID, String sName, String sAddress, String sPhone, String sEmail) {
		sponsorOrderRepository.updateOrders(sID, sName, sAddress, sPhone, sEmail);
	}


	@Override
	public void deleteBysID(Integer sID) {
		sponsorOrderRepository.deleteById(sID);
	}


	@Override
	public List<SponsorOrderBean> getOrdersBySearch(Set<String> search) {
		return sponsorOrderRepository.findOrdersBySearch(search);
	}


	@Override
	public List<SponsorOrderBean> getOrdersByPID(Integer pID) {
		return sponsorOrderRepository.findBysPID(pID);
	}


	

}
