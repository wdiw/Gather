package com.Gather.Activity.controller;

import java.io.File;
import java.net.MalformedURLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Gather.Activity.model.ActivityBean;
import com.Gather.Activity.service.ActivityService;

import org.springframework.http.ResponseEntity;


@RestController
public class ActivityAjaxControllerold {

	ActivityService activityService;
	ServletContext servletContext;// servletContext.getRealPath() 需要用

	@Autowired
	public ActivityAjaxControllerold(ActivityService activityService, ServletContext servletContext) {
		this.activityService = activityService;
		this.servletContext = servletContext;
	}
	
	
	// 刪除
		@DeleteMapping(path = "/Activity/theActivity/{id}")
		@ResponseBody
		public String deleteProjectById(@PathVariable("id") int id) {
			
			activityService.deleteActivityById(id);		
			return "Delete OK";
		}
		
		
		
		// 更新
		@PutMapping(path = "/Activity/theActivity/{id}")
		@ResponseBody
		public String updateProjectById(@PathVariable("id") int id, @RequestParam("name") String name,
				@RequestParam("description") String description, @RequestParam("beginDate") String beginDate,@RequestParam("endDate") String endDate) {

			ActivityBean activityBean=new ActivityBean(id,name,description,beginDate,endDate);
			activityService.updateActivity(activityBean);
			return "Update Finish";
		}
		
		
		
		 //新增
//		@PostMapping(path = "/Activity/add")
//		@ResponseBody
//		public String addProject( @RequestParam("name") String name,
//				@RequestParam("description") String description, @RequestParam("beginDate") String beginDate,@RequestParam("endDate") String endDate) {
//			
//			ActivityBean activityBean=new ActivityBean(name,description,beginDate,endDate);
//			activityService.addActivity(activityBean);
//			
//			
//			
//			return "add ok";
//			
//		}
		
		@PostMapping(path = "/Activity/add")
		//ResponseEntity 有回應標頭、回應本體、回應狀態碼
		//@RequestBody  請求本體,也就是會帶一個json過來，並用Users 的bean接起來
	    public ResponseEntity<String> processUserChcekAction( @RequestParam("name") String name,
				@RequestParam("description") String description, @RequestParam("beginDate") String beginDate,@RequestParam("endDate") String endDate
			){
			
			ActivityBean activityBean=new ActivityBean(name,description,beginDate,endDate);
			activityService.addActivity(activityBean);
		
			
			if(activityService.getActivityById(activityBean.getId())!=null) {
				return new ResponseEntity<String>("Y", HttpStatus.OK);
			}
			
			return new ResponseEntity<String>("N", HttpStatus.OK);
	    }
		

}
