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
import com.Gather.Project.service.ProjectPlanService;
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
	ProjectPlanService projectPlanService;

	@Autowired
	public SponsorshipUserController(ProjectService projectService, MemberService memberService,
			SponsorOrderService sponsorOrderService, ProjectPlanService projectPlanService) {
		this.projectService = projectService;
		this.memberService = memberService;
		this.sponsorOrderService = sponsorOrderService;
		this.projectPlanService = projectPlanService;
	}

	@GetMapping("/showProject/{pID}")
	public String showProject(@PathVariable("pID") Integer pID, HttpServletRequest request) {
		ProjectBean pBean = projectService.getProjectById(pID);
		Member member = (Member) request.getSession().getAttribute("memberData");
		Member mBean = memberService.queryMemberById(member.getId());
		FavoriteBean favoriteBean = sponsorOrderService.getFavoriteByMemberIDAndProjectID(mBean.getId(), pID);
		List<FavoriteBean> favoriteBeans = sponsorOrderService.getFavoriteByMemberID(mBean.getId());
		List<ProjectPlanBean> projectPlanList = projectPlanService.getProjectPlansByProjectBean(pBean);
		request.getSession().setAttribute("projectPlanList", projectPlanList);
		int favCount = favoriteBeans.size();
		request.getSession().setAttribute("favoriteBean", favoriteBean);
		request.getSession().setAttribute("favCount", favCount);
		request.getSession().setAttribute("pBean", pBean);
		request.getSession().setAttribute("mBean", mBean);

		return "Sponsorship/project";
	}

	@GetMapping("/payment")
	public String payment(HttpServletRequest reg, HttpServletRequest request, @RequestParam("pPID") Integer pPID) {
		Member member = (Member) reg.getSession().getAttribute("memberData");
		Member mBean = memberService.queryMemberById(member.getId());
		ProjectPlanBean pPBean = projectPlanService.getProjectPlanByProjectPlanID(pPID);
		request.getSession().setAttribute("pPBean", pPBean);
		request.getSession().setAttribute("mBean", mBean);
		return "Sponsorship/payment";
	}

	// 查詢贊助訂單

	@GetMapping("/sponsorshipInfo")
	public String sponsorshipInfo(HttpServletRequest reg) {
		Member member = (Member) reg.getSession().getAttribute("memberData");
		Member mBean = memberService.queryMemberById(member.getId());

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
		Member mBean = memberService.queryMemberById(member.getId());
		List<ProjectBean> pBean = projectService.getAllProjectBymID(mBean.getId());
		if (pBean.isEmpty()) {
			return "Sponsorship/noSponsorshiped";
		}
		List<SponsorOrderBean> sBean = sponsorOrderService.getOrdersByProposerID(pBean.get(0).getmID());
		reg.getSession().setAttribute("sBean", sBean);
		return "Sponsorship/sponsoredInfo";

	}

	// 修改訂單狀態

	@PostMapping("/editOrder/{sID}")
	@ResponseBody
	public ResponseEntity<String> addUpdateOrderInfo(@PathVariable("sID") int sID, HttpServletRequest reg,

			@RequestParam("status") String status)

			throws IOException {
		Member member = (Member) reg.getSession().getAttribute("memberData");
		Member mBean = memberService.queryMemberById(member.getId());

		List<ProjectBean> pBean = projectService.getAllProjectBymID(mBean.getId());
		List<SponsorOrderBean> sBean = sponsorOrderService.getOrdersByProposerID(pBean.get(0).getmID());
		SponsorOrderBean sBean2 = sponsorOrderService.getOrderBySponsorshipID(sID);
		sBean2.setStatus(status);

		sponsorOrderService.updateOrder(sBean2);
		return new ResponseEntity<String>(HttpStatus.OK);

	}

	// 加入我的收藏
	@GetMapping("/favorite/{pID}")
	public ResponseEntity<String> addFavorite(HttpServletRequest request, @PathVariable(name = "pID") String pID) {
		Member member = (Member) request.getSession().getAttribute("memberData");
		Member mBean = memberService.queryMemberById(member.getId());
		ProjectBean pBean = projectService.getProjectById(Integer.parseInt(pID));
		FavoriteBean favoriteBean = new FavoriteBean();
		favoriteBean.setMember(mBean);
		favoriteBean.setProjectBean(pBean);
		sponsorOrderService.insertFavorite(favoriteBean);
		return new ResponseEntity<String>(HttpStatus.OK);

	}

	// 移除我的收藏
	@GetMapping("/delFavorite/{pID}")
	public ResponseEntity<String> deleteFavorite(HttpServletRequest request, @PathVariable(name = "pID") String pID) {
		Member member = (Member) request.getSession().getAttribute("memberData");
		Member mBean = memberService.queryMemberById(member.getId());
		ProjectBean pBean = projectService.getProjectById(Integer.parseInt(pID));
		FavoriteBean favoriteBean = sponsorOrderService.getFavoriteByMemberIDAndProjectID(mBean.getId(),
				Integer.parseInt(pID));
		sponsorOrderService.deleteFavorite(favoriteBean);
		return new ResponseEntity<String>(HttpStatus.OK);

	}

	// 查詢我的收藏

	@GetMapping("/myFav/{mID}")
	public String favList(HttpServletRequest request, @PathVariable(name = "mID") String mID) {
		Member member = (Member) request.getSession().getAttribute("memberData");
		Member mBean = memberService.queryMemberById(member.getId());
		List<FavoriteBean> favoriteBeans = sponsorOrderService.getFavoriteByMemberID(mBean.getId());
		ArrayList<ProjectBean> projectBeans = new ArrayList<ProjectBean>();
		for (int i = 0; i < favoriteBeans.size(); i++) {
			ProjectBean projectBean = favoriteBeans.get(i).getProjectBean();
			projectBeans.add(projectBean);
		}

		request.getSession().setAttribute("projectBeans", projectBeans);
		return "Sponsorship/favorite";

	}

}
