package com.Gather.Sponsorship.service;

import java.util.List;


import com.Gather.Sponsorship.model.SponsorshipBean;

public interface SponsorshipService {
	
	SponsorshipBean getOrderByID(Integer sID);

	List<SponsorshipBean> getOrders();

	SponsorshipBean insertOrder(SponsorshipBean sBean);

	SponsorshipBean updateOrder(SponsorshipBean sBean);

	void deleteOrderByOrderID(int sID);
	
}
