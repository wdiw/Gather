package com.Gather.Forum.controller;

import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import com.Gather.Forum.model.ForumCommentBean;
import com.Gather.Forum.service.ForumCommentService;
import com.Gather.Forum.service.ForumService;
import com.Gather.member.entity.Member;
import com.google.gson.Gson;

@Controller
public class ForumController {
	
	ForumService forumservice;
	ServletContext servletContext;
	ForumCommentService forumCommentService;
	
	@Autowired
	public ForumController(ForumService forumservice, ServletContext servletContext,ForumCommentService forumCommentService) {
		this.forumservice = forumservice;
		this.servletContext = servletContext;
		this.forumCommentService=forumCommentService;
	}
	
	
	
	@GetMapping("/Forum/adMain") //跳轉
	public String toAdMain(Model model) {
		return "/Forum/adMain";
	}
	
	//jsp的跳轉，html不需要
//	@GetMapping("/showLogin") //跳轉
//	public String toLogin(Model model) {
//		return "Member/login";
//	}
	
	@GetMapping("/Forum/add") //跳轉到這個網址
	public String newToAdMain(Model model) {
		return "/Forum/add"; //上面網址用的jsp
	}
	
	@GetMapping("/addposts") //跳轉到這個網址
	public String toAddPosts(Model model) {
		return "/Forum/addposts"; //上面網址用的jsp
	}
	
	@GetMapping("/Forum/adDelete") //跳轉
	public String toAdDelete(Model model) {
		return "/Forum/adDelete"; //上面網址用的jsp
	}
	
	@GetMapping("/Forum/adUpdate") //跳轉
	public String toAdUpdate(Model model) {
		return "/Forum/adUpdate"; //上面網址用的jsp
	}
	
	//搜尋 後
	@GetMapping("/Forum/searchresult")
	public String searchResult(@RequestParam("searchvalue") String searchvalue, Model model) { //把使用者輸入的值傳進方法
		System.out.println(searchvalue); //測試是否收到傳入的值
		Set<String> titles=new HashSet<>(); //空的Set名為titles
		String title="%"+searchvalue+"%"; //findforumBytitle方法規則要前後加上%
		
		titles.add(title); 
		System.out.println(titles); //測試是否加入Set
		List<ForumBean> result = forumservice.findforumBytitle(titles);
		System.out.println(result); //應該要有類似[com.Gather.Forum.model.ForumBean@54cd744b]的東西
		model.addAttribute("SearchResult",result);
		return "/Forum/searchresult"; //上面網址用的jsp
	}
	
	//搜尋 前
	@GetMapping("/searchresults")
	public String searchResulto(@RequestParam("searchvalue") String searchvalue, Model model) { //把使用者輸入的值傳進方法
		System.out.println(searchvalue); //測試是否收到傳入的值
		Set<String> titles=new HashSet<>(); //空的Set名為titles
		String title="%"+searchvalue+"%"; //findforumBytitle方法規則要前後加上%
		
		titles.add(title); 
		System.out.println(titles); //測試是否加入Set
		List<ForumBean> result = forumservice.findforumBytitle(titles);
		System.out.println(result); //應該要有類似[com.Gather.Forum.model.ForumBean@54cd744b]的東西
		model.addAttribute("SearchResult",result);
		return "/Forum/searchresults"; //上面網址用的jsp
	}
	
	//分類 後
	@GetMapping("/Forum/category")
	public String categoryResult(@RequestParam("postCategory") String postcategory, Model model) { //把使用者輸入的值傳進方法
		List<ForumBean> result = forumservice.findByPostCategory(postcategory);
		System.out.println(result); //應該要有類似[com.Gather.Forum.model.ForumBean@54cd744b]的東西
		model.addAttribute("categoryResult",result);
		return "/Forum/category"; //上面網址用的jsp
	}
	
	//分類 前
	@GetMapping("/postcategory")
	public String categoryResulto(@RequestParam("postCategory") String postcategory, Model model) { //把使用者輸入的值傳進方法
		List<ForumBean> result = forumservice.findByPostCategory(postcategory);
		System.out.println(result); //應該要有類似[com.Gather.Forum.model.ForumBean@54cd744b]的東西
		model.addAttribute("categoryResult",result);
		return "/Forum/postcategory"; //上面網址用的jsp
	}
	
	//R全 顯示會員資料
	@GetMapping("/Forum/queryAll")
	public String queryAll(Model model, HttpServletRequest request) {
		
		Member memberData = (Member)request.getSession().getAttribute("memberData");
		String mStatus = memberData.getStatus();
		
		if(mStatus.equals("會員")) {
			//會員
			List<ForumBean> result = forumservice.getAllByPosterId(memberData.getId());
			model.addAttribute("AllForum", result);
			
		} else {
			//管理者
			List<ForumBean> result = forumservice.getAllForum();
			model.addAttribute("AllForum",result);
		}
		
		return "/Forum/queryAll"; //上面網址用的jsp
	}
	
	//R全 前
	@GetMapping("/allposts")
	public String queryAllPost(Model model) {
//		List<ForumBean> result = forumservice.getAllForum();
		List<ForumBean> result = forumservice.findByIdOrderByIdDesc();
		model.addAttribute("AllForum",result);
		return "/Forum/allposts"; //上面網址用的jsp
	}
	
	//R by id 用在點detail時
	@GetMapping("/Forum/detail") 
	public String getForumById(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("forum", forumservice.getForumById(id));
//		model.addAttribute("forumid", id);
		
		// 留言
		List<ForumCommentBean> result = forumCommentService.findForumCommentbyforumid(forumservice.getForumById(id));
		System.out.println(result); //測試是否印出
		model.addAttribute("AllForumComment",result);
		return "Forum/detail";
	}
	
	//R by id 用在點進文章時 前
	@GetMapping("/postdetail") 
	public String getForumByIdo(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("forum", forumservice.getForumById(id));
		
		List<ForumCommentBean> result = forumCommentService.findForumCommentbyforumid(forumservice.getForumById(id));
		System.out.println(result); //測試是否印出
		model.addAttribute("AllForumComments",result);
		return "Forum/postdetail";
	}
	
	//R by id 用在點更新文章時 前
	@GetMapping("/postupdate") 
	public String getForumByIdou(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("forum", forumservice.getForumById(id));
		
		List<ForumCommentBean> result = forumCommentService.findForumCommentbyforumid(forumservice.getForumById(id));
		System.out.println(result); //測試是否印出
		model.addAttribute("AllForumComments",result);
		return "Forum/postupdate";
	}
	
	
	
//	@PostMapping(path = "/Forum/add") //舊C
//	@ResponseBody
//	public String add(@RequestParam("name") String name, 
//			@RequestParam("post") String post, 
//			HttpServletRequest request) {
//		System.out.println("測試");
//		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//		Date date = new Date();
//		String postTime = timeFormat.format(date);
//		
//		ForumBean fBean=new ForumBean(name,post,postTime);
//		forumservice.addForum(fBean);
//		return "success";
//	}
	
	//新C 後
	@PostMapping(path = "/Forum/add") 
	public ResponseEntity<String> postAdd(@RequestParam("postCategory") String postCategory, 
			@RequestParam("name") String name, 
			@RequestParam("post") String post, 
//			@RequestParam("fImage") MultipartFile fImage, //T
			HttpServletRequest request) throws MalformedURLException {
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String postTime = timeFormat.format(date);
		
		Member member = (Member)request.getSession().getAttribute("memberData");
		ForumBean fBean=new ForumBean(postCategory, name, post, postTime, postTime, member.getName(), member.getId());
		forumservice.addForum(fBean);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return ResponseEntity.ok().headers(responseHeaders).body(new Gson().toJson(fBean));
//		return new ResponseEntity<String>("Y", HttpStatus.OK);
	}
	
	//新C 前
	@PostMapping(path = "/addposts") 
	public ResponseEntity<String> postAddo(@RequestParam("postCategory") String postCategory, 
			@RequestParam("name") String name, 
			@RequestParam("post") String post, 
//			@RequestParam("fImage") MultipartFile fImage, //T
			HttpServletRequest request) throws MalformedURLException {
		System.out.println("測試");
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String postTime = timeFormat.format(date);
		
		Member member = (Member)request.getSession().getAttribute("memberData"); //T
		ForumBean fBean=new ForumBean(postCategory, name, post, postTime, postTime, member.getName(), member.getId());
		forumservice.addForum(fBean);
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return ResponseEntity.ok().headers(responseHeaders).body(new Gson().toJson(fBean));
//		return new ResponseEntity<String>("Y", HttpStatus.OK);
	}
	
	
//	//舊D
//	@PostMapping("/Forum/delete")
//	public String delete(@RequestParam("id") int id,Model model) {
//		forumservice.deleteForumById(id);
//		return "/Forum/success";
//	}
	
	//新D 後
//	@DeleteMapping(path = "/Forum/delete/{id}") //path自己隨便設，要對應jsp?用adDelete.jsp刪除
//	@DeleteMapping(path = "/Forum/detail/{id}") //path自己隨便設，要對應jsp?用detail.jsp刪除
	@DeleteMapping(path = "/Forum/queryAll/{id}") //path自己隨便設，要對應jsp?用detail.jsp刪除
	@ResponseBody
	public String deleteForumById(@PathVariable("id") int id) {
		forumservice.deleteForumById(id);
		return "Delete OK"; //不會顯示因為有@ResponseBody
	}
	
	//新D 前
	@DeleteMapping(path = "/postdetail/{id}")
	@ResponseBody
	public String deleteForumByIdo(@PathVariable("id") int id) {
		forumservice.deleteForumById(id);
		return "Delete OK"; //不會顯示因為有@ResponseBody
	}
	
	//舊U
	@PostMapping("/Forum/update") //按鈕功能，按下按鈕來執行這裡
	public String update(@RequestParam("id") int id, 
			@RequestParam("name") String name, 
			@RequestParam("post") String post, Model model) {
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String postUpdatetime = timeFormat.format(date);
		
		ForumBean getForumById = forumservice.getForumById(id); //透過id取資料庫的表單
		ForumBean fBean=new ForumBean(id, name, post, getForumById.getPostTime(), postUpdatetime);
		forumservice.updateForum(fBean);
		return "/Forum/success"; //跳轉頁面
	}
	
	//新U 後
	@PutMapping(path = "/Forum/detail/{id}")
	@ResponseBody
	public String postUpdate(@PathVariable("id") int id, 
			@RequestParam("postCategory") String postCategory, 
			@RequestParam("name") String name, 
			@RequestParam("post") String post, Model model, HttpServletRequest request) {
		System.out.println(id);
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String postUpdatetime = timeFormat.format(date);
		
		ForumBean getForumById = forumservice.getForumById(id); //透過id取資料庫的表單
		Member member = (Member)request.getSession().getAttribute("memberData"); //T
		ForumBean fBean=new ForumBean(id, postCategory, name, post, getForumById.getPostTime(), postUpdatetime, member.getName(),member.getId());
		forumservice.updateForum(fBean);
		return "success"; //不會顯示因為有@ResponseBody
	}
	
	//新U 前
	@PutMapping(path = "/postupdates/{id}")
	@ResponseBody
	public String postUpdateo(@PathVariable("id") Integer id, 
			@RequestParam("postCategory") String postCategory, 
			@RequestParam("name") String name, 
			@RequestParam("post") String post, Model model, HttpServletRequest request) {
		System.out.println(id);
		System.out.println(postCategory+name+post);
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String postUpdatetime = timeFormat.format(date);
		
		ForumBean getForumById = forumservice.getForumById(id); //透過id取資料庫的表單
	    
		Member member = (Member)request.getSession().getAttribute("memberData"); //T
		System.out.println(member.getName()+member.getId());
		ForumBean fBean=new ForumBean(id, postCategory, name, post, getForumById.getPostTime(), postUpdatetime, member.getName(),member.getId());
		forumservice.updateForum(fBean);
		return "success"; //不會顯示因為有@ResponseBody
	}
	
}
