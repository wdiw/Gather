package com.Gather.Project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import com.Gather.Project.model.ProjectBean;

public interface ProjectRepository extends JpaRepository<ProjectBean,Integer >,ProjectRepositoryCustom {
	
	

	//由會員ID找到他所提的所有計畫
	List<ProjectBean>  findBymID(Integer mID);
	
	//找審核通過的全部計畫
	List<ProjectBean>  findBypStatus(String pStatus);
	
	
//	//依據類別找審核通過的計畫
	//List<ProjectBean>  findBypStatusAndpCategory(String pStatus,String pCategory);
	
	 @Query("select p from ProjectBean p where p.pStatus = ?1 and p.pCategory = ?2 ")
	 List<ProjectBean> findBypStatusAndpCategory(String pStatus,String pCategory);
	
	
	@Modifying
	@Query("update ProjectBean p set p.pStatus=?2,p.reason=?3 where  p.pID=?1")
	void updateStatusBypID(Integer pID,String pStatus,String reason );
	
	
}
