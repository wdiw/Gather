package com.Gather.Project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Gather.Project.dao.ProjectPlanRepository;
import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.model.ProjectPlanBean;
import com.Gather.Project.service.ProjectPlanService;

@Repository
@Transactional
public class ProjectPlanServiceImpl implements ProjectPlanService {
	
	
	ProjectPlanRepository projectPlanRepository;
	
	@Autowired
	public ProjectPlanServiceImpl(ProjectPlanRepository projectPlanRepository) {
		super();
		this.projectPlanRepository = projectPlanRepository;
	}


	// 透過projectPlanID找，因為projectPlanID是Key值，不用實作方法
	@Override
	public ProjectPlanBean getProjectPlanByProjectPlanID(Integer projectPlanID) {
		
		return projectPlanRepository.getById(projectPlanID);
	}

	//透過ProjectBean找到所有ProjectPlan
	@Override
	public List<ProjectPlanBean> getProjectPlansByProjectBean(ProjectBean projectBean) {
		
		return projectPlanRepository.findProjectPlansByProjectBean(projectBean);
	}


	@Override
	public void updateProjecPlantAmountByprojectPlanID(Integer projectPlanID, Integer projectPlanAmount) {
		projectPlanRepository.updateProjecPlantAmountByprojectPlanID(projectPlanID, projectPlanAmount);
		
	}
	
	

}
