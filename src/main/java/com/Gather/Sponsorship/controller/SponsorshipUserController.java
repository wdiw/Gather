package com.Gather.Sponsorship.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.print.attribute.standard.Sides;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.model.ProjectPlanBean;
import com.Gather.Project.service.ProjectService;
import com.Gather.Sponsorship.model.FavoriteBean;
import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.model.SponsorshipBean;
import com.Gather.Sponsorship.service.SponsorOrderService;
import com.Gather.Sponsorship.service.SponsorshipService;
import com.Gather.member.entity.Member;
import com.Gather.member.service.MemberService;
import com.google.gson.Gson;

@Controller
public class SponsorshipUserController {

	ProjectService projectService;
	MemberService memberService;
	SponsorOrderService sponsorOrderService;

	@Autowired
	public SponsorshipUserController(ProjectService projectService, MemberService memberService,
			SponsorOrderService sponsorOrderService) {
		this.projectService = projectService;
		this.memberService = memberService;
		this.sponsorOrderService = sponsorOrderService;
	}

	@GetMapping("/showProject/{pID}")
	public String showProject(@PathVariable("pID") Integer pID, HttpServletRequest request) {
		ProjectBean pBean = projectService.getProjectById(pID);
		request.getSession().setAttribute("pBean", pBean);
		return "Sponsorship/project";
	}

	@GetMapping("/payment")
	public String payment(HttpServletRequest reg, HttpServletRequest request) {
		Member member = (Member) reg.getSession().getAttribute("memberData");
		Member mBean = memberService.getMemberInfoByID(member.getId());
		request.getSession().setAttribute("mBean", mBean);
		return "Sponsorship/payment";
	}

//	//新增訂單
//	@PostMapping("/newOrder")
//	@ResponseBody
//	public ResponseEntity<String> newOrder(@RequestParam("sPID") String sPID, @RequestParam("sPName") String sPName,
//			@RequestParam("projectImage") String projectImage, @RequestParam("mID") String mID,
//			@RequestParam("sName") String sName, @RequestParam("sPhone") String sPhone,
//			@RequestParam("sBonus") String sBonus, @RequestParam("sAddress") String sAddress,
//			@RequestParam("sEmail") String sEmail, @RequestParam("sAmount") String sAmount,
//			@RequestParam("sDiscount") String sDiscount, @RequestParam("paymentMethod") String paymentMethod,
//			@RequestParam("proposerID") String proposerID
//
//	) throws IOException {
//
//		if (mID.isEmpty()) {
//			return new ResponseEntity<String>(HttpStatus.FORBIDDEN);
//		} else {
//
//			Integer sTotal = Integer.parseInt(sAmount) - Integer.parseInt(sDiscount) + Integer.parseInt(sBonus);
//			SponsorOrderBean sBean = new SponsorOrderBean(Integer.parseInt(mID), Integer.parseInt(sPID), sName, sPName,
//					paymentMethod, Integer.parseInt(sAmount), Integer.parseInt(sDiscount), Integer.parseInt(sBonus),
//					projectImage, sAddress, sPhone, sEmail, sTotal, Integer.parseInt(proposerID));
//
//			Long timeStamp = System.currentTimeMillis();
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			String sd = sdf.format(new Date(Long.parseLong(String.valueOf(timeStamp))));
//
//			sBean.setsTime(sd);
//			sBean.setStatus("待付款");
//			sponsorOrderService.insertOrder(sBean);
////			model.addAttribute("sID",sBean.getsID()) ;
//			return new ResponseEntity<String>(sBean.getsID().toString(),HttpStatus.OK);
//		}
//
//	}

	// 查詢贊助訂單

	@GetMapping("/sponsorshipInfo")
	public String sponsorshipInfo(HttpServletRequest reg) {
		Member member = (Member) reg.getSession().getAttribute("memberData");
		Member mBean = memberService.getMemberInfoByID(member.getId());

		List<SponsorOrderBean> sBean = sponsorOrderService.getOrdersByMemberID(mBean.getId());
		if (sBean.isEmpty()) {
			return "Sponsorship/noSponsorship";
		} else {
			reg.getSession().setAttribute("sBean", sBean);
			System.out.println("登入者id" + mBean.getId());
			return "Sponsorship/sponsorshipInfo";

		}
	}

	// 查詢及管理被贊助訂單

	@GetMapping("/sponsoredInfo")
	public String sponsoredInfo(HttpServletRequest reg) {
		Member member = (Member) reg.getSession().getAttribute("memberData");
		Member mBean = memberService.getMemberInfoByID(member.getId());
		List<ProjectBean> pBean = projectService.getAllProjectBymID(mBean.getId());
		List<SponsorOrderBean> sBean = sponsorOrderService.getOrdersByProposerID(pBean.get(0).getmID());
		reg.getSession().setAttribute("sBean", sBean);
		return "Sponsorship/sponsoredInfo";
	}

	//修改訂單狀態
	
	@PostMapping("/editOrder/{sID}")
	@ResponseBody
	public ResponseEntity<String> addUpdateOrderInfo(@PathVariable("sID") int sID,	
			HttpServletRequest reg,
		
			
//			@RequestParam("sPName") String sPName,
//
//			@RequestParam("sName") String sName,
//
//			@RequestParam("sPhone") String sPhone,
//
//			@RequestParam("sAddress") String sAddress,
//
//			@RequestParam("sTotal") String sTotalStr,
//
//			@RequestParam("paymentMethod") String paymentMethod,
//
//			@RequestParam("sTime") String sTime,

			@RequestParam("status") String status)

//			@RequestParam("projectImage") String projectImage)
					throws IOException {
		Member member = (Member) reg.getSession().getAttribute("memberData");
		Member mBean = memberService.getMemberInfoByID(member.getId());
		
		List<ProjectBean> pBean = projectService.getAllProjectBymID(mBean.getId());
		List<SponsorOrderBean> sBean = sponsorOrderService.getOrdersByProposerID(pBean.get(0).getmID());
		SponsorOrderBean sBean2=sponsorOrderService.getOrderBySponsorshipID(sID);
		sBean2.setStatus(status);
		
//		SponsorOrderBean sBean = new SponsorOrderBean(sID, Integer.parseInt(mID) ,sName, sPName, status, paymentMethod, sTime, projectImage,
//				sAddress, sPhone, Integer.parseInt(sTotal.trim()));

		sponsorOrderService.updateOrder(sBean2);
		return new ResponseEntity<String>(HttpStatus.OK);

	}
	
	//加入我的最愛
	@GetMapping("/favorite/{pID}")
	public String addFavorite(HttpServletRequest request,@PathVariable(name = "pID") String pID) {
		Member member = (Member) request.getSession().getAttribute("memberData");
		Member mBean = memberService.getMemberInfoByID(member.getId());
		ProjectBean pBean= projectService.getProjectById(Integer.parseInt(pID));
		FavoriteBean favoriteBean = new FavoriteBean();
		favoriteBean.setMember(mBean);
		favoriteBean.setProjectBean(pBean);
		sponsorOrderService.insertFavorite(favoriteBean);
//		Integer mBean_id=favoriteBean.getMember().getId();
	
		
		List<FavoriteBean> favoriteBeans= sponsorOrderService.getFavoriteByMemberID(mBean.getId());
		ArrayList<ProjectBean> projectBeans=new ArrayList<ProjectBean>();
		for(int i=0;i<favoriteBeans.size();i++) {
			ProjectBean projectBean=favoriteBeans.get(i).getProjectBean();
			projectBeans.add(projectBean);
	}
		
//		Member member_fav=memberService.getMemberInfoByID(mBean_id);
//		List<FavoriteBean> favoriteBean_all=sponsorOrderService.getFavoriteByMemberID(mBean);
//		List<FavoriteBean> pBean_favorite =sponsorOrderService.getFavoriteByMemberID(mBean_favorite);
		System.out.println(pBean.getpID());
		request.getSession().setAttribute("projectBeans", projectBeans);
		return "Sponsorship/favorite";
		
	}
	
	//移除我的最愛
	@PostMapping("/favorite/{favorite}")
	public String deleteFavorite(@PathVariable(name = "favorite") String favorite) {
		sponsorOrderService.deleteFavorite(Integer.parseInt(favorite));
		return "redirect:/Sponsorship/favorite";
	}
	
	

}
