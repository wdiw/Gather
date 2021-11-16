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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Gather.Activity.service.ActivityParticipationService;
import com.Gather.Activity.service.ActivityService;
import com.Gather.Forum.model.CommentBean;
import com.Gather.Forum.model.ForumBean;
import com.Gather.Forum.model.ForumCommentBean;
import com.Gather.Forum.service.CommentService;
import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.model.ProjectPlanBean;
import com.Gather.Project.service.ProjectPlanService;
import com.Gather.Project.service.ProjectService;
import com.Gather.Sponsorship.model.FavoriteBean;
import com.Gather.Sponsorship.service.SponsorOrderService;
import com.Gather.member.entity.Member;
import com.Gather.member.service.MemberService;
import com.google.gson.Gson;

@Controller
public class CommentController {
	
	CommentService commentservice;
	ServletContext servletContext;
	ProjectService projectService;
	ProjectPlanService projectPlanService;
	MemberService memberService;
	SponsorOrderService sponsorOrderService;
	ActivityService activityService;
	ActivityParticipationService activityParticipationService;
	
	@Autowired
	public CommentController(CommentService commentservice, 
			ServletContext servletContext, 
			ProjectService projectService,
			ProjectPlanService projectPlanService,
			MemberService memberService, 
			SponsorOrderService sponsorOrderService, 
			ActivityService activityService, 
			ActivityParticipationService activityParticipationService ) {
		this.commentservice = commentservice;
		this.servletContext = servletContext;
		this.projectService = projectService;
		this.projectPlanService = projectPlanService;
		this.memberService = memberService;
		this.sponsorOrderService = sponsorOrderService;
		this.activityService = activityService;
		this.activityParticipationService = activityParticipationService;
		
	}
	
	
	
//	@GetMapping("/Forum/comments") //連線到這個網址
//	public String toComments(Model model) {
//		
//		return "/Forum/comments"; //上面網址用的jsp
//		
//	}
	
	@GetMapping("/Forum/addcomment") //連線到這個網址
	public String toAddComment(Model model) {
		
		return "/Forum/addcomment"; //上面網址用的jsp
		
	}
	
	//R全
	@GetMapping("/showProject/comments/{pID}") //連線到這個網址
	public String showProject(@PathVariable("pID") Integer pID, HttpServletRequest request) {
		ProjectBean pBean = projectService.getProjectById(pID);
		Member member = (Member) request.getSession().getAttribute("memberData");
		
		if(member!=null) {
			Member mBean = memberService.queryMemberById(member.getId());
			FavoriteBean favoriteBean = sponsorOrderService.getFavoriteByMemberIDAndProjectID(mBean.getId(), pID);
			List<FavoriteBean> favoriteBeans = sponsorOrderService.getFavoriteByMemberID(mBean.getId());
			int favCount = favoriteBeans.size();
			request.getSession().setAttribute("favoriteBean", favoriteBean);
			request.getSession().setAttribute("favCount", favCount);
			request.getSession().setAttribute("mBean", mBean);
		}

		List<ProjectPlanBean> projectPlanList = projectPlanService.getProjectPlansByProjectBean(pBean);
		request.getSession().setAttribute("projectPlanList", projectPlanList);
		request.getSession().setAttribute("pBean", pBean);
		return "Forum/project"; //上面網址用的jsp
	}
	
	//R全
	@GetMapping("/Forum/comments") 
	public String comments(Model model) {
		List<CommentBean> result = commentservice.getAllComment();
		model.addAttribute("Comments",result);
		return "/Forum/comments";
		
	}
	
//	//R by id 用在點detail時
//	@GetMapping("/Forum/comments") 
//	public String getProjectById(@RequestParam("id") Integer id, Model model) {
//		model.addAttribute("forum", forumservice.getForumById(id));
//		model.addAttribute("forumid", id);
//		return "Forum/comments";
//								
//	}
	
	
//	//C
//	@PostMapping(path = "/Forum/addcomment") 
//	public ResponseEntity<String> add(@RequestParam("commenter") String commenter, 
//			@RequestParam("comment") String comment, 
////			@RequestParam("fImage") MultipartFile fImage,
//			HttpServletRequest request) throws MalformedURLException {
//		System.out.println("測試");
//		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd a hh:mm:ss");
//		Date date = new Date();
//		String commentTime = timeFormat.format(date);
//		
////		// 處理圖片
////		String originalFilename = fImage.getOriginalFilename();// 得到原始名稱，如xxx.jpg
////		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));// 取出副檔名 .png , .jpeg , .gif
////		String rootDirectory = servletContext.getRealPath("/").replace("webapp", "resources");
////		// 找到應用系統的根目錄 // C:\_JSP\tomcat9\webapps\mvcExercise
////		rootDirectory = rootDirectory + "\\static\\images\\Forum";
////
////		String filePath = "images/Forum/";// 存檔於static相對路徑，如images/Forum/xxx.jpg
////		File file = null;
////		try {
////			File imageFolder = new File(rootDirectory, name);
////			if (!imageFolder.exists())
////				imageFolder.mkdirs();// C:\_JSP\tomcat9\webapps\mvcExercise路徑下沒有images資料夾就建
////
////			file = new File(imageFolder, name + "_Cover" + ext);// File(路徑,檔名.副檔名)
////			System.out.println("檔案路徑為:" + file);
////			fImage.transferTo(file);// 把圖檔搬過去
////		} catch (Exception e) {
////			e.printStackTrace();
////		}
////
////		filePath += name + "/" + name + "_Cover" + ext;
////		ForumBean fBean=new ForumBean(name,post,postTime,postTime,filePath);
//		
//		CommentBean commentBean=new CommentBean(commenter,comment,commentTime);
//		commentservice.addComment(commentBean);
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
//		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
//		return ResponseEntity.ok().headers(responseHeaders).body(new Gson().toJson(commentBean));
////		return new ResponseEntity<String>("Y", HttpStatus.OK);
//	}
	
	//C 新增留言
	@PostMapping(path = "/Forum/addcomment")
	@ResponseBody
	public ResponseEntity<String> add(@RequestParam("forumcomment") String forumcomment,
			@RequestParam("id")Integer id,
			HttpServletRequest request,Model model)  {
		//取文章留言時間
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String commentTime = timeFormat.format(date);
		
		ProjectBean projectBean = projectService.getProjectById(id);
//		ForumBean forumBean = forumService.getForumById(id);
		Member member = (Member)request.getSession().getAttribute("memberData"); //member.getId()
		CommentBean commentBean = new CommentBean(member.getName(),forumcomment,commentTime,projectBean,member.getId()); //T
		Set<CommentBean> list = new LinkedHashSet<CommentBean>();
		list.add(commentBean);
		
		projectBean.setComment(list);
		projectService.addProject(projectBean);
		
		List<CommentBean> result = commentservice.getAllComment();
		System.out.println("全部留言");
		System.out.println(result);
		model.addAttribute("AllComment",result);

		return new ResponseEntity<String>( HttpStatus.OK);
	}
	
	
	//D
	@DeleteMapping(path = "/Forum/comments/{commentID}") //path自己隨便設，要對應jsp?用detail.jsp刪除
	@ResponseBody
	public String deleteCommentByCommentId(@PathVariable("commentID") int commentID) {
		
		commentservice.deleteCommentByCommentId(commentID);
		return "Delete OK"; //不會顯示因為有@ResponseBody
		
	}
	
	//U
	@PutMapping(path = "/Forum/comments/{commentID}")
	@ResponseBody
	public String newupdate(@PathVariable("commentID") int commentID, 
			@RequestParam("commenter") String commenter, 
			@RequestParam("comment") String comment, Model model) {
		
//		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd a hh:mm:ss");
//		Date date = new Date();
//		String postUpdatetime = timeFormat.format(date);
		
		CommentBean getCommentById = commentservice.getCommentByCommentId(commentID); //透過id取資料庫的表單
		CommentBean commentBean=new CommentBean(commentID, commenter, comment, getCommentById.getCommentTime());
		commentservice.updateComment(commentBean);
		return "success"; //不會顯示因為有@ResponseBody
		
	}
	
}
