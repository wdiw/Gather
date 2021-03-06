package com.Gather.Activity.controller;

import java.util.HashSet;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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


import com.fasterxml.jackson.core.JsonProcessingException;




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
	
	
	
		@GetMapping("/sapageactivity")
		public String sapageactivity(Model model) {
	
			
			
			List<ActivityBean> activityBeans=activityService.getAllActivity();
			for (ActivityBean activityBean : activityBeans) {
				activityBean.setParticipationcount(activityParticipationService.getActivityParticipationCount(activityBean));
			}
			
			model.addAttribute("activities", activityBeans);
			return "/Activity/sapageactivity";

		}
		

		
			@GetMapping("/lottery")
			public String lottery(Model model,HttpServletRequest request) {
				Member member=(Member)request.getSession().getAttribute("memberData");
				ActivityBean activityBean=activityService.getActivityById(13);
				ActivityParticipationBean activityParticipationBean=activityParticipationService.findActivityParticipationByM_idAndActivityId(activityBean, member.getId());
				System.out.println(activityParticipationBean);
				model.addAttribute("activityParticipationBean", activityParticipationBean);
			
				
				return "/Activity/lottery";

			}
			
		
		
		@GetMapping("/sapageactivitylogin")
		public String sapageactivitylogin(Model model,HttpServletRequest request) throws JsonProcessingException {
			List<ActivityParticipationBean> activityParticipationBeans = activityParticipationService.getAllActivityParticipationBean();
			List<ActivityBean> activityBeans=activityService.getAllActivity();
			for (ActivityBean activityBean : activityBeans) {
				activityBean.setParticipationcount(activityParticipationService.getActivityParticipationCount(activityBean));
			}
			
			
		

                 
                 
                 
			
			
			model.addAttribute("activitylogins", activityParticipationBeans);
			request.getSession().setAttribute("activityBeans",activityBeans);
			
			
			return "/Activity/sapageactivitylogin";

		}
		
		
		
		
		
		
		@GetMapping("/activityCategory")
		public String activityCategory(Model model,String category) {
			List<ActivityBean> result = activityService.findActivityByCategory(category);
			System.out.println(result);
			model.addAttribute("activities", result);
			return "/Activity/activityCategory";

		}
		
		
		
		
		
		
		
		@GetMapping("/userpage")
		public String userpage(Model model) {
			List<ActivityBean> result = activityService.getAllActivity();
			System.out.println(result);
			model.addAttribute("activities", result);
			return "/Activity/userpage";

		}

		// By Id ??????????????????????????????
		@GetMapping("/Activity/activity")
		public String getActivityById(@RequestParam("id") Integer id, Model model) {
			
			model.addAttribute("activity", activityService.getActivityById(id));// ?????? ???product ??????products
			model.addAttribute("activityid", id);// ?????? ???product ??????products
			return "Activity/activitydetail";

		}
		
		@GetMapping("/activitylogin")
		public String actvityLogin(@RequestParam("id") Integer id, Model model,HttpServletRequest request) {
			Member memberData = (Member)request.getSession().getAttribute("memberData");
			  Integer mID = memberData.getId();
			  ActivityBean activityBean=activityService.getActivityById(id);
			model.addAttribute("activity", activityBean);
			model.addAttribute("activityid", id);
			System.out.println("????????????:"+mID);
			System.out.println("????????????:"+id);
			Integer activityParticipationCount=activityParticipationService.getActivityParticipationCount(activityBean);
			model.addAttribute("activityParticipationCount", activityParticipationCount);
        
			
		
			if (activityParticipationService.findActivityParticipationByM_idAndActivityId(activityBean, mID)!=null)
           {
			  ActivityParticipationBean activityParticipationBean=activityParticipationService.findActivityParticipationByM_idAndActivityId(activityBean, mID);
        	   model.addAttribute("activitylogin",activityParticipationBean );
				return "/Activity/activitylogin";
			} else {
				return "/Activity/activitylogin";
			}
			

		}
		
		
		
		
		
		

		// ?????????????????????
		@GetMapping("/addActivity")
		public String goToAddActivity() {
			return "/Activity/add";

		}
		
	
		
		
		@GetMapping("/search")
		public String activitysearch(HttpServletResponse resp, @RequestParam("search")String search,Model model) {
			Set<String> names = new HashSet<>();
			names.add("%"+search+"%");
			// filling the set with any number of items
			System.out.println("??????");
			System.out.println(names);
			List<ActivityBean> result=activityService.searchActivity(names);
			System.out.println(result);
			model.addAttribute("activityresults", result);
			
			 return "Activity/resultpage";
		}
		
		
		
		// ?????????????????????
				@GetMapping("/memberactivitylogin")
				public String goToMemberActivityLogin(HttpServletRequest request,Model model) {
					
					Member memberData = (Member)request.getSession().getAttribute("memberData");
					  Integer mID = memberData.getId();
					 List<ActivityParticipationBean>result= activityParticipationService.findActivityParticipationByM_id(mID);
					 
					 for (ActivityParticipationBean activityParticipationBean : result) {
						ActivityBean activityBean=activityParticipationBean.getActivityBean();
						activityParticipationBean.setActivityid(activityBean.getId());
					}
					
					 model.addAttribute("activitylogins", result);
					
					
					
					
					return "/Activity/memberactivitylogin";

				}
				
				
				@GetMapping("/activitylogindetail")
				public String actvityLoginDetail(@RequestParam("id") Integer id, Model model,HttpServletRequest request) {
					Member memberData = (Member)request.getSession().getAttribute("memberData");
					  Integer mID = memberData.getId();
					  ActivityBean activityBean=activityService.getActivityById(id);
					model.addAttribute("activity", activityBean);
					model.addAttribute("activityid", id);
					System.out.println("????????????:"+mID);
					System.out.println("????????????:"+id);
					Integer activityParticipationCount=activityParticipationService.getActivityParticipationCount(activityBean);
					model.addAttribute("activityParticipationCount", activityParticipationCount);
		        
					
				
				
						return "/Activity/activitylogindetail";
					
					

				}
			
	
	
}