package com.Gather.Sponsorship.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.model.SponsorshipBean;

public interface SponsorOrderService {

	List<SponsorOrderBean> getOrders();

	List<SponsorOrderBean> getOrdersByMemberID(Integer mID);

	SponsorOrderBean insertOrder(SponsorOrderBean sBean);
	
	SponsorOrderBean getOrderBySponsorshipID(Integer sID);

	List<SponsorOrderBean> getOrdersByProposerID(Integer proposerID);
	
	SponsorOrderBean updateOrder(SponsorOrderBean sBean);

}
