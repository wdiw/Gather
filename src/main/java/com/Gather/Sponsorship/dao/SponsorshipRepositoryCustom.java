package com.Gather.Sponsorship.dao;

import java.util.List;
import java.util.Set;

import com.Gather.Sponsorship.model.SponsorOrderBean;


public interface SponsorshipRepositoryCustom {

	List<SponsorOrderBean> findSponsorshipBySearch(Set<String> search);
//	List<SponsorOrderBean> findOrdersBySearch(Set<String> search);
}
