package com.Gather.Project.controller;

import java.io.File;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.model.ProjectPlanBean;
import com.Gather.Project.service.ProjectService;
import com.Gather.member.entity.Member;
import com.Gather.member.service.MemberService;
import com.Gather.util.Mail;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;


@RestController
@SessionAttributes("allProject")
public class ProjectController {

	ProjectService projectService;
	ServletContext servletContext;// servletContext.getRealPath() 需要用
	MemberService memberService;//寄信需要用

	@Autowired
	public ProjectController(ProjectService projectService, ServletContext servletContext,MemberService memberService) {
		this.projectService = projectService;
		this.servletContext = servletContext;
		this.memberService=memberService;
	}

	// 刪除
	@DeleteMapping(path = "/Project/theProject/{pID}")
	@ResponseBody
	public String deleteProjectById(@PathVariable("pID") int pID) {
		projectService.deleteProjectById(pID);
		return "Delete OK";
	}

	// 管理員更新狀態
	@PutMapping(path = "/Project/theProject/changeStatus/{pID}")
	@ResponseBody
	public ResponseEntity<String> changeProjectStatusById(
			@PathVariable("pID") int pID,
			@RequestParam("pStatus") String pStatus,
			@RequestParam("reason") String reason
			) {
	
		projectService.updateStatusBypID(pID, pStatus,reason );
		
		ProjectBean projectBean = projectService.getProjectById(pID);
		String projectName = projectBean.getpName();
		Integer mID = projectBean.getmID();//得到會員ID
		
		Member member = memberService.queryMemberById(mID);
		String memberName = member.getName();
		
		
		if(pStatus.equals("通過")) {
			String statusChange="親愛的會員"+memberName+"您好~<br>您所提出的計畫 "+projectName+" 已通過，祝您募資計畫順利!";
			Mail.SendGmail("Gather.WebService@gmail.com", " ChillSeph0729@gmail.com", "計畫審核通過通知",statusChange);
		}else {
			String statusChange="親愛的會員"+memberName+"您好~<br>您所提出的計畫 "+projectName+" 已未通過。原因為:<br>"+reason;
			//member.getName()+"您好，您已成功登錄活動，活動名稱:"+activity.getName();
			Mail.SendGmail("Gather.WebService@gmail.com", " ChillSeph0729@gmail.com", "計畫審核未通過通知",statusChange);
		}
	
		
		return new ResponseEntity<String>("Y", HttpStatus.OK);
	}
	

	
	
	
	// 更新
	@PutMapping(path = "/Project/theProject/{pID}")
	@ResponseBody
	public ResponseEntity<String> updateProjectById(
			@PathVariable("pID") int pID,
			@RequestParam("pName") String pName,
			@RequestParam("pDescribe") String pDescribe,
			@RequestParam("pTarget") int pTarget,
			@RequestParam("pSDate") String pSDate,
			@RequestParam("pEDate") String pEDate,
			@RequestParam("pContent") String pContent,
			@RequestParam("pStatus") String pStatus,
			@RequestParam(name = "changeImageCover",required = false) MultipartFile pImage,
			@RequestParam("reason") String reason,
			HttpServletRequest request
			
			

	) throws MalformedURLException {
			
		Member memberData = (Member) request.getSession().getAttribute("memberData");
		Integer mID = memberData.getId();
		Integer sponsorCount = projectService.getProjectById(pID).getSponsorCount();//取得已被贊助數

		// 如果圖片沒有換掉，先把原路徑抓出來，再丟回去
		if (pImage.isEmpty()) {

			String filePath = projectService.getProjectById(pID).getpImageCover();
			
			ProjectBean pBean = new ProjectBean(pID, pName, pTarget, pSDate, pEDate, filePath, pDescribe, pContent, mID,
					pStatus,reason,sponsorCount);
			projectService.updateProject(pBean);

		} else {
			// 處理圖片
			String originalFilename = pImage.getOriginalFilename();// 得到原始名稱，如xxx.jpg
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));// 取出副檔名 .png , .jpeg , .gif
			String rootDirectory = servletContext.getRealPath("/").replace("webapp", "resources");// 找到應用系統的根目錄
																									// C:\_JSP\tomcat9\webapps\mvcExercise
			rootDirectory = rootDirectory + "\\static\\images\\Project";

			String filePath = "images/Project/";// 存檔於static相對路徑，如images/Project/xxx.jpg
			File file = null;
			try {
				File imageFolder = new File(rootDirectory, pName);
				if (!imageFolder.exists())
					imageFolder.mkdirs();// C:\_JSP\tomcat9\webapps\mvcExercise路徑下沒有images資料夾就建

				file = new File(imageFolder, pName + "_Cover" + ext);// File(路徑,檔名.副檔名)
				System.out.println("更新檔案路徑為:" + file);
				pImage.transferTo(file);// 把圖檔搬過去
			} catch (Exception e) {
				e.printStackTrace();
			}

			filePath += pName + "/" + pName + "_Cover" + ext;
			ProjectBean pBean = new ProjectBean(pID, pName, pTarget, pSDate, pEDate, filePath, pDescribe, pContent, mID,
					pStatus,reason,sponsorCount);
			projectService.updateProject(pBean);
		}

		return new ResponseEntity<String>("Y", HttpStatus.OK);
	}
	
	
	

	
	
	
	
	
	
	
	
	

	// 新增
	@PostMapping(path = "/Project/addProject")
	@ResponseBody
	public ResponseEntity<String> addProject(
			//專案相關
			@RequestParam("pName") String pName,
			@RequestParam("pTarget") Integer pTarget,
			@RequestParam("pSDate") String pSDate, 
			@RequestParam("pEDate") String pEDate,
			@RequestParam("pDescribe") String pDescribe,
			@RequestParam("pContent") String pContent,
			@RequestParam("pImage") MultipartFile pImage,
			@RequestParam("pCategory") String pCategory,
			
			//回饋一
			@RequestParam("projectPlanPrice1") Integer projectPlanPrice1,
			@RequestParam("ETA1") String ETA1,
			@RequestParam("projectPlanContent1") String projectPlanContent1,
			@RequestParam("projectPlanImage1") MultipartFile projectPlanImage1,
			
			//回饋二
			@RequestParam(name = "projectPlanPrice2",required = false ) Integer projectPlanPrice2,
			@RequestParam(name = "ETA2",required = false) String ETA2,
			@RequestParam(name ="projectPlanContent2",required = false) String projectPlanContent2,
			@RequestParam(name ="projectPlanImage2",required = false) MultipartFile projectPlanImage2,
			
			//回饋3
			@RequestParam(name ="projectPlanPrice3",required = false) Integer projectPlanPrice3,
			@RequestParam(name ="ETA3",required = false) String ETA3,
			@RequestParam(name ="projectPlanContent3",required = false) String projectPlanContent3,
			@RequestParam(name ="projectPlanImage3",required = false) MultipartFile projectPlanImage3, 
			HttpServletRequest request
			
			
	) throws MalformedURLException {
		

		Member memberData = (Member) request.getSession().getAttribute("memberData");
		Integer mID = memberData.getId();

		
		
		// 處理封面
		String originalFilename = pImage.getOriginalFilename();// 得到原始名稱，如xxx.jpg
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));// 取出副檔名 .png , .jpeg , .gif
		String rootDirectory = servletContext.getRealPath("/").replace("webapp", "resources");// 找到應用系統的根目錄
																								// C:\_JSP\tomcat9\webapps\mvcExercise
		rootDirectory = rootDirectory + "\\static\\images\\Project";

		String filePath = "images/Project/";// 存檔於static相對路徑，如images/Project/xxx.jpg
		File imageFolder=null;//存檔路徑
		File coverFile = null;//封面包含副檔名完整的存檔路徑
		File projectPlanFile1=null;//方案一包含副檔名完整的存檔路徑
		File projectPlanFile2=null;//方案二包含副檔名完整的存檔路徑
		File projectPlanFile3=null;//方案三包含副檔名完整的存檔路徑
		String projectPlanFilePath1="";//方案一的相對路徑，要存資料庫用
		String projectPlanFilePath2="";//方案二的相對路徑，要存資料庫用
		String projectPlanFilePath3="";//方案三的相對路徑，要存資料庫用
		
		//用list 裝多方的所有bean
		Set<ProjectPlanBean> ProjectPlanBeanList = new LinkedHashSet<ProjectPlanBean>();
		
		//處理封面圖片
		imageFolder = new File(rootDirectory, pName);
		try {
			if (!imageFolder.exists())
				imageFolder.mkdirs();// C:\_JSP\tomcat9\webapps\mvcExercise路徑下沒有images資料夾就建

			coverFile = new File(imageFolder, pName + "_Cover" + ext);// File(路徑,檔名.副檔名)
			System.out.println("檔案路徑為:" + coverFile);
			pImage.transferTo(coverFile);// 把圖檔搬過去
		} catch (Exception e) {
			e.printStackTrace();
		}
		String coverFilePath=filePath+ pName + "/" + pName + "_Cover" + ext;//存封面圖片的相對路徑，static\images\Project\xxx\xxx_Cover.jpg
		//New 一方的Bean
		ProjectBean pBean = new ProjectBean(pName, pTarget, pSDate, pEDate,
				coverFilePath, pDescribe, pContent, mID, "待審核","請待管理員進行審核",pCategory);// 存到資料庫，目前會員ID先死
		
		
		
		if(!(projectPlanImage1.isEmpty())) {
		// 處理贊助方案一圖片
		String projectPlanOriginalFilename1 = projectPlanImage1.getOriginalFilename();// 得到原始名稱，如xxx.jpg
		String projectPlanExt1 = projectPlanOriginalFilename1.substring(projectPlanOriginalFilename1.lastIndexOf("."));// 取出副檔名 .png , .jpeg , .gif
																								// C:\_JSP\tomcat9\webapps\mvcExercise
		projectPlanFile1 = new File(imageFolder,"projectPlanImage1" + projectPlanExt1);// File(路徑,檔名.副檔名)
		try {
			projectPlanImage1.transferTo(projectPlanFile1);// 把圖檔搬過去
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		projectPlanFilePath1=filePath+ pName+"/projectPlanImage1"+projectPlanExt1;//存方案一的相對路徑static\images\Project\xxx\projectPlan1.jpg
		
		projectPlanContent1=projectPlanContent1.replaceAll("/","<br>");
		System.out.println("方案1內容為"+projectPlanContent1);
		
		//New 多方的Bean
		ProjectPlanBean projectPlanBean1 = new ProjectPlanBean(projectPlanPrice1, projectPlanContent1,ETA1, projectPlanFilePath1, pBean);
		//加進List中
		ProjectPlanBeanList.add(projectPlanBean1);
		}	
			
		
		
		
		
		if(!(projectPlanImage2.isEmpty())) 
			{//如果方案二有放圖片
				// 處理贊助方案二圖片
				String projectPlanOriginalFilename2 = projectPlanImage2.getOriginalFilename();// 得到原始名稱，如xxx.jpg
				String projectPlanExt2 = projectPlanOriginalFilename2.substring(projectPlanOriginalFilename2.lastIndexOf("."));// 取出副檔名 .png , .jpeg , .gif
																										// C:\_JSP\tomcat9\webapps\mvcExercise
				projectPlanFile2 = new File(imageFolder,"projectPlanImage2" + projectPlanExt2);// File(路徑,檔名.副檔名)
				try {
					projectPlanImage2.transferTo(projectPlanFile2);// 把圖檔搬過去
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				projectPlanFilePath2=filePath+ pName+"/projectPlanImage2"+projectPlanExt2;//存方案二的相對路徑static\images\Project\xxx\projectPlan2.jpg
				//New 多方的Bean
				ProjectPlanBean projectPlanBean2 = new ProjectPlanBean(projectPlanPrice2, projectPlanContent2,ETA2, projectPlanFilePath2, pBean);
				//加進List中
				ProjectPlanBeanList.add(projectPlanBean2);
			}
		
		
				
		if(!(projectPlanImage3.isEmpty())) { 
				// 處理贊助方案三圖片
				String projectPlanOriginalFilename3 = projectPlanImage3.getOriginalFilename();// 得到原始名稱，如xxx.jpg
				String projectPlanExt3 = projectPlanOriginalFilename3.substring(projectPlanOriginalFilename3.lastIndexOf("."));// 取出副檔名 .png , .jpeg , .gif
																										// C:\_JSP\tomcat9\webapps\mvcExercise
				//System.out.println("處理贊助方案二時的imageFolder"+imageFolder);
				projectPlanFile3 = new File(imageFolder,"projectPlanImage3" + projectPlanExt3);// File(路徑,檔名.副檔名)
				try {
					projectPlanImage3.transferTo(projectPlanFile3);// 把圖檔搬過去
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				projectPlanFilePath3=filePath+ pName+"/projectPlanImage3"+projectPlanExt3;//存方案三的相對路徑static\images\Project\xxx\projectPlan3.jpg
				
				//New 多方的bean
				ProjectPlanBean projectPlanBean3 = new ProjectPlanBean(projectPlanPrice3, projectPlanContent3,ETA3, projectPlanFilePath3, pBean);
				//加進List中
				ProjectPlanBeanList.add(projectPlanBean3);
		}	
		
		//使用一方的set方法設定多方的list
		pBean.setProjectPlanBeans(ProjectPlanBeanList);
		
		//呼叫新增方法進行新增		
		projectService.addProject(pBean);

		return new ResponseEntity<String>("Y", HttpStatus.OK);
	}

//	//分頁功能
	@GetMapping("/Project/page")
//			public ResponseEntity<String> getProjectByPage(
//	public String getProjectByPage(
	
	public	ResponseEntity<Map<String, Object>> getProjectByPage(
			@RequestParam(defaultValue = "0") int page, //頁數
		    @RequestParam(defaultValue = "3") int size, // 每頁幾筆
//		    @RequestParam(defaultValue = "id,desc") String[] sort,
		    Model model) {
		
		List<Order> orders = new ArrayList<Order>();

		orders.add(new Order(getSortDirection("desc"), "pID"));
		
		
		List<ProjectBean> projectBeanList = new ArrayList<ProjectBean>();
	      
		Pageable pagingSort = PageRequest.of(page, size, Sort.by(orders));
	      
	      Page<ProjectBean> pageProjs;
	      
	      pageProjs= projectService.findBypStatusContaining("通過", pagingSort);
		
//	      if (pageProjs.isEmpty()) {
//	          return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//	        }
	     
	      projectBeanList = pageProjs.getContent();
	      
	      Map<String, Object> response = new HashMap<>();
	      
	      System.out.println("當前頁數"+pageProjs.getNumber());
	      System.out.println("總頁數"+pageProjs.getTotalPages());
	      System.out.println("分頁中內容"+projectBeanList);
	      System.out.println("全部內容資料"+pageProjs.getTotalElements());
	      
	      response.put("projectBeanList", projectBeanList);//分頁中內容
	      response.put("currentPage", pageProjs.getNumber());//當前頁數
	      response.put("totalItems", pageProjs.getTotalElements());//全部內容資料
	      response.put("totalPages", pageProjs.getTotalPages());//總頁數
	      
	      
	      //HttpHeaders responseHeaders = new HttpHeaders();
	       // responseHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
	       // responseHeaders.add("Content-Type", "application/json; charset=utf-8");

	     //   return ResponseEntity.ok().headers(responseHeaders).body(new Gson().toJson(response));
		return new ResponseEntity<>(response, HttpStatus.OK);
								
	}
	
	
	
	//配合分頁功能
	 private Sort.Direction getSortDirection(String direction) {
		    if (direction.equals("asc")) {
		      return Sort.Direction.ASC;
		    } else if (direction.equals("desc")) {
		      return Sort.Direction.DESC;
		    }

		    return Sort.Direction.ASC;
		  }
	 

		
	 
//	 @GetMapping(path = "/Project/ProjectSearch", produces = MediaType.APPLICATION_JSON_VALUE)
//		public ResponseEntity<String>  getProjectBySearch(
//				@RequestParam("search") String search,
//				Model model,
//				@ModelAttribute("allProject") List<ProjectBean> result ) {
//			
//			System.out.println("search:"+search);
//			Set<String> searchName=new HashSet<>();
//			searchName.add("%"+search+"%");
//
//			System.out.println(searchName);
//			result = projectService.getProjectBySearch(searchName);
//			if (result.size() == 0) {
//				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//			}
//			List<ProjectBean> projectInfo=new ArrayList<>();
//			
//			Gson gson = new GsonBuilder().setPrettyPrinting().create();
//			for (ProjectBean bean : result) {
//				bean.setProjectPlanBeans(new HashSet<>());
//				projectInfo.add(bean);
//			}
//			String jsonStr = new Gson().toJson(projectInfo);
//			JSONArray jsonArr = new JSONArray(jsonStr);
//			JSONObject jsonObj = new JSONObject();
//			jsonObj.put("allProject", jsonArr);
//			
//			JsonElement parseString = JsonParser.parseString(jsonObj.toString());
//			System.out.println(gson.toJson(parseString));
//			

//			return new ResponseEntity<String>(jsonObj.toString(), HttpStatus.OK);					
//		}
	 
	 
	
	 @GetMapping(path = "/Project/order")
		public ResponseEntity<String>  getTopTenProjec(){
		 List<ProjectBean> proBean = projectService.findProjectByOrderby();
		 for (ProjectBean projectBean : proBean) {
			System.out.println("依序的贊助次數"+projectBean.getSponsorCount()); 
		}
		 return new ResponseEntity<String>("Y", HttpStatus.OK);	
	 }
	 
	 
	
	
}
