package com.Gather.Activity.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Gather.Activity.model.ActivityBean;
import com.Gather.Activity.model.ActivityParticipationBean;
import com.Gather.Activity.service.ActivityParticipationService;
import com.Gather.Activity.service.ActivityService;
import com.Gather.member.entity.Member;

@Controller
public class ActivityPageController {
    ActivityParticipationService activityParticipationService;
	ActivityService activityService;

	@Autowired
	public ActivityPageController(ActivityService activityService,ActivityParticipationService activityParticipationService) {
		super();
		this.activityService=activityService;
		this.activityParticipationService=activityParticipationService;
		
	}
	
	
	// 查詢所有提案
		@GetMapping("/Activity/sapage")
		public String sapage(Model model) {
			List<ActivityBean> result = activityService.getAllActivity();
			model.addAttribute("activities", result);
			return "/Activity/sapage";

		}
		
		@GetMapping("/Activity/userpage")
		public String userpage(Model model) {
			List<ActivityBean> result = activityService.getAllActivity();
			model.addAttribute("activities", result);
			return "/Activity/userpage";

		}

		// By Id 找尋單一資料並且跳轉
		@GetMapping("/Activity/activity")
		public String getProjectById(@RequestParam("id") Integer id, Model model) {
			
			model.addAttribute("activity", activityService.getActivityById(id));// 注意 是product 不是products
			model.addAttribute("activityid", id);// 注意 是product 不是products
			return "Activity/activitydetail";

		}
		
		@GetMapping("/Activity/activitylogin")
		public String actvityLogin(@RequestParam("id") Integer id, Model model,HttpServletRequest request) {
			Member memberData = (Member)request.getSession().getAttribute("memberData");
			  Integer mID = memberData.getId();
			  ActivityBean activityBean=activityService.getActivityById(id);
			model.addAttribute("activity", activityBean);
			model.addAttribute("activityid", id);
			System.out.println("會員編號:"+mID);
			System.out.println("活動編號:"+id);
             
        
			
		
			if (activityParticipationService.findActivityParticipationByM_idAndActivityId(activityBean, mID)!=null)
           {
			  ActivityParticipationBean activityParticipationBean=activityParticipationService.findActivityParticipationByM_idAndActivityId(activityBean, mID);
        	   model.addAttribute("activitylogin",activityParticipationBean );
				return "/Activity/activitylogin";
			} else {
				return "/Activity/activitylogin";
			}
			

		}
		
		
		
		
		
		

		// 跳轉到新增專案
		@GetMapping("/Activity/add")
		public String goToAddproject() {
			return "/Activity/add";

		}
		
	
	
}