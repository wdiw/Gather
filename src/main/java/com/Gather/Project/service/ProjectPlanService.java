package com.Gather.Project.service;

import com.Gather.Project.model.ProjectPlanBean;

public interface ProjectPlanService {

	
		//依據id 找單筆方案資料
		public ProjectPlanBean getProjectPlanByProjectPlanID(Integer projectPlanID);
}
