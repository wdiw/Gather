package com.Gather.Project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.model.ProjectPlanBean;

public interface ProjectPlanRepository extends JpaRepository<ProjectPlanBean, Integer> {

	//透過計畫Bean 找到所有方案
	@Query("select p from ProjectPlanBean p where p.projectBean = ?1  ")
	List<ProjectPlanBean> findProjectPlansByProjectBean(ProjectBean projectBean);
}
