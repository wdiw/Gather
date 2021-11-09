package com.Gather.Project.service;

import java.util.List;

import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.model.ProjectPlanBean;

public interface ProjectPlanService {

	
		//依據id 找單筆方案資料
		public ProjectPlanBean getProjectPlanByProjectPlanID(Integer projectPlanID);
		
		//透過ProjectBean找到所有ProjectPlan
		List<ProjectPlanBean> getProjectPlansByProjectBean(ProjectBean projectBean);
}
