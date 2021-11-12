package com.Gather.Sponsorship.service;

import java.util.List;
import java.util.Set;

import com.Gather.Project.model.ProjectBean;
import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.model.SponsorshipBean;

public interface SponsorshipService {
	
	SponsorshipBean getOrderByID(Integer sID);

	List<SponsorshipBean> getOrders();

	SponsorshipBean insertOrder(SponsorshipBean sBean);

	SponsorshipBean updateOrder(SponsorshipBean sBean);

	void deleteOrderByOrderID(int sID);
	
	
}
