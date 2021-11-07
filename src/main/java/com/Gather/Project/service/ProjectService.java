package com.Gather.Project.service;

import java.util.List;
import java.util.Set;

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
	
	//找Project By mID
	List<ProjectBean> getAllProjectBymID(Integer mID);
	
	//管理者審核計畫通過或不通過
	public void updateStatusBypID(Integer pID,String pStatus,String reason);
	
	//找審核通過的計畫
	List<ProjectBean> getAllProjectBypStatus(String pStatus);
	
	//透過search找到相關資料
	List<ProjectBean> getProjectBySearch(Set<String> search);
}
