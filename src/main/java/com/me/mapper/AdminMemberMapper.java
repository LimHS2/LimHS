package com.me.mapper;

import java.util.List;

import com.me.common.domain.PageRequest;
import com.me.domain.AdminMember;

public interface AdminMemberMapper {

	// 등록처리
	public void create(AdminMember admember) throws Exception;

	// 목록페이지
	// public List<AdminMember> list() throws Exception;

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	public List<AdminMember> list(PageRequest pageRequest) throws Exception;

	// 상세페이지
	public AdminMember read(Integer userNo) throws Exception;

	// 수정 처리
	public void update(AdminMember admember) throws Exception;

	// 삭제 처리
	public void delete(Integer userNo) throws Exception;

	// 검색 처리된 게시글 건수를 반환한다.
	public int count(PageRequest pageRequest) throws Exception;

}
