package com.Gather.Sponsorship.controller;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Gather.Project.service.ProjectService;

import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.service.SponsorOrderService;
import com.Gather.member.entity.Member;
import com.Gather.member.service.MemberService;

@Controller
public class SponsorshipPageController {

	@Autowired
	ProjectService projectService;
	@Autowired
	MemberService memberService;
	@Autowired
	SponsorOrderService sponsorOrderService;
	
//	@GetMapping("/showProject1")
//	public String showProject() {
//		return "Sponsorship/project";
//	}
	
//	@GetMapping("/payment")
//	public String payment() {
//		return "Sponsorship/payment";
//	}
	
	@GetMapping("/favorite")
	public String favorite() {
		return "Sponsorship/favorite";
	}
	
	//跳轉付款頁面
	@PostMapping("/goECPay")
	public void connectToEcPayment(Model model, HttpServletResponse response,HttpServletRequest reg,
			@RequestParam("sBonus") String sBonus,
			@RequestParam("sAmount") String sAmount,
			@RequestParam("sDiscount") String sDiscount,
			@RequestParam("sID") String sID
			) {

		Member member = (Member) reg.getSession().getAttribute("memberData");
		Member mBean = memberService.getMemberInfoByID(member.getId());
		Integer sTotal = Integer.parseInt(sAmount) - Integer.parseInt(sDiscount) + Integer.parseInt(sBonus);
		
		 					
		double totalAmount = Math.round(sTotal);  	// 計算訂單總金額 
//		String shippingAddress = request.getParameter("ShippingAddress");  // 出貨地址
		String shippingAddress = "桃園市大溪區中正路100號";  // 出貨地址
//		String bNO = request.getParameter("BNO");					// 發票的統一編號  
		String bNO = "25741010";					// 發票的統一編號  
//		String invoiceTitle = request.getParameter("InvoiceTitle");	// 發票的抬頭
		String invoiceTitle = "";	// 發票的抬頭
		Date today = new Date();   									// 新增訂單的時間
		// 新建訂單物件。OrderBean:封裝一筆訂單資料的容器，包含訂單主檔與訂單明細檔的資料。目前只存放訂單主檔的資料。
		Long odno = new Date().getTime();
		SponsorOrderBean sponsorOrderBean=sponsorOrderService.getOrderBySponsorshipID(Integer.parseInt(sID));
		sponsorOrderBean.seteCPay(odno);
		
		
		sponsorOrderService.prepareECPayData(sponsorOrderBean, response);
		
	}
	
	
}
