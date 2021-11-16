package com.Gather.Project.service;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.Gather.Project.model.ProjectBean;

public interface ProjectService {

	//找所有計畫資料
    List<ProjectBean> getAllProject();
  
    //管理者找所有計畫資料(不包括計畫內容)
    List<ProjectBean>  getAllProjectsNopContent( );
	
    
    
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
	
	//透過類別找所有計畫
	List<ProjectBean>  getProjectBypStatusAndpCategory(String pStatus,String pCategory);
	
	//改變計畫累積金額
	void updateProjectAmountBypID(Integer pID,Integer pAmountNow);
	
	//改變計畫被贊助次數
	void updateProjectSponsorCountBypID(Integer pID,Integer sponsorCount);
	
	//查計畫熱門前10筆
	List<ProjectBean> findProjectByOrderby();
	
//	//分頁
	Page<ProjectBean> findBypStatusContaining(String pStatus,Pageable pageable);
}
