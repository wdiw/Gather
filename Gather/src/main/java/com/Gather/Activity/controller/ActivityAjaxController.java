package com.Gather.Activity.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Base64;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Gather.Activity.model.ActivityBean;
import com.Gather.Activity.service.ActivityService;
import com.Gather.Sponsorship.model.SponsorshipBean;
import com.google.gson.Gson;

import org.springframework.http.ResponseEntity;


@RestController
public class ActivityAjaxController {

	ActivityService activityService;
	ServletContext servletContext;// servletContext.getRealPath() 需要用

	@Autowired
	public ActivityAjaxController(ActivityService activityService, ServletContext servletContext) {
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
		public ResponseEntity<String> updateProjectById(@PathVariable("id") int id, @RequestParam("name") String name,
				@RequestParam("description") String description, @RequestParam("beginDate") String beginDate,@RequestParam("endDate") String endDate,
				@RequestParam(required = false, name = "projectImage") MultipartFile photo) throws IOException {
			ActivityBean activityBean=activityService.getActivityById(id);
			byte[] image = new byte[1024];
			if (photo.isEmpty()) {
				
				image = activityBean.getImage();
			} else {
				InputStream is = photo.getInputStream();
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				
				int length;
				while ((length = is.read(image)) != -1) {
					baos.write(image, 0, length);
				}
				
				image = baos.toByteArray();
			}
			
			String base64String = Base64.getEncoder().encodeToString(image);
			ActivityBean updateActivityBean = new ActivityBean(id, name, description, beginDate, endDate, activityBean.getPostDate(),base64String, image);

			activityService.updateActivity(updateActivityBean);
			return new ResponseEntity<String>(HttpStatus.OK);
		}
		
		
		

		
		@PostMapping(path = "/Activity/add")
		//ResponseEntity 有回應標頭、回應本體、回應狀態碼
		//@RequestBody  請求本體,也就是會帶一個json過來，並用Users 的bean接起來
	    public ResponseEntity<String> processUserChcekAction( @RequestParam("name") String name,
				@RequestParam("description") String description, @RequestParam("beginDate") String beginDate,@RequestParam("endDate") String endDate,
				@RequestParam(required = false, name = "projectImage") MultipartFile photo) throws IOException{
			byte[] image = new byte[1024];
			InputStream is = photo.getInputStream();
			ByteArrayOutputStream baos = new ByteArrayOutputStream();

			int length;
			while ((length = is.read(image)) != -1) {
				baos.write(image, 0, length);
			}

			image = baos.toByteArray();
			String base64String = Base64.getEncoder().encodeToString(image);
			Date now= new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String postDate=sdf.format(now);
			
			ActivityBean activityBean = new ActivityBean(name, description, beginDate, endDate,postDate,image,base64String);
			activityService.addActivity(activityBean);
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			responseHeaders.add("Content-Type", "application/json; charset=utf-8");
			return ResponseEntity.ok().headers(responseHeaders).body(new Gson().toJson(activityBean));}
		
		
		
		// 圖片從資料庫輸出

		@GetMapping("/ActivitygetPicture/{id}")
		public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer id) {
			HttpHeaders headers = new HttpHeaders();

			ActivityBean activityBean=activityService.getActivityById(id);
			byte[] image = activityBean.getImage();

			ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(image, headers, HttpStatus.OK);
			return responseEntity;
		}
			
			
			
	

}
