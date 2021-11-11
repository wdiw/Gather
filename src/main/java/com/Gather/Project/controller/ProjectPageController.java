package com.Gather.Project.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.model.ProjectPlanBean;
import com.Gather.Project.service.ProjectPlanService;
import com.Gather.Project.service.ProjectService;
import com.Gather.member.entity.Member;

@Controller
@SessionAttributes("allProject")
public class ProjectPageController {

	ProjectService projectService;
	ProjectPlanService projectPlanService;

	@Autowired
	public ProjectPageController(
			ProjectService projectService,
			ProjectPlanService projectPlanService) {
		super();
		this.projectService = projectService;
		this.projectPlanService=projectPlanService;
	}
	
	
	// 管理者查詢所有提案
		@GetMapping("/Project/allProjectInBackstage")
		public String list(Model model,HttpServletRequest request) {
			Member memberData = (Member)request.getSession().getAttribute("memberData");
			String mStatus = memberData.getStatus();
			
			if(mStatus.equals("會員")) {
				//會員
				List<ProjectBean> result = projectService.getAllProjectBymID(memberData.getId());
				model.addAttribute("allproject", result);
				
			}else {
				//管理者
				List<ProjectBean> result = projectService.getAllProject();
				model.addAttribute("allproject", result);
				
			}
			return "Project/allproject";
		}
		
		
		
	
		// By Id 找尋單一資料並且跳轉
		@GetMapping("/Project/project")
		public String getProjectById(@RequestParam("pID") Integer pID, Model model) {
			System.out.println("pID=" + pID);
			ProjectBean projectBean = projectService.getProjectById(pID);
			List<ProjectPlanBean> projectPlanList = projectPlanService.getProjectPlansByProjectBean(projectBean);
			model.addAttribute("project", projectBean);//計畫本身
			model.addAttribute("projectPlanList", projectPlanList);//計畫的所有方案
			model.addAttribute("projectID", pID);
			
			return "Project/productdetail";
									
		}
		
		

		// 跳轉到新增專案
		@GetMapping("/Project/addProject")
		public String goToAddproject() {
			return "Project/addproject";

		}
		
		//找通過審核的計畫
		@GetMapping("/Project/allProjectInForestage")
		public String allProjectInForestage(Model model,HttpServletRequest request) {
			List<ProjectBean> result = projectService.getAllProjectBypStatus("通過");
			
//			Set<Integer> dayList=new LinkedHashSet<>();//有序加入
//			for (ProjectBean projectBean : result) {
//				 LocalDate todaysDate = LocalDate.now();//取得今日日期
//				 
//				 LocalDate dBefore = LocalDate.parse(todaysDate.toString(), DateTimeFormatter.ISO_LOCAL_DATE);//今日日期
//				 LocalDate dAfter = LocalDate.parse(projectBean.getpEDate(), DateTimeFormatter.ISO_LOCAL_DATE);//募資最後一天
//				 Integer diff = (int) dBefore.until(dAfter,ChronoUnit.DAYS);
//				 if(diff<0) {
//					 diff=-1;
//				 }
//				 dayList.add(diff);
//				
//			}
//			model.addAttribute("dayList",dayList);
			model.addAttribute("allProject", result);
			return "Project/allProjectInForestage";
		}
		
		
//		// By Id 找尋單一資料並且跳轉(提供參考)
//				@GetMapping("/Project/ProjectPlan")
//				public String getProjectPlanByProjectPlanID(
//						@RequestParam("ProjectPlanID") Integer ProjectPlanID,
//						Model model) {
//					
//					ProjectPlanBean projectPlanBean = projectPlanService.getProjectPlanByProjectPlanID(ProjectPlanID);
//					System.out.println("方案ID:"+projectPlanBean.getProjectPlanID());
//					System.out.println("方案內容:"+projectPlanBean.getProjectPlanContent());
//					
//					return "Project/allProjectInForestage";
//											
//				}
		
		// find  Project By search 透過搜尋的關鍵字找到相關資料
		
		@GetMapping("/Project/ProjectSearch")
		public String  getProjectBySearch(
				@RequestParam("search") String search,Model model) {
			
			System.out.println("search:"+search);
			Set<String> searchName=new HashSet<>();
			searchName.add("%"+search+"%");

			System.out.println(searchName);
			List<ProjectBean> result = projectService.getProjectBySearch(searchName);
			model.addAttribute("allProject",result);
			return "Project/projectSearch";					
		}	
		
		
		
		
		
		@GetMapping("/Project/category")
		public String  getProjectBypStatusAndpCategory(
				@RequestParam("category") String pCategory,Model model) {
			List<ProjectBean> result = projectService.getProjectBypStatusAndpCategory("通過",pCategory );
			model.addAttribute("allProject",result);
			return "Project/projectCategory";					
		}
		
		
		
//		
//		//找通過審核的計畫並依分頁呈現
//				@GetMapping("/Project/allProject")
//				public String allProjecte(Model model,HttpServletRequest request) {
//					List<ProjectBean> result = projectService.getAllProjectBypStatus("通過");
//					model.addAttribute("allProject", result);
//					return "Project/page";
//				}
				
				
				
		
}
