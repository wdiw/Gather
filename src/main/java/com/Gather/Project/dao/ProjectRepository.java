package com.Gather.Project.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Gather.Project.model.ProjectBean;

public interface ProjectRepository extends JpaRepository<ProjectBean,Integer > {
	
	

}
