package com.Gather.Sponsorship.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Gather.Activity.model.ActivityBean;
import com.Gather.Activity.service.ActivityParticipationService;
import com.Gather.Activity.service.ActivityService;
import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.model.ProjectPlanBean;
import com.Gather.Project.service.ProjectPlanService;
import com.Gather.Project.service.ProjectService;
import com.Gather.Sponsorship.model.FavoriteBean;
import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.service.SponsorOrderService;
import com.Gather.member.entity.Member;
import com.Gather.member.service.MemberService;

import java.awt.Desktop;

@Controller
public class SponsorshipUserController {

	ProjectService projectService;
	MemberService memberService;
	SponsorOrderService sponsorOrderService;
	ProjectPlanService projectPlanService;
	ActivityService activityService;
	ActivityParticipationService activityParticipationService;
 
	@Autowired
	public SponsorshipUserController(ProjectService projectService, MemberService memberService,
			SponsorOrderService sponsorOrderService, ProjectPlanService projectPlanService,ActivityService activityService,ActivityParticipationService activityParticipationService) {
		this.projectService = projectService;
		this.memberService = memberService;
		this.sponsorOrderService = sponsorOrderService;
		this.projectPlanService = projectPlanService;
		this.activityService = activityService;
		this.activityParticipationService=activityParticipationService;
	}

	@GetMapping("/showProject/{pID}")
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
		return "Sponsorship/project";
	}

	@GetMapping("/payment")
	 public String payment(HttpServletRequest reg, HttpServletRequest request, @RequestParam("pPID") Integer pPID) {
	  Member member = (Member) reg.getSession().getAttribute("memberData");
	  Member mBean = memberService.queryMemberById(member.getId());
	  ProjectPlanBean pPBean = projectPlanService.getProjectPlanByProjectPlanID(pPID);
	  Integer planAmount =pPBean.getProjectPlanPrice();
	  List<FavoriteBean> favoriteBeans = sponsorOrderService.getFavoriteByMemberID(mBean.getId());
	  ActivityBean discountActivity=activityService.getActivityById(18);
	  int favCount = favoriteBeans.size();
	  if(activityParticipationService.findActivityParticipationByM_idAndActivityId(discountActivity, member.getId())!=null) {
	   System.out.println("方案金額:"+planAmount);
	   
	   Integer discount=planAmount/1000*100;

	   request.getSession().setAttribute("favCount", favCount);
	   request.getSession().setAttribute("pPBean", pPBean);
	   request.getSession().setAttribute("mBean", mBean);
	   request.getSession().setAttribute("discount", discount);
	   
	   System.out.println("折扣金額"+discount);
	   
	   return "Sponsorship/payment";
	  }else {
	   Integer discount=0;

	   request.getSession().setAttribute("favCount", favCount);
	   request.getSession().setAttribute("pPBean", pPBean);
	   request.getSession().setAttribute("mBean", mBean);
	   request.getSession().setAttribute("discount", discount);
	   
	   return "Sponsorship/payment";
	  }
	  }
	// 查詢贊助訂單

	@GetMapping("/sponsorshipInfo")
	public String sponsorshipInfo(HttpServletRequest reg) {
		Member member = (Member) reg.getSession().getAttribute("memberData");
		Member mBean = memberService.queryMemberById(member.getId());
		
		if(mBean!=null) {
			List<FavoriteBean> favoriteBeans = sponsorOrderService.getFavoriteByMemberID(mBean.getId());
			int favCount = favoriteBeans.size();
			reg.getSession().setAttribute("favCount", favCount);
			reg.getSession().setAttribute("mBean", mBean);
			
			List<SponsorOrderBean> sBean = sponsorOrderService.getOrdersByMemberID(mBean.getId());
			if (sBean.isEmpty()) {
				return "Sponsorship/noSponsorship";
			} else {
				reg.getSession().setAttribute("sBean", sBean);
				System.out.println("登入者id" + mBean.getId());
				return "Sponsorship/sponsorshipInfo";
				
			}
		}else {
			return "Member/addMember";
		}
		
	}

	// 查詢及管理被贊助訂單

	@GetMapping("/sponsoredInfo")
	public String sponsoredInfo(HttpServletRequest reg) {
		Member member = (Member) reg.getSession().getAttribute("memberData");
		Member mBean = memberService.queryMemberById(member.getId());
		if(mBean!=null) {
			
			List<ProjectBean> pBean = projectService.getAllProjectBymID(mBean.getId());
			List<FavoriteBean> favoriteBeans = sponsorOrderService.getFavoriteByMemberID(mBean.getId());
			int favCount = favoriteBeans.size();
			reg.getSession().setAttribute("favCount", favCount);
			if (pBean.isEmpty()) {
				return "Sponsorship/noSponsorshiped";
			}
			List<SponsorOrderBean> sBean = sponsorOrderService.getOrdersByProposerID(pBean.get(0).getmID());
			reg.getSession().setAttribute("sBean", sBean);
			reg.getSession().setAttribute("mBean", mBean);
			return "Sponsorship/sponsoredInfo";
		}else {
			return "Member/addMember";
		}

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
		
		if(mBean!=null) {
			List<FavoriteBean> favoriteBeans = sponsorOrderService.getFavoriteByMemberID(mBean.getId());
			ArrayList<ProjectBean> projectBeans = new ArrayList<ProjectBean>();
			for (int i = 0; i < favoriteBeans.size(); i++) {
				ProjectBean projectBean = favoriteBeans.get(i).getProjectBean();
				projectBeans.add(projectBean);
			}
			
			int favCount = favoriteBeans.size();
			request.getSession().setAttribute("favCount", favCount);
			request.getSession().setAttribute("mBean", mBean);
			request.getSession().setAttribute("projectBeans", projectBeans);
			return "Sponsorship/favorite";
		}else {
			return "Member/addMember";
		}
		

	}
	
	//匯出資料
	
	@GetMapping("/Csv")
    public ResponseEntity<String> ordersCSV() throws SQLException, IOException {
     
     FileOutputStream fos=new FileOutputStream(new File("D:/admin/sponsorship.csv"));
     OutputStreamWriter osw=new OutputStreamWriter(fos,"MS950");
     BufferedWriter fileWriter = new BufferedWriter(osw);
        fileWriter.write("訂單編號,會員編號,贊助計畫,贊助者,贊助金額,聯絡電話,聯絡地址,聯絡信箱,訂單狀態,訂單時間");
        List<SponsorOrderBean> sBean= sponsorOrderService.getOrders();
        for (SponsorOrderBean s: sBean) {
         String line = String.format("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s",
          s.getsID(),s.getmID(),s.getsPName(),s.getsName(),s.getsTotal(),s.getsPhone(),s.getsAddress(),s.getsEmail(),s.getStatus(),s.getsTime());
                   
                  fileWriter.newLine();
                  fileWriter.write(line);                         
     }
        fileWriter.close();
        osw.close();
//        File orders = new File("D:/admin/sponsorship.csv");
//        Desktop.getDesktop().open(orders);
        return new ResponseEntity<String>(HttpStatus.OK);
    }
	
	
	

}
