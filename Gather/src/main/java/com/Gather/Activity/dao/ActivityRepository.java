package com.Gather.Activity.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Gather.Activity.model.ActivityBean;

public interface ActivityRepository extends JpaRepository<ActivityBean,Integer > {

}


