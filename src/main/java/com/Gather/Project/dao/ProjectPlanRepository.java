package com.Gather.Project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Gather.Project.model.ProjectPlanBean;

public interface ProjectPlanRepository extends JpaRepository<ProjectPlanBean, Integer> {

	
}
