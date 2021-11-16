package com.Gather.Sponsorship.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.model.ProjectPlanBean;
import com.Gather.Project.service.ProjectPlanService;
import com.Gather.Project.service.ProjectService;
import com.Gather.Sponsorship.model.FavoriteBean;
import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.service.SponsorOrderService;
import com.Gather.member.entity.Member;
import com.Gather.member.service.MemberService;
import com.Gather.util.Mail;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Controller
public class SponsorshipPageController {

	@Autowired
	ProjectService projectService;
	@Autowired
	ProjectPlanService projectPlanService;
	@Autowired
	MemberService memberService;
	@Autowired
	SponsorOrderService sponsorOrderService;


	// 跳轉付款頁面
	@PostMapping("/goECPay")
	@ResponseBody
	public String genAioCheckOutALL(HttpServletRequest request, @RequestParam("sPID") String sPID,
			@RequestParam("sPName") String sPName, @RequestParam("projectImage") String projectImage,
			@RequestParam("mID") String mID, @RequestParam("sName") String sName, @RequestParam("sPhone") String sPhone,
			@RequestParam("sBonus") String sBonus, @RequestParam("sAddress") String sAddress,
			@RequestParam("sEmail") String sEmail, @RequestParam("sAmount") String sAmount,
			@RequestParam("sDiscount") String sDiscount, @RequestParam("paymentMethod") String paymentMethod,
			@RequestParam("proposerID") String proposerID, @RequestParam("projectPlanID") String projectPlanID

	) {
		// 新增訂單
		Integer sTotal = Integer.parseInt(sAmount) - Integer.parseInt(sDiscount) + Integer.parseInt(sBonus);
		SponsorOrderBean sBean = new SponsorOrderBean(Integer.parseInt(mID), Integer.parseInt(sPID), sName, sPName,
				paymentMethod, Integer.parseInt(sAmount), Integer.parseInt(sDiscount), Integer.parseInt(sBonus),
				projectImage, sAddress, sPhone, sEmail, sTotal, Integer.parseInt(proposerID));

		Long timeStamp = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String sd = sdf.format(new Date(Long.parseLong(String.valueOf(timeStamp))));

		sBean.setsTime(sd);
		sBean.setStatus("已付款");
		ProjectBean pBean=projectService.getProjectById(Integer.parseInt(sPID));
		
		Integer pAmountNow= pBean.getpAmountNow();
		
		pAmountNow+=sTotal;
		
		sBean.setpAmountNow(pAmountNow);
		
//		Integer pAmountNow=sBean.getpAmountNow();
		sponsorOrderService.insertOrder(sBean);
//		List<SponsorOrderBean> sBean_toatl=sponsorOrderService.getOrdersByPIDAndStatus(Integer.parseInt(sPID), sBean.getStatus());
//		for(int i=0;i<sBean_toatl.size();i++) {
//			 Integer sTotal_select= sBean_toatl.get(i).getsTotal();
//			 pAmountNow += sTotal_select;
//		}
		

		ProjectPlanBean planBean = projectPlanService.getProjectPlanByProjectPlanID(Integer.parseInt(projectPlanID));
		
		Integer planAmount=planBean.getProjectPlanAmount();
		planAmount+=sTotal;
		
		projectService.updateProjectAmountBypID(Integer.parseInt(sPID), pAmountNow);
		projectPlanService.updateProjecPlantAmountByprojectPlanID(Integer.parseInt(projectPlanID), planAmount);
		
				
		
		Integer projectSponsorCount=pBean.getSponsorCount();
		projectSponsorCount++;
		
		projectService.updateProjectSponsorCountBypID(pBean.getpID(), projectSponsorCount);
		sponsorOrderService.updateAmountNowBysPID(Integer.parseInt(sPID), pAmountNow);
		
//		sponsorOrderService.updateOrder(sBean);


		String tradeNo = "Gather" + sBean.getsID();
		System.out.println(tradeNo);
		System.out.println(sBean.getsID());

		AllInOne all = new AllInOne("");

		AioCheckOutALL obj = new AioCheckOutALL();

		obj.setMerchantID("2000132");
		obj.setMerchantTradeDate(sd);
		obj.setTotalAmount(sTotal.toString());
		obj.setTradeDesc(sBean.getmID() + "-" + sBean.getsID() + "-" + sBean.getsTime());
		obj.setItemName("Gather贊助一筆");
		obj.setMerchantTradeNo(tradeNo);
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setClientBackURL("http://localhost:8080/Gather");
		String form = all.aioCheckOut(obj, null);
		
		//自動寄信
		Member mBean=memberService.queryMemberById(Integer.parseInt(mID));
		String content="親愛的"+mBean.getName()+"您好!<br>您的訂單:"+tradeNo.toString()+"，已成功贊助「"+sPName+"」專案，贊助總額為:"+sTotal+"元，<br>非常感謝您對本平台的喜愛，再次感謝您的贊助!";
		Mail.SendGmail("Gather.WebService@gmail.com",mBean.getAccount(),"Gather贊助平台付款成功通知",content);
		System.out.println("成功寄信");
		return form;

	}
	
	//利用計畫名稱搜尋訂單
	@GetMapping("/sponsorshipSearch")
	public String  getSponsorshipBySearch(
			@RequestParam("search") String search,Model model,HttpServletRequest request) {
		
		System.out.println("search:"+search);
		Set<String> searchName=new HashSet<>();
		searchName.add("%"+search+"%");
		
		System.out.println(searchName);
		
		List<SponsorOrderBean> result = sponsorOrderService.getSponsorshipBySearch(searchName);
		Member member = (Member) request.getSession().getAttribute("memberData");
		Member mBean = memberService.queryMemberById(member.getId());
		List<FavoriteBean> favoriteBeans = sponsorOrderService.getFavoriteByMemberID(mBean.getId());
		int favCount = favoriteBeans.size();
		request.getSession().setAttribute("favCount", favCount);
		model.addAttribute("sBean",result);
		return "Sponsorship/sponsorshipSearch";					
	}	
	
//	@GetMapping("/ordersSearch")
//	public String  getOrdersBySearch(
//			@RequestParam("search") String search,Model model,HttpServletRequest request) {
//		
//		System.out.println("search:"+search);
//		Set<String> searchName=new HashSet<>();
//		searchName.add("%"+search+"%");
//		
//		System.out.println(searchName);
//		List<SponsorOrderBean> result = sponsorOrderService.getOrdersBySearch(searchName);
//		model.addAttribute("orders",result);
//		return "Sponsorship/ordersSearch";					
//	}
	
	
	//利用計畫編號顯示圖示列表
	
	@PostMapping("/data/{sPID}")
	public ResponseEntity<String> getData(@PathVariable("sPID") String sPID, Model model) {
//		System.out.println(pID.getClass());
		List<SponsorOrderBean> ordersData = sponsorOrderService.getOrdersByPID(Integer.parseInt(sPID));
		Integer project_Amount=ordersData.get(0).getpAmountNow();
		model.addAttribute("project_Amount", project_Amount);
		return new ResponseEntity<String>(HttpStatus.OK);
	}
	
	@GetMapping("/dataInfo/{sPID}")
	public String dataInfo(@PathVariable("sPID") String sPID,Model model) {
		List<SponsorOrderBean> ordersData = sponsorOrderService.getOrdersByPID(Integer.parseInt(sPID));
		Integer project_Amount=ordersData.get(0).getpAmountNow();
		ProjectBean pBean= projectService.getProjectById(Integer.parseInt(sPID));
		List<ProjectPlanBean> planBean = projectPlanService.getProjectPlansByProjectBean(pBean);
		
		double male=0;
		double female=0;
		
		List<SponsorOrderBean> ordersForPID = sponsorOrderService.getOrdersByPID(Integer.parseInt(sPID));
		for(SponsorOrderBean sBean:ordersForPID) {
			Member sponsorMember = memberService.queryMemberById(sBean.getmID());
			if(sponsorMember.getSexual().equals("男")) {
				male++;
			}else {
				female++;
			}
		}
		List<SponsorOrderBean> orders = sponsorOrderService.getOrdersByPID(Integer.parseInt(sPID));		
		
		model.addAttribute("male",(male/(male+female))*100);
		model.addAttribute("female", (female/(male+female))*100);
		model.addAttribute("male_count", male);
		model.addAttribute("female_count", female);
		model.addAttribute("counts", male+female);
		model.addAttribute("planBean", planBean);
		model.addAttribute("pBean", pBean);
		model.addAttribute("project_Amount", project_Amount);
		model.addAttribute("orders", orders);
		return "Sponsorship/project_sponsorData";
	}
}
