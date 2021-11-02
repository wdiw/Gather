package com.Gather.Forum.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	
	@GetMapping("/Forum/adMain") //跳轉
	public String toAdMain(Model model) {
		
		return "/Forum/adMain";
		
	}
	
	@GetMapping("/Forum/adDelete") //跳轉
	public String toAdDelete(Model model) {
		
		return "/Forum/adDelete";
		
	}
	
	@GetMapping("/Forum/adUpdate") //跳轉
	public String toAdUpdate(Model model) {
		
		return "/Forum/adUpdate";
		
	}
	
	@GetMapping("/Forum/queryAll")
	public String queryAll(Model model) {
		
		List<ForumBean> result = forumservice.getAllForum();
		model.addAttribute("AllForum",result);
		return "/Forum/queryAll";
		
	}
	
	
	
	
	
	@PostMapping(path = "/Forum/add")
	@ResponseBody
	public String add(@RequestParam("name") String name, 
			@RequestParam("post") String post, 
			HttpServletRequest request) {
		
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd a hh:mm:ss");
		Date date = new Date();
		String postTime = timeFormat.format(date);
		
		ForumBean fBean=new ForumBean(name,post,postTime);
		forumservice.addForum(fBean);
		return "success";
		
	}
	
//	//刪舊
//	@PostMapping("/Forum/delete")
//	public String delete(@RequestParam("id") int id,Model model) {
//		
//		forumservice.deleteForumById(id);
//		return "/Forum/success";
//		
//	}
	
	// 刪除
	@DeleteMapping(path = "/Forum/delete/{id}") //path自己隨便設
	@ResponseBody
	public String deleteProjectById(@PathVariable("id") int id) {
		
		forumservice.deleteForumById(id);
		return "Delete OK";
		
	}
	
	@PostMapping("/Forum/update")
	public String update(@RequestParam("id") int id, 
			@RequestParam("name") String name, 
			@RequestParam("post") String post, Model model) {
		
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd a hh:mm:ss");
		Date date = new Date();
		String postUpdatetime = timeFormat.format(date);
		
		ForumBean getForumById = forumservice.getForumById(id); //透過id取資料庫的表單
		ForumBean fBean=new ForumBean(id, name, post, getForumById.getPostTime(), postUpdatetime);
		forumservice.updateForum(fBean);
		return "/Forum/success";
		
	}
	
}
