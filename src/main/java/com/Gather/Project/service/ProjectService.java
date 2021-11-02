package com.Gather.Project.service;

import java.util.List;
import java.util.Optional;

import com.Gather.Project.model.ProjectBean;

public interface ProjectService {

	//找所有計畫資料
    List<ProjectBean> getAllProject();
	
    //依據id 找單筆資料
	public ProjectBean getProjectById(Integer pID);
	
	//依據id刪單筆資料
	public void deleteProjectById(Integer pID);
	
	//新增
	public void addProject(ProjectBean pBean);
	
	//修改
	public void updateProject(ProjectBean pBean);
}
