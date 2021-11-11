package com.Gather.Sponsorship.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.Gather.Sponsorship.model.SponsorOrderBean;

public interface SponsorOrderRepository extends JpaRepository<SponsorOrderBean, Integer>,SponsorshipRepositoryCustom {
	List<SponsorOrderBean> findBymID(Integer mID);
	List<SponsorOrderBean> findByproposerID(Integer proposerID);
	SponsorOrderBean findBysID(Integer sID);
	List<SponsorOrderBean> findBysPIDAndStatus(Integer pID,String status);
	
	@Modifying
	@Query("update SponsorOrderBean s set s.sName=?2,s.sAddress=?3,s.sPhone=?4,s.sEmail=?5 where  s.sID=?1")
	void updateOrders(Integer sID,String sName,String sAddress,String sPhone,String sEmail);
	
	List<SponsorOrderBean> findBysPID(Integer pID);
}
