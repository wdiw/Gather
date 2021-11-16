package com.Gather.Forum.controller;

import java.io.File;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Gather.Forum.model.ForumBean;
import com.Gather.Forum.model.ForumCommentBean;
import com.Gather.Forum.service.ForumCommentService;
import com.Gather.Forum.service.ForumService;
import com.Gather.member.entity.Member;
import com.google.gson.Gson;

@Controller
public class ForumCommentController {
	
	ForumCommentService forumCommentService;
	ServletContext servletContext;
    ForumService forumService;
	
	
	@Autowired
	public ForumCommentController(ForumCommentService forumCommentService, ServletContext servletContext,ForumService forumService) {
		this.forumCommentService = forumCommentService;
		this.servletContext = servletContext;
		this.forumService=forumService;
		
	}
	
	
	
//	@GetMapping("/Forum/comments") //連線到這個網址
//	public String toComments(Model model) {
//		
//		return "/Forum/comments"; //上面網址用的jsp
//		
//	}
	
//	@GetMapping("/Forum/addforumcomment") //連線到這個網址
//	public String toAddForumComment(Model model) {
//		
//		return "/Forum/addforumcomment"; //上面網址用的jsp
//		
//	}
	
	//R全
//	@GetMapping("/Forum/forumcomments")
//	@GetMapping("/Forum/detail/{id}")
//	public String comments(Model model) {
//		List<ForumCommentBean> result = forumCommentService.getAllForumComment();
//		model.addAttribute("AllForumComment",result);
//		return "/Forum/detail/{id}";
//		
//	}
	
//	//R by id 用在點detail時
//	@GetMapping("/Forum/comments") 
//	public String getForumCommentById(@RequestParam("forumid") Integer forumid, Model model) {
//		model.addAttribute("forum", forumservice.getForumById(id));
//		model.addAttribute("forumid", id);
//		return "Forum/comments";
//								
//	}
	
	
	//C 新增留言
	@PostMapping(path = "/Forum/addforumcomment") 
	@ResponseBody
	public ResponseEntity<String> add(@RequestParam("forumcomment") String forumcomment, 
			@RequestParam("id")Integer id,
			HttpServletRequest request,Model model)  {
		
//		System.out.println(forumcomment);
		
		//取文章留言時間
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String forumcommentTime = timeFormat.format(date);
		
		//
		ForumBean forumBean = forumService.getForumById(id);
		Member member = (Member)request.getSession().getAttribute("memberData"); //member.getId()
//		ForumCommentBean forumCommentBean = new ForumCommentBean(member.getName(),forumcomment,forumcommentTime,forumBean);
		ForumCommentBean forumCommentBean = new ForumCommentBean(member.getName(),forumcomment,forumcommentTime,forumBean,member.getId()); //T
		Set<ForumCommentBean> list = new LinkedHashSet<ForumCommentBean>();
		list.add(forumCommentBean);
		forumBean.setForumcomment(list);
		forumService.addForum(forumBean);
		
		List<ForumCommentBean> result = forumCommentService.getAllForumComment();
		System.out.println("全部留言");
		System.out.println(result);
		model.addAttribute("AllForumComment",result);

		return new ResponseEntity<String>( HttpStatus.OK);
	}
	
	//D
	@DeleteMapping(path = "/Forum/deleteforumcomment/{forumcommentID}") //path自己隨便設，要對應jsp?用detail.jsp刪除
	@ResponseBody
	public ResponseEntity<String> deleteCommentByCommentId(@PathVariable("forumcommentID") int forumcommentID,HttpServletRequest request) {
		System.out.println("進入刪除");
		forumCommentService.deleteForumCommentByForumCommentId(forumcommentID);
//		return "Delete OK"; //不會顯示因為有@ResponseBody
		return new ResponseEntity<String>(HttpStatus.OK);
	}
	
//	//U
//	@PutMapping(path = "/Forum/forumcomments/{forumcommentID}")
//	@ResponseBody
//	public String commentUpdate(@PathVariable("forumcommentID") int forumcommentID, 
//			@RequestParam("forumcommenter") String forumcommenter, 
//			@RequestParam("forumcomment") String forumcomment, Model model) {
//		
////		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
////		Date date = new Date();
////		String postUpdatetime = timeFormat.format(date);
//		
//		ForumCommentBean getForumCommentById = forumCommentService.getForumCommentByForumCommentId(forumcommentID); //透過id取資料庫的表單
//		ForumCommentBean forumcommentBean=new ForumCommentBean(forumcommentID, forumcommenter, forumcomment, getForumCommentById.getForumcommentTime());
//		forumCommentService.updateForumComment(forumcommentBean);
//		return "success"; //不會顯示因為有@ResponseBody
//	}
	
}
