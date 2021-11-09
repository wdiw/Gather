package com.Gather.Sponsorship.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.Gather.Sponsorship.model.FavoriteBean;
import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.model.SponsorshipBean;
import com.Gather.member.entity.Member;

public interface SponsorOrderService {

	List<SponsorOrderBean> getOrders();

	List<SponsorOrderBean> getOrdersByMemberID(Integer mID);

	SponsorOrderBean insertOrder(SponsorOrderBean sBean);
	
	SponsorOrderBean getOrderBySponsorshipID(Integer sID);

	List<SponsorOrderBean> getOrdersByProposerID(Integer proposerID);
	
	SponsorOrderBean updateOrder(SponsorOrderBean sBean);
	
	List<SponsorOrderBean> getOrdersByPIDAndStatus(Integer pID,String status);
	
	FavoriteBean insertFavorite(FavoriteBean favoriteBean);
	
	void deleteFavorite(FavoriteBean favoriteBean);
	

	List<FavoriteBean> getFavoriteByMemberID(Integer mID);
	
	FavoriteBean getFavoriteByMemberIDAndProjectID(Integer mID,Integer pID);

}
