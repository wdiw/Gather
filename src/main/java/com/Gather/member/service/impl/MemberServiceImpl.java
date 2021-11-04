package com.Gather.member.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Gather.member.dao.MemberRepository;
import com.Gather.member.entity.Member;
import com.Gather.member.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	private MemberRepository memberRepository;
	
	
	@Autowired
	public MemberServiceImpl(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	@Override
	public void addMember(Member theMember) {
		memberRepository.save(theMember);
	}

	@Override
	public void changePwdById(Member theMember) {
		/*
		Member dataBaseMember = 
			memberRepository.getById(theMember.getId());
		System.out.println("改密碼: Service層 找到的資料"+dataBaseMember);
		dataBaseMember.setPassword(theMember.getPassword());
		*/
		memberRepository.save(theMember);
	}

	@Override
	public void updateStatusById(Member theMember) {
		Member dataBaseMember = 
			memberRepository.getById(theMember.getId());
		dataBaseMember.setStatus(theMember.getStatus());
	}

	@Override
	public List<Member> queryMemberAll() {
		return memberRepository.findAll();
	}

	@Override
	public Member queryMemberById(Integer theMemberId) {
		Optional<Member> theQuery = memberRepository.findById(theMemberId);
		Member theMember = null;	
		if(theQuery.isPresent()) {
			theMember = theQuery.get();
		}else {
			throw new RuntimeException("Did not find employee id - " + theMemberId);
		}
		return theMember;
	}

	@Override
	public void deleteMemberById(Integer theMemberId) {
		memberRepository.deleteById(theMemberId);
		
	}
	
	@Override
	public Member getMemberByAccountAndPassword(Member theMember) {
		return memberRepository.findByAccountAndPassword(theMember.getAccount(), theMember.getPassword());
	}
	
	@Override
	public Member getMemberById(Integer theMemberId) {
		return memberRepository.getById(theMemberId);
		
		
	}
	
	

}
