package com.Gather.Forum.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Gather.Forum.model.ForumBean;
import com.Gather.Forum.service.ForumService;

@Controller
public class ForumController {
	
	ForumService forumservice;
	ServletContext servletContext;
	
	@Autowired
	public ForumController(ForumService forumservice, ServletContext servletContext) {
		this.forumservice = forumservice;
		this.servletContext = servletContext;
	}
	
	
	
	@GetMapping("/Forum/adMain")
	public String toAdMain(Model model) {
		
		return "/Forum/adMain";
		
	}
	
	@GetMapping("/Forum/adDelete")
	public String toAdDelete(Model model) {
		
		return "/Forum/adDelete";
		
	}
	
	@GetMapping("/Forum/adUpdate")
	public String toAdUpdate(Model model) {
		
		return "/Forum/adUpdate";
		
	}
	
	@GetMapping("/Forum/queryAll")
	public String queryAll(Model model) {
		
		List<ForumBean> result = forumservice.getAllForum();
		model.addAttribute("AllForum",result);
		return "/Forum/queryAll";
		
	}
	
	
	
	
	
	@PostMapping("/Forum/add")
	public String add(@RequestParam("name") String name, 
			@RequestParam("post") String post, Model model,HttpServletRequest request) {
		
		ForumBean fBean=new ForumBean(name,post);
		forumservice.addForum(fBean);
		model.addAttribute("adBean", fBean);
		return "/Forum/success";
		
	}
	
	@PostMapping("/Forum/delete")
	public String delete(@RequestParam("id") int id,Model model) {
		
		forumservice.deleteForumById(id);
		return "/Forum/success";
		
	}
	
	@PostMapping("/Forum/update")
	public String update(@RequestParam("id") int id, 
			@RequestParam("name") String name, 
			@RequestParam("post") String post, Model model) {
		
		ForumBean fBean=new ForumBean(id, name, post);
		forumservice.updateForum(fBean);
		return "/Forum/success";	
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
