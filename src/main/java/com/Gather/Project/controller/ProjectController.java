	package com.Gather.Project.controller;

import java.io.File;
import java.net.MalformedURLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Gather.Project.model.ProjectBean;
import com.Gather.Project.service.ProjectService;

import javassist.expr.NewArray;

@RestController
public class ProjectController {

	ProjectService projectService;
	ServletContext servletContext;// servletContext.getRealPath() 需要用

	@Autowired
	public ProjectController(ProjectService projectService, ServletContext servletContext) {
		this.projectService = projectService;
		this.servletContext = servletContext;
	}

	// 刪除
	@DeleteMapping(path = "/Project/theProject/{pID}")
	@ResponseBody
	public String deleteProjectById(@PathVariable("pID") int pID) {
		System.out.println("刪除的ID" + pID);
		projectService.deleteProjectById(pID);
		return "Delete OK";
	}

	// 更新
	@PutMapping(path = "/Project/theProject/{pID}")
	@ResponseBody
	public ResponseEntity<String> updateProjectById(@PathVariable("pID") int pID, 
			@RequestParam("pName") String pName, 
			@RequestParam("pDescribe") String pDescribe, 
			@RequestParam("pTarget") int pTarget, 
			@RequestParam(name = "changeImageCover", required = false) MultipartFile pImage, 
			HttpServletRequest request) throws MalformedURLException {

		// 如果圖片沒有換掉，先把原路徑抓出來，再丟回去
		if (pImage.isEmpty()) {

			String filePath=projectService.getProjectById(pID).getpImageCover();
			ProjectBean pBean = new ProjectBean(pID, pName, pTarget, pDescribe,filePath);
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
			ProjectBean pBean = new ProjectBean(pID, pName, pTarget, pDescribe, filePath);
			projectService.updateProject(pBean);
		}

		return new ResponseEntity<String>("Y", HttpStatus.OK);
	}

	
	
	
	// 新增
	@PostMapping(path = "/Project/addProject")
	@ResponseBody
	public ResponseEntity<String> addProject(@RequestParam("pName") String pName, 
			@RequestParam("pTarget") int pTarget,
			@RequestParam("pDescribe") String pDescribe, 
			@RequestParam("pImage") MultipartFile pImage,
			HttpServletRequest request) throws MalformedURLException {

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
			System.out.println("檔案路徑為:" + file);
			pImage.transferTo(file);// 把圖檔搬過去
		} catch (Exception e) {
			e.printStackTrace();
		}

		filePath += pName + "/" + pName + "_Cover" + ext;
		ProjectBean pBean = new ProjectBean(pName, pTarget, pDescribe, filePath);// 存到資料庫
		projectService.addProject(pBean);

		return new ResponseEntity<String>("Y", HttpStatus.OK);
	}

}
