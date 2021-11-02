package com.Gather.Sponsorship.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Base64;

import javax.print.attribute.standard.Sides;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.service.ProjectService;
import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.model.SponsorshipBean;
import com.Gather.Sponsorship.service.SponsorshipService;
import com.Gather.member.entity.Member;
import com.Gather.member.service.MemberService;
import com.google.gson.Gson;

@Controller
public class SponsorshipUserController {

	ProjectService projectService;
	MemberService memberService;
	SponsorshipService sponsorshipService;

	@Autowired
	public SponsorshipUserController(ProjectService projectService, MemberService memberService) {
		this.projectService = projectService;
		this.memberService = memberService;
	}

	@GetMapping("/showProject/{pID}")
	public String showProject(@PathVariable("pID") Integer pID, Model model, HttpServletRequest request) {
		ProjectBean pBean = projectService.getProjectById(pID);
		model.addAttribute("pBean", pBean);
		request.getSession().setAttribute("pBean", pBean);
		return "Sponsorship/project";
	}

	@GetMapping("/payment")
	public String payment(HttpServletRequest reg, HttpServletRequest request) {
		Member member = (Member) reg.getSession().getAttribute("memberData");
		Member mBean = memberService.getMemberInfoByID(member.getId());
		request.getSession().setAttribute("mBean", mBean);
		return"Sponsorship/payment";
	}
	
	@PostMapping("/newOrder")
	@ResponseBody
	public ResponseEntity<String> newOrder(
			@RequestParam("sPID") Integer sPID,
			@RequestParam("sPName") String sPName,
			@RequestParam("projectImage") String projectImage,
			@RequestParam("mID") Integer mID,
			@RequestParam("sName") String sName,
			@RequestParam("sPhone") String sPhone,
			@RequestParam("sBonus") Integer sBonus,
			@RequestParam("sAddress") String sAddress,
			@RequestParam("sEmail") String sEmail,
			@RequestParam("sAmount") Integer sAmount,
			@RequestParam("sDiscount") Integer sDiscount,
			@RequestParam("paymentMethod") String paymentMethod,
			@RequestParam("sID") Integer sID
			
			) throws IOException {
		
		SponsorOrderBean sBean = new SponsorOrderBean(sID,mID,sPID, sName,sPName, paymentMethod,sAmount, sDiscount, sBonus, projectImage,sAddress,sPhone,
				sEmail);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return ResponseEntity.ok().headers(responseHeaders).body(new Gson().toJson(sBean));
	}

}
