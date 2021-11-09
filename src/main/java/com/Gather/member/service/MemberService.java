package com.Gather.member.service;

import java.util.List;

import com.Gather.member.entity.Member;

public interface MemberService {
	void insertOrUpdateMember(Member theMember);

	void changePwdById(Member theMember);

	void updateStatusById(Member theMember);

	List<Member> queryMemberAll();

	Member queryMemberById(Integer theMemberId);

	void deleteMemberById(Integer theMemberId);

	Member getMemberByAccountAndPassword(Member theMember);

	// 用帳號找會員
	Member findByAccount(String account);

	// 用密碼找會員
	Member findByPassword(String password);

}
