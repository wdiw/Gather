package com.Gather.Project.controller;

import java.util.HashSet;
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
				//管理者
				List<ProjectBean> result = projectService.getAllProjectsNopContent();
				model.addAttribute("allproject", result);
			return "Project/allproject";
		}
		
		
		
		// 管理者者查看計畫詳細內容
		@GetMapping("/Project/managerProjectDetail")
		public String managerGetProjectById(@RequestParam("pID") Integer pID, Model model) {
			System.out.println("pID=" + pID);
			ProjectBean projectBean = projectService.getProjectById(pID);
			List<ProjectPlanBean> projectPlanList = projectPlanService.getProjectPlansByProjectBean(projectBean);
			model.addAttribute("project", projectBean);//計畫本身
			model.addAttribute("projectPlanList", projectPlanList);//計畫的所有方案
			model.addAttribute("projectID", pID);
			
			return "Project/productdetail";
									
		}
		
		
		
		// 會員查詢所有提案
				@GetMapping("/Project/userProjects")
				public String userProjectList(Model model,HttpServletRequest request) {
					Member memberData = (Member)request.getSession().getAttribute("memberData");
						
						List<ProjectBean> result = projectService.getAllProjectBymID(memberData.getId());
						model.addAttribute("allproject", result);
					return "Project/userProjects";
				}
		
		
	
		
		
		
	
		// 使用者查看計畫詳細內容
		@GetMapping("/Project/userProjectDetail")
		public String getProjectById(@RequestParam("pID") Integer pID, Model model) {
			System.out.println("pID=" + pID);
			ProjectBean projectBean = projectService.getProjectById(pID);
			List<ProjectPlanBean> projectPlanList = projectPlanService.getProjectPlansByProjectBean(projectBean);
			model.addAttribute("project", projectBean);//計畫本身
			model.addAttribute("projectPlanList", projectPlanList);//計畫的所有方案
			model.addAttribute("projectID", pID);
			
			return "Project/userProjectDetail";
									
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
			
			model.addAttribute("allProject", result);
			return "Project/allProjectInForestage";
		}
		
		

		
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
		
		
		
		
//		//找通過審核的計畫並依分頁呈現
//				@GetMapping("/Project/allProject")
//				public String allProjecte(Model model,HttpServletRequest request) {
//					List<ProjectBean> result = projectService.getAllProjectBypStatus("通過");
//					model.addAttribute("allProject", result);
//					return "Project/page";
//				}
				
				
				
		
}
