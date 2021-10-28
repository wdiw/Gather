package com.Gather.member.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Gather.member.entity.Member;

@Controller
public class MemberPageController {
	@GetMapping("/")
	public String home() {
		System.out.println("透過頁面控制器進入首頁");
		return "index";
	}

	@GetMapping("/showLogin")
	public String showLogin() {
		System.out.println("透過頁面控制器，進入登入頁面");
		return "Member/login";
	}

	@GetMapping("/showLogout")
	public String showLogout() {
		System.out.println("透過頁面控制器，進入登出頁面");
		return "Member/logout";
	}

	@GetMapping("/showLoginSuccess")
	public String showLoginSuccess() {
		System.out.println("透過頁面控制器，進入登入成功頁面");
		return "Member/loginSuccess";
	}

	@GetMapping("/showRegister")
	public String showRegister() {
		System.out.println("透過頁面控制器，進入註冊頁面");
		return "Member/register";
	}

	@GetMapping("/showMemberCenter")
	public String showMemberCenter() {
		System.out.println("透過頁面控制器，進入會員中心");
		return "Member/memberCenter";
	}

	@GetMapping("/showMemberAdminCenter")
	public String showMemberAdminCenter() {
		System.out.println("透過頁面控制器，進入管理員會員中心");
		return "Member/memberAdminCenter";
	}

	@GetMapping("/showChangePassword")
	public String showChangePassword() {
		System.out.println("透過頁面控制器，進入修改密碼頁面");
		return "Member/memberSetting";
	}

	@GetMapping("/showUploadMemberPhoto")
	public String showUploadMemberPhoto() {
		System.out.println("透過頁面控制器，進入上傳圖片頁面");
		return "Member/photo";
	}
	
	 @PostMapping("/upload") // 等價於 @RequestMapping(value = "/upload",method = RequestMethod.POST)
	  public String uplaod(HttpServletRequest req,@RequestParam("file") MultipartFile file,Model m) {//1. 接受上傳的檔案 @RequestParam("file") MultipartFile file
	    try {
	      //2.根據時間戳建立新的檔名，這樣即便是第二次上傳相同名稱的檔案，也不會把第一次的檔案覆蓋了
	      Member theMember = (Member)req.getSession().getAttribute("memberData");
	      //3.通過req.getServletContext().getRealPath("") 獲取當前專案的真實路徑，然後拼接前面的檔名
	      /*
	      String destFileName = req.getServletContext().getRealPath("") 
	    		  + "WEB-INF" + File.separator 
	    		  + "views"+ File.separator
	    		  + "Member" + File.separator
	    		  + fileName;
	      */
	      String destFileName = req.getServletContext().getRealPath("") 
	    		  + "uploaded" + File.separator 
	    		  + theMember.getId()+".jpg";
	      //4.第一次執行的時候，這個檔案所在的目錄往往是不存在的，這裡需要建立一下目錄（建立到了webapp下uploaded資料夾下）
	      File destFile = new File(destFileName);
	      destFile.getParentFile().mkdirs();
	      //5.把瀏覽器上傳的檔案複製到希望的位置
	      file.transferTo(destFile);
	      //6.把檔名放在model裡，以便後續顯示用
	      m.addAttribute("fileName",theMember.getId());
	    } catch (FileNotFoundException e) {
	      e.printStackTrace();
	      return "上傳失敗," + e.getMessage();
	    } catch (IOException e) {
	      e.printStackTrace();
	      return "上傳失敗," + e.getMessage();
	    }

	    return "Member/memberCenter";
	  }
}
