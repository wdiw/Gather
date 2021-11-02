package com.Gather.Project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Gather.Project.model.ProjectBean;

public interface ProjectRepository extends JpaRepository<ProjectBean,Integer > {
	
	

	//由會員ID找到他所提的所有計畫
	List<ProjectBean>  findBymID(Integer mID);
}
