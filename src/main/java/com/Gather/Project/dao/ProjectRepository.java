package com.Gather.Project.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import com.Gather.Project.model.ProjectBean;

public interface ProjectRepository extends JpaRepository<ProjectBean,Integer >,ProjectRepositoryCustom {
	
	
	

	//由會員ID找到他所提的所有計畫(不包括計畫內容，以免拖慢)
	//List<ProjectBean>  findBymID(Integer mID);
	@Query(value="SELECT pID,pName,pTarget,pDescribe,pImageCover,pSDate,pEDate,mId,pStatus,"
			+ "pAmountNow,reason,pCategory,sponsorCount,'' as pContent FROM Project where mId=:mID order by pID desc",nativeQuery=true)
	List<ProjectBean>  findBymID(Integer mID);
	
	
	
	//找審核通過的全部計畫(不包含計畫內容，以免拖慢)
	@Query(value="SELECT pID,pName,pTarget,pDescribe,pImageCover,pSDate,pEDate,mId,pStatus,"
			+ "pAmountNow,reason,pCategory,sponsorCount,'' as pContent FROM Project where pStatus='通過'"
			+ "order by pID desc",nativeQuery=true)
	List<ProjectBean>  findBypStatus(String pStatus);
	
	
	
	
	//給管理者看所有計畫，不包含計畫內容
	@Query(value="SELECT pID,pName,pTarget,pDescribe,pImageCover,pSDate,pEDate,mId,pStatus,"
			+ "pAmountNow,reason,pCategory,sponsorCount,'' as pContent FROM Project order by pID desc",nativeQuery=true)
	List<ProjectBean>  getAllProjectsNopContent( );
	
	
	
	
	
	
	
	
	//依據類別搜尋
	 @Query("select p from ProjectBean p where p.pStatus = ?1 and p.pCategory = ?2 ")
	 List<ProjectBean> findBypStatusAndpCategory(String pStatus,String pCategory);
	
	//管理者改變計畫狀態
	@Modifying
	@Query("update ProjectBean p set p.pStatus=?2,p.reason=?3 where  p.pID=?1")
	void updateStatusBypID(Integer pID,String pStatus,String reason );
	
	
	//改變計畫累積金額
	@Modifying
	@Query(value="UPDATE Project SET pAmountNow=:pAmountNow WHERE pID=:pID",nativeQuery=true)
	void updateProjectAmountBypID(Integer pID,Integer pAmountNow);
	
	
	//改變計畫被贊助次數
		@Modifying
		@Query(value="UPDATE Project SET sponsorCount=:sponsorCount WHERE pID=:pID",nativeQuery=true)
		void updateProjectSponsorCountBypID(Integer pID,Integer sponsorCount);
	
	//查詢計畫熱門前10筆
	@Query(value="select top 10 * from Project where pStatus='通過' order by sponsorCount DESC",nativeQuery=true)
	List<ProjectBean> findProjectByOrderby();	
		
	
	//分頁測試
	Page<ProjectBean> findBypStatusContaining(String pStatus,Pageable pageable);
	
	
}
