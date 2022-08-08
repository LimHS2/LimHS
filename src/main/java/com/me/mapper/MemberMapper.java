package com.me.mapper;

import com.me.domain.Member;
import com.me.domain.MemberAuth;

public interface MemberMapper {
	// 회원가입
	public void create(Member member) throws Exception;

	// 권한 생성
	public void createAuth(MemberAuth memberAuth) throws Exception;

	// 아이디로 회원 정보 조회
	public Member readByUserId(String userId);
}
