package com.Gather.Activity.controller;

import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.http.HttpRequest;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

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
import com.Gather.Activity.model.ActivityParticipationBean;
import com.Gather.Activity.service.ActivityParticipationService;
import com.Gather.Activity.service.ActivityService;
import com.Gather.Sponsorship.model.SponsorshipBean;
import com.Gather.member.entity.Member;
import com.Gather.member.service.MemberService;
import com.Gather.util.Mail;
import com.google.gson.Gson;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;


@RestController
public class ActivityAjaxController {
    ActivityParticipationService activityParticipationService;
    MemberService memberService;
	ActivityService activityService;
	ServletContext servletContext;// servletContext.getRealPath() 需要用

	@Autowired
	public ActivityAjaxController(ActivityService activityService, ServletContext servletContext,MemberService memberService, ActivityParticipationService activityParticipationService) {
		System.out.println("debug");
		this.activityService = activityService;
		this.servletContext = servletContext;
		this.activityParticipationService=activityParticipationService;
		this.memberService=memberService;
		
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
				@RequestParam("category") String category,@RequestParam(required = false, name = "projectImage") MultipartFile photo) throws IOException {
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
			ActivityBean updateActivityBean = new ActivityBean(id, name, description, beginDate, endDate, activityBean.getPostDate(),category,base64String, image);

			activityService.updateActivity(updateActivityBean);
			return new ResponseEntity<String>(HttpStatus.OK);
		}
		
		
		

		
		@PostMapping(path = "/Activity/add")
		//ResponseEntity 有回應標頭、回應本體、回應狀態碼
		//@RequestBody  請求本體,也就是會帶一個json過來，並用Users 的bean接起來
	    public ResponseEntity<String> processUserChcekAction( @RequestParam("name") String name,
				@RequestParam("description") String description, @RequestParam("beginDate") String beginDate,@RequestParam("endDate") String endDate,
				@RequestParam("category") String category,@RequestParam(required = false, name = "projectImage") MultipartFile photo) throws IOException{
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
			
			ActivityBean activityBean = new ActivityBean(name, description, beginDate, endDate,postDate,category,image,base64String);
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
			
		
		@PutMapping(path = "/Activity/login/{id}")
	    public ResponseEntity<String> processUserActivityLogin( @PathVariable("id") int activityid,@RequestParam("memberid") int memberid,Model model){

				Member member=memberService.queryMemberById(memberid);
		
				ActivityBean activity=activityService.getActivityById(activityid);	
				Date now= new Date();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String loginTime=sdf.format(now);		
				ActivityParticipationBean activityParticipationBean=new ActivityParticipationBean();
				activityParticipationBean.setActivityBean(activity);
	            activityParticipationBean.setM_id(memberid);
				activityParticipationBean.setLogintime(loginTime);
				activityParticipationBean.setMembername(member.getName());
				activityParticipationBean.setActivityname(activity.getName());
				Set<ActivityParticipationBean> activityParticipationBeans = new LinkedHashSet<ActivityParticipationBean>();
				activityParticipationBeans.add(activityParticipationBean);
				activity.setActivityParticipation(activityParticipationBeans);
				
			
				activityService.addActivity(activity);
				model.addAttribute("activitylogin",activityParticipationBean );
				
				
				
				String activityLogin=member.getName()+"您好，您已成功登錄活動，活動名稱:"+activity.getName();
				Mail.SendGmail("Gather.WebService@gmail.com", "ChillSeph0729@gmail.com", "Gather活動登錄成功通知",activityLogin);
				
				
			
				
				
				return new ResponseEntity<String>(HttpStatus.OK);}
				
			

		
			
			
		// 刪除
		@DeleteMapping(path = "/Activity/theActivityLogin/{id}")
		@ResponseBody
		public ResponseEntity<String> deleteActivityLoginById(@PathVariable("id") int id,HttpServletRequest request) {
		    System.out.println(id);
			Member member = (Member)request.getSession().getAttribute("memberData");
			ActivityBean activity=activityParticipationService.getActivityParticipationBeanById(id).getActivityBean();
			String activityLogin=member.getName()+"您好，您成功取消活動，活動名稱:"+activity.getName();
			Mail.SendGmail("Gather.WebService@gmail.com", "ChillSeph0729@gmail.com", "Gather取消活動登錄通知",activityLogin);
					activityParticipationService.deleteActivityParticipationByactivityParticipationid(id);
				
					
			return new ResponseEntity<String>(HttpStatus.OK);
		}
		
		//輸出Json資料
		@GetMapping("/GatherActivityOutput")
		public ResponseEntity<String> activityOutput() throws SQLException, IOException {
			
			FileOutputStream fos=new FileOutputStream(new File("C://Gather//GatherActivityOutput//GatherActivityOutput.json"));
			OutputStreamWriter osw=new OutputStreamWriter(fos);
			BufferedWriter fileWriter = new BufferedWriter(osw);
		    fileWriter.write("活動ID, 活動名稱,活動內容,活動開始日期,活動結束日期,發布時間,活動類別");
		    List<ActivityBean> activityBeans= activityService.getAllActivity();
		    for (ActivityBean activityBean : activityBeans) {
		    	String line = String.format("%s,%s,%s,%s,%s,%s,%s",
                      activityBean.getId(),activityBean.getName(),activityBean.getDescription(),activityBean.getBeginDate(),activityBean.getEndDate(),activityBean.getPostDate(),activityBean.getCategory());
                 
                fileWriter.newLine();
                fileWriter.write(line);     	              					
			}
		    fileWriter.close();
		    osw.close();
		    return new ResponseEntity<String>(HttpStatus.OK);
		}
		
		
		//輸出Json資料
				@GetMapping("/GatherActivityLoginOutput")
				public ResponseEntity<String> activityLoginOutput() throws SQLException, IOException {
					
					FileOutputStream fos=new FileOutputStream(new File("C://Gather//GatherActivityLoginOutput//GatherActivityLoginOutput.json"));
					OutputStreamWriter osw=new OutputStreamWriter(fos);
					BufferedWriter fileWriter = new BufferedWriter(osw);
				    fileWriter.write("活動登錄ID, 活動ID,活動名稱,活動登錄時間,會員ID,會員名稱");
				    List<ActivityParticipationBean> activityBeans= activityParticipationService.getAllActivityParticipationBean();
				    for (ActivityParticipationBean activityParticipation: activityBeans) {
				    	String line = String.format("%s,%s,%s,%s,%s,%s",
		                activityParticipation.getActivityParticipationid(),activityParticipation.getActivityid(),activityParticipation.getActivityname(),activityParticipation.getLogintime(),activityParticipation.getM_id(),activityParticipation.getMembername());
		                 
		                fileWriter.newLine();
		                fileWriter.write(line);     	              					
					}
				    fileWriter.close();
				    osw.close();
				    return new ResponseEntity<String>(HttpStatus.OK);
				}

				
				//抽獎活動寄信
				@GetMapping("/lotteryresult")
				public ResponseEntity<String> lotteryreult(@RequestParam("lotteryresult")String lotteryesult,HttpServletRequest request)  {
					
					System.out.println("開獎結果"+lotteryesult);
					
					Member member = (Member)request.getSession().getAttribute("memberData");
					String lotteryreultmail=member.getName()+"您好，恭喜您參加Gather線上抽獎活動抽中:"+lotteryesult;
					Mail.SendGmail("Gather.WebService@gmail.com", "ChillSeph0729@gmail.com", "Gather線上抽獎中獎通知",lotteryreultmail);

					
				    return new ResponseEntity<String>(HttpStatus.OK);
				}


				
				
				
			

}
