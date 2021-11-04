package com.Gather.member.service;

import java.util.List;

import com.Gather.member.entity.Member;

public interface MemberService {
	void addMember(Member theMember);

	void changePwdById(Member theMember);

	void updateStatusById(Member theMember);

	List<Member> queryMemberAll();

	Member queryMemberById(Integer theMemberId);

	void deleteMemberById(Integer theMemberId);
	
	Member getMemberByAccountAndPassword(Member theMember);
	
	Member getMemberById(Integer theMemberId);

}
