package com.Gather.member.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Gather.Project.service.ProjectService;
import com.Gather.member.entity.Member;
import com.Gather.member.service.MemberService;

@Controller
public class MemberPageController {
	private MemberService memberService;
	private ProjectService projectService;

	@Autowired
	public MemberPageController(MemberService memberService, ProjectService projectService) {
		super();
		this.memberService = memberService;
		this.projectService = projectService;
	}
	//==========================SHOW   PAGE=============================================
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
	public String showMemberCenter(Model model, HttpServletRequest req) {
		System.out.println("透過頁面控制器進入會員中心");
		Member theMember = (Member)req.getSession().getAttribute("memberData");
		System.out.println("debug: id為"+theMember.getId());
		model.addAttribute("allproject", projectService.getAllProjectBymID(theMember.getId()));
		System.out.println(projectService.getAllProjectBymID(theMember.getId()));
		return "sample";	
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
	
	@GetMapping("/showForgotPassword")
	public String showForgotPasswordPage() {
		return "Member/forgotPassword";
	}
	
	@GetMapping("/passwordReset/{hashCode}")
	public String showPasswordResetPage(@PathVariable String hashCode, HttpServletRequest req) {
		//用這組hashcode去找資料庫有沒有會員的密碼屬於這組hashcode
		Member theDataBaseMember = memberService.findByPassword(hashCode);
		if (theDataBaseMember!=null) {
			//如果有的話，則通過認證，把撈到的這筆資料，放在session當中，待會前端要用的
			req.getSession().setAttribute("memberData", theDataBaseMember);
			//前往設定新密碼頁面
			return "Member/setNewPassword"; 
		}
		//這組hashcode找不到會員，遣返使用者回首頁
		return "Member/error";
	}
	
	//==========================SHOW   PAGE=============================================
	
	// 修改會員資料

	@PostMapping("/memberUpdate/{id}")
	@ResponseBody
	public ResponseEntity<String> addUpdateOrderInfo(
													@RequestBody Member theMember,
													@RequestParam(required = false, name = "memberImage") MultipartFile photo, 
													HttpServletRequest req)throws IOException {

		savePhotoByUpdatePage(theMember, photo, req); //儲存圖片
		memberService.insertOrUpdateMember(theMember); //更新會員資料
		return new ResponseEntity<String>(HttpStatus.OK);

	}
	
	@PostMapping("/upload")// 會員中心上傳大頭貼
	public String uplaod(HttpServletRequest req, @RequestParam("file") MultipartFile file, Model m) {// 1. 接受上傳的檔案
		try {
			Member theMember = (Member) req.getSession().getAttribute("memberData");
			String rootDirectory = req.getServletContext().getRealPath("/").replace("webapp", "resources");
			String destFileName = rootDirectory + "static\\images\\Members\\" + theMember.getId() + ".jpg";
			File destFile = new File(destFileName);
			System.out.println(destFileName);
			destFile.getParentFile().mkdirs();
			file.transferTo(destFile);
			m.addAttribute("fileName", theMember.getId());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return "上傳失敗," + e.getMessage();
		} catch (IOException e) {
			e.printStackTrace();
			return "上傳失敗," + e.getMessage();
		}

		return "sample";
	}
	
	
	
	private void savePhotoByUpdatePage(Member theMember, MultipartFile photo, HttpServletRequest req)
			throws IOException, FileNotFoundException {
		// 從request中獲取輸入流資訊 把來源變成IS => ok
		InputStream is = photo.getInputStream();
		// 建立儲存在伺服器的路徑資訊 (這邊我要指到那個地點)
		String rootDirectory = req.getServletContext().getRealPath("/").replace("webapp", "resources");
		String destFileName = rootDirectory + "static\\images\\Members\\" + theMember.getId() + ".jpg";
		System.out.println("debug:destFileName" + destFileName);
		// outPutStream輸出流指向臨時檔案
		FileOutputStream outputStream = new FileOutputStream(new File(destFileName));
		// 每次讀取檔案位元組
		byte b[] = new byte[1024];
		int n;
		while ((n = is.read(b)) != -1) {
			outputStream.write(b, 0, n);
		}
	}
}
