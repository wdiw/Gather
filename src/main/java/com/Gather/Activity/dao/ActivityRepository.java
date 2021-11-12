package com.Gather.Activity.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Gather.Activity.model.ActivityBean;




public interface ActivityRepository extends JpaRepository<ActivityBean,Integer >,ActivityRepositoryCustom {

	@Query("select p from ActivityBean p where  p.category = ?1 ")
	List<ActivityBean>  findActivityByCategory(String category);
	 
	
	
}


