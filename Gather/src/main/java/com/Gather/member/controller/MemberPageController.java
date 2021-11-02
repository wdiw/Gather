package com.Gather.member.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;

import com.Gather.member.entity.Member;
import com.Gather.member.service.MemberService;

@Controller
public class MemberPageController {
	private MemberService memberService;

	@Autowired
	public MemberPageController(MemberService memberService) {
		super();
		this.memberService = memberService;
	}

	@GetMapping("/")
	public String home() {
		System.out.println("透過頁面控制器進入首頁");
		return "index";	
	}
	
	@GetMapping("/addMember")
	public String addMember() {
		System.out.println("透過頁面控制器進入新增會員頁面");
		return "Member/addMember";
	}
	@GetMapping("/backend")
	public String test() {
		return "backend";
	}

	@GetMapping("/showAllMember")
	public String list(Model model) {
		List<Member> memberAll = memberService.queryMemberAll();
		model.addAttribute("members", memberAll);
		return "Member/jsp_crud";
	}

	@GetMapping("/memberUpdate/{id}")
	public String order(@PathVariable("id") Integer id, Model model) {
		Member targetMember = memberService.queryMemberById(id);
		model.addAttribute("targetMember", targetMember);
		return "Member/updateMember";
	}

	// 修改訂單

	@PostMapping("/memberUpdate/{id}")
	@ResponseBody
	public ResponseEntity<String> addUpdateOrderInfo(@PathVariable("id") Integer id, @RequestParam("name") String name,

			@RequestParam("status") String status,

			@RequestParam("account") String account,

			@RequestParam("password") String password,

			@RequestParam(required = false, name = "memberImage") MultipartFile photo, HttpServletRequest req) throws IOException {

		// 從request中獲取輸入流資訊 把來源變成IS => ok
		InputStream is = photo.getInputStream();
		// 建立儲存在伺服器的路徑資訊 (這邊我要指到那個地點)
		String rootDirectory = req.getServletContext().getRealPath("/").replace("webapp", "resources");
		String destFileName = rootDirectory + "static\\images\\Members\\" + id + ".jpg";
		System.out.println("debug:destFileName"+destFileName);
		// outPutStream輸出流指向臨時檔案
		FileOutputStream outputStream = new FileOutputStream(new File(destFileName));
		// 每次讀取檔案位元組
		byte b[] = new byte[1024];
		int n;
		while ((n = is.read(b)) != -1) {
			outputStream.write(b, 0, n);
		}
		memberService.addMember(new Member(id, name, status, account, password));
		return new ResponseEntity<String>(HttpStatus.OK);

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
	public String uplaod(HttpServletRequest req, @RequestParam("file") MultipartFile file, Model m) {// 1. 接受上傳的檔案
																										// @RequestParam("file")
																										// MultipartFile
																										// file
		try {
			// 2.根據時間戳建立新的檔名，這樣即便是第二次上傳相同名稱的檔案，也不會把第一次的檔案覆蓋了
			Member theMember = (Member) req.getSession().getAttribute("memberData");
			// 3.通過req.getServletContext().getRealPath("") 獲取當前專案的真實路徑，然後拼接前面的檔名
			/*
			 * String destFileName = req.getServletContext().getRealPath("") + "WEB-INF" +
			 * File.separator + "views"+ File.separator + "Member" + File.separator +
			 * fileName;
			 */
			String rootDirectory = req.getServletContext().getRealPath("/").replace("webapp", "resources");
			String destFileName = rootDirectory + "static\\images\\Members\\" + theMember.getId() + ".jpg";

			// 4.第一次執行的時候，這個檔案所在的目錄往往是不存在的，這裡需要建立一下目錄（建立到了webapp下uploaded資料夾下）
			File destFile = new File(destFileName);
			System.out.println(destFileName);
			destFile.getParentFile().mkdirs();
			// 5.把瀏覽器上傳的檔案複製到希望的位置
			file.transferTo(destFile);
			// 6.把檔名放在model裡，以便後續顯示用
			m.addAttribute("fileName", theMember.getId());
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
