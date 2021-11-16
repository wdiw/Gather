package com.Gather.Sponsorship.service;

import java.util.List;
import java.util.Set;

import com.Gather.Sponsorship.model.FavoriteBean;
import com.Gather.Sponsorship.model.SponsorOrderBean;

public interface SponsorOrderService {

	List<SponsorOrderBean> getOrders();

	List<SponsorOrderBean> getOrdersByMemberID(Integer mID);

	SponsorOrderBean insertOrder(SponsorOrderBean sBean);

	SponsorOrderBean getOrderBySponsorshipID(Integer sID);

	List<SponsorOrderBean> getOrdersByProposerID(Integer proposerID);

	SponsorOrderBean updateOrder(SponsorOrderBean sBean);

	List<SponsorOrderBean> getOrdersByPIDAndStatus(Integer pID, String status);

	FavoriteBean insertFavorite(FavoriteBean favoriteBean);

	void deleteFavorite(FavoriteBean favoriteBean);

	List<FavoriteBean> getFavoriteByMemberID(Integer mID);

	FavoriteBean getFavoriteByMemberIDAndProjectID(Integer mID, Integer pID);

	List<SponsorOrderBean> getSponsorshipBySearch(Set<String> search);

	void updateOrderBysID(Integer sID, String sName, String sAddress, String sPhone, String sEmail);

	void deleteBysID(Integer sID);
	
//	List<SponsorOrderBean> getOrdersBySearch(Set<String> search);
	
	List<SponsorOrderBean> getOrdersByPID(Integer pID);
	
	void updateAmountNowBysPID(Integer sPID,Integer pAmountNow);

}
