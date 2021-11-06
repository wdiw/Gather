package com.Gather.Sponsorship.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Gather.Project.service.ProjectService;

import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.service.SponsorOrderService;
import com.Gather.member.entity.Member;
import com.Gather.member.service.MemberService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

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

//	//跳轉付款頁面
//	@PostMapping("/goECPay")
//	@ResponseBody
//	public  String genAioCheckOutALL(HttpServletRequest request,
//			@RequestParam("sBonus") String sBonus,
//			@RequestParam("sAmount") String sAmount,
//			@RequestParam("sDiscount") String sDiscount,
//			@RequestParam("sID") String sID
//			) {
//
//
//		SponsorOrderBean sob =sponsorOrderService.getOrderBySponsorshipID((sID));
//		System.out.println(sob.getsBonus());
//		Integer sTotal = (sAmount) - (sDiscount) + (sBonus);
//		
//		String MerchantTradeDate=sob.getsTime().replace("-", "/");
//		
//		String tradeNo = "item" + sob.getsID();
//		System.out.println(tradeNo);
//		System.out.println(sob.getsID());
//		
//		AllInOne all = new AllInOne("");
//		
//		AioCheckOutALL obj = new AioCheckOutALL();
//		
//		
//		obj.setMerchantID("2000132");  
//		obj.setMerchantTradeDate(MerchantTradeDate);
//		obj.setTotalAmount(sTotal.toString());
//		obj.setTradeDesc(sob.getmID() + "-" +sob.getsID() +  "-" + sob.getsTime());
//		obj.setItemName("Gather贊助一筆");
//		obj.setMerchantTradeNo(tradeNo);
//		obj.setReturnURL("http://211.23.128.214:5000");
//		obj.setNeedExtraPaidInfo("N");
//		obj.setClientBackURL("/");
//		String form = all.aioCheckOut(obj, null);
//		return form;			
//		
//		
//	}

	// 跳轉付款頁面
	@PostMapping("/goECPay")
		@ResponseBody
		public  String genAioCheckOutALL(HttpServletRequest request,
				@RequestParam("sPID") String sPID, @RequestParam("sPName") String sPName,
				@RequestParam("projectImage") String projectImage, @RequestParam("mID") String mID,
				@RequestParam("sName") String sName, @RequestParam("sPhone") String sPhone,
				@RequestParam("sBonus") String sBonus, @RequestParam("sAddress") String sAddress,
				@RequestParam("sEmail") String sEmail, @RequestParam("sAmount") String sAmount,
				@RequestParam("sDiscount") String sDiscount, @RequestParam("paymentMethod") String paymentMethod,
				@RequestParam("proposerID") String proposerID
	
				) {
			//新增訂單
			

				Integer sTotal =Integer.parseInt(sAmount)-Integer.parseInt(sDiscount)+Integer.parseInt(sBonus);
				SponsorOrderBean sBean = new SponsorOrderBean(Integer.parseInt(mID), Integer.parseInt(sPID), sName, sPName,
						paymentMethod, Integer.parseInt(sAmount), Integer.parseInt(sDiscount), Integer.parseInt(sBonus),
						projectImage, sAddress, sPhone, sEmail, sTotal, Integer.parseInt(proposerID));

				Long timeStamp = System.currentTimeMillis();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				String sd = sdf.format(new Date(Long.parseLong(String.valueOf(timeStamp))));

				sBean.setsTime(sd);
				sBean.setStatus("已付款");
				sponsorOrderService.insertOrder(sBean);
//				model.addAttribute("sID",sBean.getsID()) ;
			
		
//			Integer sTotal = (sAmount) - (sDiscount) + (sBonus);
			
			
	
			
			String tradeNo = "Gather" + sBean.getsID();
			System.out.println(tradeNo);
			System.out.println(sBean.getsID());
			
			AllInOne all = new AllInOne("");
			
			AioCheckOutALL obj = new AioCheckOutALL();
			
			
			obj.setMerchantID("2000132");  
			obj.setMerchantTradeDate(sd);
			obj.setTotalAmount(sTotal.toString());
			obj.setTradeDesc(sBean.getmID() + "-" +sBean.getsID() +  "-" + sBean.getsTime());
			obj.setItemName("Gather贊助一筆");
			obj.setMerchantTradeNo(tradeNo);
			obj.setReturnURL("http://211.23.128.214:5000");
			obj.setNeedExtraPaidInfo("N");
			obj.setClientBackURL("http://localhost:8080/Gather");
			String form = all.aioCheckOut(obj, null);
			return form;			
			
			
		}

}
