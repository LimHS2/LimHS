package com.me.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.me.domain.Member;
import com.me.domain.MemberAuth;
import com.me.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	// 회원가입
	@Transactional
	@Override
	public void register(Member member) throws Exception {
		mapper.create(member);

		// 회원 권한 생성
		MemberAuth memberAuth = new MemberAuth();
		memberAuth.setAuth("ROLE_MEMBER");
		mapper.createAuth(memberAuth);
	}

}
