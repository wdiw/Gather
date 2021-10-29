package com.Gather.Project.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
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
	// Optional 為容器類別，代表若回傳是null，也可以處理，不用特別寫if去判斷
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

}
