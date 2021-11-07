package com.Gather.Project.dao;

import java.util.List;
import java.util.Set;

import com.Gather.Project.model.ProjectBean;

public interface ProjectRepositoryCustom {

	List<ProjectBean> findProjectBySearch(Set<String> search);
}
