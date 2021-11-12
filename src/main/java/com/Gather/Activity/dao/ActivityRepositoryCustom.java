package com.Gather.Activity.dao;
import java.util.List;
import java.util.Set;

import com.Gather.Activity.model.ActivityBean;
public interface ActivityRepositoryCustom {

	 List<ActivityBean> searchActivity(Set<String>names);
	
	
}
