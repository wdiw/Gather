package com.Gather.member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

@RestController
@RequestMapping("/api")
public class MemberRESTController {

	MemberService memberService;

	@Autowired
	public MemberRESTController(MemberService memberService) {
		this.memberService = memberService;
		System.out.println("哈哈哈");
	}

	@PostMapping("/login")
	public ResponseEntity<String> login(@RequestBody Member theMember, HttpServletRequest request) {
		System.out.println("登入: 前端收到的資料" + theMember);
		Member result = memberService.getMemberByAccountAndPassword(theMember);
		System.out.println("登入:資料庫搜尋的結果" + result);
		if (result != null) {
			// 找到會員
			request.getSession().setAttribute("memberData", result);
			return new ResponseEntity<String>("Y", HttpStatus.OK);
//			return new ResponseEntity<String>("<meta http-equiv='refresh' content=0;URL='https://www.baidu.com/'>", HttpStatus.OK);
		} else {
			// 找不到會員
			return new ResponseEntity<String>("N", HttpStatus.OK);
		}
	}

	@PostMapping("/register")
	public Member register(@RequestBody Member theMember) {
		// 清洗前端資料，確保ID為0或null，使insertOrUpdate成功判斷
		// 但因為我這邊使用的是Integer，所以不能用0 要用null
		theMember.setId(null);
		theMember.setStatus("會員");
		System.out.println(theMember);
		memberService.addMember(theMember);
		return theMember;
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
		memberService.addMember(theMember);
		return theMember;
	}

	// 更新
	@PutMapping("/members")
	public Member updateMember(@RequestBody Member theMember) {
//		System.out.println(theMember);
		memberService.addMember(theMember);
		return theMember;
	}

	// 改密碼
	@PutMapping("/members/changePassword")
	public Member changePassword(@RequestBody Member theMember, HttpServletRequest request) {
		System.out.println("改密碼:前端進來的資料" + theMember);
		Member sessionMemberData = (Member) request.getSession().getAttribute("memberData");
		System.out.println("改密碼:Session的資料" + sessionMemberData);
		sessionMemberData.setPassword(theMember.getPassword());
		System.out.println("改密碼:即將送進Service層的會員資料" + sessionMemberData);
		memberService.changePwdById(sessionMemberData);
		return sessionMemberData;
	}

	// 刪除
	@DeleteMapping("/members/{memberId}")
	public String deleteMember(@PathVariable Integer memberId) {
		memberService.deleteMemberById(memberId);
		return "The member\t" + memberId + "\thas been deleted!";
	}

	
	
}
