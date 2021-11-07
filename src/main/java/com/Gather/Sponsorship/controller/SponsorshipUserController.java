package com.Gather.Sponsorship.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
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
import com.Gather.Project.service.ProjectService;
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
		Member mBean =  memberService.queryMemberById(member.getId());
		request.getSession().setAttribute("mBean", mBean);
		return "Sponsorship/payment";
	}

	@PostMapping("/newOrder")
	@ResponseBody
	public ResponseEntity<String> newOrder(@RequestParam("sPID") String sPID, @RequestParam("sPName") String sPName,
			@RequestParam("projectImage") String projectImage, @RequestParam("mID") String mID,
			@RequestParam("sName") String sName, @RequestParam("sPhone") String sPhone,
			@RequestParam("sBonus") String sBonus, @RequestParam("sAddress") String sAddress,
			@RequestParam("sEmail") String sEmail, @RequestParam("sAmount") String sAmount,
			@RequestParam("sDiscount") String sDiscount, @RequestParam("paymentMethod") String paymentMethod

	) throws IOException {

		Integer sTotal = Integer.parseInt(sAmount) - Integer.parseInt(sDiscount) + Integer.parseInt(sBonus);
		SponsorOrderBean sBean = new SponsorOrderBean(Integer.parseInt(mID), Integer.parseInt(sPID), sName, sPName,
				paymentMethod, Integer.parseInt(sAmount), Integer.parseInt(sDiscount), Integer.parseInt(sBonus),
				projectImage, sAddress, sPhone, sEmail, sTotal);

		Long timeStamp = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sd = sdf.format(new Date(Long.parseLong(String.valueOf(timeStamp))));

		sBean.setsTime(sd);
		sBean.setStatus("待付款");
		sponsorOrderService.insertOrder(sBean);

		return new ResponseEntity<String>(HttpStatus.OK);
	}

	// 查詢贊助訂單

	@GetMapping("/sponsorshipInfo")
	public String sponsorshipInfo(HttpServletRequest reg, HttpServletRequest request) {
		Member member = (Member) reg.getSession().getAttribute("memberData");
		Member mBean =  memberService.queryMemberById(member.getId());
		List<SponsorOrderBean> sBean=sponsorOrderService.getOrdersByMemberID(mBean.getId());
		request.getSession().setAttribute("sBean", sBean);
		return "Sponsorship/sponsorshipInfo";
	}

	// 查詢被贊助訂單

	@GetMapping("/sponsoredInfo")
	public String sponsoredInfo(Model model) {
		List<SponsorOrderBean> sBeans = sponsorOrderService.getOrders();
		model.addAttribute("sBeans", sBeans);
		return "Sponsorship/orders";
	}

}
