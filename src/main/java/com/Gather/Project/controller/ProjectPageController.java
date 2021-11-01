package com.Gather.Project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.service.ProjectService;

@Controller
public class ProjectPageController {

	ProjectService projectService;

	@Autowired
	public ProjectPageController(ProjectService projectService) {
		super();
		this.projectService = projectService;
	}
	
	
	// 查詢所有提案
		@GetMapping("/Project/allproject")
		public String list(Model model) {
			List<ProjectBean> result = projectService.getAllProject();
			model.addAttribute("allproject", result);
			return "Project/allproject";
//			return "redirect:/_20_productMaintain/DisplayPageProducts";
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
		
		
	
	
}
