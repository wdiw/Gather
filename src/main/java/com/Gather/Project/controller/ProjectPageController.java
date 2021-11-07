package com.Gather.Project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.model.ProjectPlanBean;
import com.Gather.Project.service.ProjectPlanService;
import com.Gather.Project.service.ProjectService;
import com.Gather.member.entity.Member;

@Controller
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
			model.addAttribute("project", projectService.getProjectById(pID));// 注意 是product 不是products
			model.addAttribute("projectID", pID);// 注意 是product 不是products
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
	
}
