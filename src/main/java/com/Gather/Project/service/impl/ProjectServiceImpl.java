package com.Gather.Project.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Gather.Project.dao.ProjectRepository;
import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.service.ProjectService;

@Repository
@Transactional
public class ProjectServiceImpl implements ProjectService {

	ProjectRepository projectRepository;

	@Autowired
	public ProjectServiceImpl(ProjectRepository projectRepository) {
		super();
		this.projectRepository = projectRepository;
	}

	// 找所有資料
	@Override
	public List<ProjectBean> getAllProject() {
		return projectRepository.findAll();
	}

	// 透過id找
	@Override
	public ProjectBean getProjectById(Integer pID) {
		
		return projectRepository.getById(pID);
	}

	//新增
	@Override
	public void addProject(ProjectBean pBean) {
		projectRepository.save(pBean);
	}

	//修改
	@Override
	public void updateProject(ProjectBean pBean) {
		projectRepository.save(pBean);

	}

	//透過id刪除計畫
	@Override
	public void deleteProjectById(Integer pID) {
		 projectRepository.deleteById(pID);;
	}

	//透過會員ID找到他的所有專案
	@Override
	public List<ProjectBean> getAllProjectBymID(Integer mID) {
		return projectRepository.findBymID(mID);
	}

	//管理者審核計畫通過或不通過
	@Override
	public void updateStatusBypID(Integer pID, String pStatus,String reason ) {
		projectRepository.updateStatusBypID(pID, pStatus,reason );
		
	}

	
	//找審核通過的計畫
	@Override
	public List<ProjectBean> getAllProjectBypStatus(String pStatus) {
		// TODO Auto-generated method stub
		return projectRepository.findBypStatus(pStatus);
	}

	@Override
	public List<ProjectBean> getProjectBySearch(Set<String> search) {
		
		return projectRepository.findProjectBySearch(search);
	}
	
	
	
	
	
	

}
