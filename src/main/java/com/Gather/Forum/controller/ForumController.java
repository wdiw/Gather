package com.Gather.Forum.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Gather.Forum.model.ForumBean;
import com.Gather.Forum.service.ForumService;
import com.google.gson.Gson;

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
	
//	@GetMapping("/add") //這個網址套不到版
	@GetMapping("/Forum/add") //會連線到這個網址
	public String toAdMainTest(Model model) {
		
		return "/Forum/add"; //會用的jsp
		
	}
	
	@GetMapping("/Forum/adDelete") //跳轉
	public String toAdDelete(Model model) {
		
		return "/Forum/adDelete";
		
	}
	
	@GetMapping("/Forum/adUpdate") //跳轉
	public String toAdUpdate(Model model) {
		
		return "/Forum/adUpdate";
		
	}
	
	//R全
	@GetMapping("/Forum/queryAll") 
	public String queryAll(Model model) {
		
		List<ForumBean> result = forumservice.getAllForum();
		model.addAttribute("AllForum",result);
		return "/Forum/queryAll";
		
	}
	
	//R by id 用在點detail時
	@GetMapping("/Forum/detail") 
	public String getProjectById(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("forum", forumservice.getForumById(id));
		model.addAttribute("forumid", id);
		return "Forum/detail";
								
	}
	
	
	
//	@PostMapping(path = "/Forum/add") //舊C
//	@ResponseBody
//	public String add(@RequestParam("name") String name, 
//			@RequestParam("post") String post, 
//			HttpServletRequest request) {
//		System.out.println("測試");
//		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd a hh:mm:ss");
//		Date date = new Date();
//		String postTime = timeFormat.format(date);
//		
//		ForumBean fBean=new ForumBean(name,post,postTime);
//		forumservice.addForum(fBean);
//		return "success";
//		
//	}
	
	//新C
	@PostMapping(path = "/Forum/add") 
	public ResponseEntity<String> add(@RequestParam("name") String name, 
			@RequestParam("post") String post, 
			HttpServletRequest request) {
		System.out.println("測試");
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd a hh:mm:ss");
		Date date = new Date();
		String postTime = timeFormat.format(date);
		
		ForumBean fBean=new ForumBean(name,post,postTime,postTime);
		forumservice.addForum(fBean);
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return ResponseEntity.ok().headers(responseHeaders).body(new Gson().toJson(fBean));
		
	}
	
//	//舊D
//	@PostMapping("/Forum/delete")
//	public String delete(@RequestParam("id") int id,Model model) {
//		
//		forumservice.deleteForumById(id);
//		return "/Forum/success";
//		
//	}
	
	//新D
//	@DeleteMapping(path = "/Forum/delete/{id}") //path自己隨便設，要對應jsp?用adDelete.jsp刪除
	@DeleteMapping(path = "/Forum/detail/{id}") //path自己隨便設，要對應jsp?用detail.jsp刪除
	@ResponseBody
	public String deleteProjectById(@PathVariable("id") int id) {
		
		forumservice.deleteForumById(id);
		return "Delete OK"; //不會顯示因為有@ResponseBody
		
	}
	
	//舊U
	@PostMapping("/Forum/update") //按鈕功能，按下按鈕來執行這裡
	public String update(@RequestParam("id") int id, 
			@RequestParam("name") String name, 
			@RequestParam("post") String post, Model model) {
		
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd a hh:mm:ss");
		Date date = new Date();
		String postUpdatetime = timeFormat.format(date);
		
		ForumBean getForumById = forumservice.getForumById(id); //透過id取資料庫的表單
		ForumBean fBean=new ForumBean(id, name, post, getForumById.getPostTime(), postUpdatetime);
		forumservice.updateForum(fBean);
		return "/Forum/success"; //回傳頁面
		
	}
	
	//新U
	@PutMapping(path = "/Forum/detail/{id}")
	@ResponseBody
	public String newupdate(@PathVariable("id") int id, 
			@RequestParam("name") String name, 
			@RequestParam("post") String post, Model model) {
		
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd a hh:mm:ss");
		Date date = new Date();
		String postUpdatetime = timeFormat.format(date);
		
		ForumBean getForumById = forumservice.getForumById(id); //透過id取資料庫的表單
		ForumBean fBean=new ForumBean(id, name, post, getForumById.getPostTime(), postUpdatetime);
		forumservice.updateForum(fBean);
		return "success"; //不會顯示因為有@ResponseBody
		
	}
	
}
