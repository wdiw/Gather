package com.Gather.member.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.ResultSet;
import java.util.List;
import java.util.Properties;
import java.util.StringJoiner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Gather.member.entity.Member;
import com.Gather.member.service.MemberService;
import com.Gather.util.Mail;
import com.Gather.util.SHA256Util;

@RestController
@RequestMapping("/api")
public class MemberRESTController {

	MemberService memberService;

	@Autowired
	public MemberRESTController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/restricted")
	public String restricted() {
		return "to see this text you need to be logged in!";
	}

	@PostMapping("/forgotPassword")
	public ResponseEntity<String> forgotPassword(@RequestBody Member theMember,HttpServletRequest request){
		Member theDataBaseMember = memberService.findByAccount(theMember.getAccount());
		if (theDataBaseMember != null) {
			// 產生六碼亂數
			int MAX = 999999;
			int min = 100000;
			int random = (int) (Math.random() * (MAX - min + 1)) + min;
			String randomSixDigitStr = String.valueOf(random);
			String secretHashCode = SHA256Util.getSHA256StrJava(theDataBaseMember.getAccount()+randomSixDigitStr);
			theDataBaseMember.setPassword(secretHashCode);
			memberService.insertOrUpdateMember(theDataBaseMember);
			String message = "http://localhost:8080/Gather/passwordReset/"+secretHashCode;
			Mail.SendGmail("Gather.WebService@gmail.com", theDataBaseMember.getAccount(), "Gather募資平台-密碼重設", message);
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}
		return new ResponseEntity<String>("N", HttpStatus.OK);
	}
	

	
	
	
	
	
	@PostMapping("/login")
	public ResponseEntity<String> login(@RequestBody Member theMember, HttpServletRequest request) {
		System.out.println("登入: 前端收到的資料" + theMember);
		Member result = memberService.getMemberByAccountAndPassword(theMember);
		System.out.println("登入:資料庫搜尋的結果" + result);
		if (result != null) {
			// 找到會員
			// 更新登入次數，存入資料庫
			result.setLoginTimes(result.getLoginTimes()+1);
			memberService.insertOrUpdateMember(result);
			// 將會員資料放入session 供前端使用
			request.getSession().setAttribute("memberData", result);
			return new ResponseEntity<String>("Y", HttpStatus.OK);
//			return new ResponseEntity<String>("<meta http-equiv='refresh' content=0;URL='https://www.baidu.com/'>", HttpStatus.OK);
		} else {
			// 找不到會員
			return new ResponseEntity<String>("N", HttpStatus.OK);
		}
	}
	
	// 註冊認證
		@PostMapping("/register")
		public ResponseEntity<String> register(@RequestBody Member theMember, HttpServletRequest req) {
			// 清洗前端資料，確保ID為0或null，使insertOrUpdate成功判斷
			// 但因為我這邊使用的是Integer，所以不能用0 要用null
			theMember.setId(null);
			// 產生這次帳號認證碼
			int MAX = 999999;
			int min = 100000;
			int random = (int) (Math.random() * (MAX - min + 1)) + min;
			// 將帳號認證碼，放入session
			req.getSession().setAttribute("registerData_valid_code", random);
			System.out.println("認證碼是"+random);
			
			//判斷會員的性別
			String gender=" ";
			if (theMember.getSexual().equals("男")) {
				gender = " 先生";
			}else {
				gender = " 女士";
				
			}
			// 信件內容，內含認證碼
			String message = theMember.getName()+gender+ "您好!歡迎您使用Gather，以下是您的認證碼" + random;
			// 寄信
			Mail.SendGmail("Gather.WebService@gmail.com", theMember.getAccount(), "Gather募資平台-帳號驗證", message);
			System.out.println("成功寄信");
			// 將會員資料先預存在session 等待加入
			req.getSession().setAttribute("registerData", theMember);
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}

		
	// 使用者在驗證頁面輸入認證碼，提交於此，判斷認證碼是否正確。
	// 如果正確，就跳出sweat alert 並跳去首頁
	// 如果不正確，就跳出失敗sweat alert 並停留在此頁面
	@GetMapping("/register/{rigister_mail_code}")
	public ResponseEntity<String> registerActive(@PathVariable int rigister_mail_code, HttpServletRequest req) {
		System.out.println("認證碼"+rigister_mail_code);
		int register_valid_code = (int) req.getSession().getAttribute("registerData_valid_code");
		if (rigister_mail_code == register_valid_code) {
			System.out.println("驗證成功，準備加入資料庫");
			Member theMember = (Member) req.getSession().getAttribute("registerData");
			theMember.setStatus("會員");//賦予會員的身分
			memberService.insertOrUpdateMember(theMember);
			System.out.println("會員資料加入資料庫成功");
			//使用預設大頭貼
			String rootDirectory = req.getServletContext().getRealPath("/").replace("webapp", "resources");
			String destDirectory = rootDirectory + "static\\images\\Members\\";
			
			final String INPUT_FILE_PATH = destDirectory+"default.jpg"; // 被複製的檔案路徑及檔名
			final String OUTPUT_FILE_PATH = destDirectory+theMember.getId()+".jpg"; // 已複製的檔案路徑及檔名

			try ( FileOutputStream fos = new FileOutputStream(new File(OUTPUT_FILE_PATH))) {
			    Path inputPath = new File(INPUT_FILE_PATH).toPath();
			    Files.copy(inputPath, fos);
			} catch (IOException e) {
			    e.printStackTrace();
			}
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}
		return new ResponseEntity<String>("N", HttpStatus.OK);

	}

	@GetMapping("/members")
	public List<Member> getMembers() {
		return memberService.queryMemberAll();
	}

	@GetMapping("/members/{memberId}")
	public Member getMember(@PathVariable int memberId) {
		return memberService.queryMemberById(memberId);
	}

	@PostMapping("/members")
	public Member addMember(@RequestBody Member theMember) {
		// 清洗前端資料，確保ID為0或null，使insertOrUpdate成功判斷
		// 但因為我這邊使用的是Integer，所以不能用0 要用null
		theMember.setId(null);
		System.out.println(theMember);
		memberService.insertOrUpdateMember(theMember);
		return theMember;
	}

	// 更新
	@PutMapping("/members")
	public Member updateMember(@RequestBody Member theMember) {
//		System.out.println(theMember);
		memberService.insertOrUpdateMember(theMember);
		return theMember;
	}

	// 改密碼
	@PutMapping("/members/changePassword")
	public ResponseEntity<String> changePassword(@RequestBody Member theMember, HttpServletRequest request) {
		System.out.println("改密碼:前端進來的資料" + theMember);
		Member sessionMemberData = (Member) request.getSession().getAttribute("memberData");
		System.out.println("改密碼:Session的資料" + sessionMemberData);
		sessionMemberData.setPassword(theMember.getPassword());
		System.out.println("改密碼:即將送進Service層的會員資料" + sessionMemberData);
		memberService.changePwdById(sessionMemberData);
		request.getSession().removeAttribute("memberData");
		return new ResponseEntity<String>("Y", HttpStatus.OK);
	}
	
	//停權
	@GetMapping("/suspended/{memberId}")
	public ResponseEntity<String> suspendedMember(@PathVariable Integer memberId) {
		Member theMember = memberService.queryMemberById(memberId);
		theMember.setStatus("停權");
		memberService.insertOrUpdateMember(theMember);
		return new ResponseEntity<String>("Y", HttpStatus.OK);
	}
	
	//恢復
		@GetMapping("/recovery/{memberId}")
		public ResponseEntity<String> recoveryMember(@PathVariable Integer memberId) {
			Member theMember = memberService.queryMemberById(memberId);
			theMember.setStatus("會員");
			memberService.insertOrUpdateMember(theMember);
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}
	
	
	// 刪除
	@DeleteMapping("/members/{memberId}")
	public String deleteMember(@PathVariable Integer memberId) {
		memberService.deleteMemberById(memberId);
		return "The member\t" + memberId + "\thas been deleted!";
	}

}
