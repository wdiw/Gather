package com.Gather.member.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Gather.member.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Integer> {
	// nothing need to write CRUD
	//登入
	Member findByAccountAndPassword(String account, String password);
	
	//用帳號找會員
	Member findByAccount(String account);
	
	//用密碼找會員
	Member findByPassword(String password);
}
