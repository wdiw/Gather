package com.Gather.Sponsorship.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Gather.Sponsorship.model.FavoriteBean;



public interface FavoriteRepository extends JpaRepository<FavoriteBean, Integer>{

	@Query(value = " select * from Favorite where mID=:mID",nativeQuery = true)
	List<FavoriteBean> findByMemberID(Integer mID);
	
	@Query(value = " select * from Favorite where mID=:mID and pID=:pID",nativeQuery = true)
	FavoriteBean findByMemberIDAndProjectID(Integer mID,Integer pID);
	

}
