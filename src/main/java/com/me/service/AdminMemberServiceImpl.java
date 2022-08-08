package com.me.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.common.domain.PageRequest;
import com.me.domain.AdminMember;
import com.me.mapper.AdminMemberMapper;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberMapper memberMapper;

	// 등록처리
	@Override
	public void register(AdminMember admember) throws Exception {
		memberMapper.create(admember);
	}

	// 목록페이지
	/*
	 * @Override public List<AdminMember> list() throws Exception { return
	 * memberMapper.list(); }
	 */

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<AdminMember> list(PageRequest pageRequest) throws Exception {
		return memberMapper.list(pageRequest);
	}

	// 상세페이지
	@Override
	public AdminMember read(Integer userNo) throws Exception {
		return memberMapper.read(userNo);
	}

	// 수정 처리
	@Override
	public void modify(AdminMember admember) throws Exception {
		memberMapper.update(admember);
	}

	// 삭제 처리
	@Override
	public void remove(Integer userNo) throws Exception {
		memberMapper.delete(userNo);
	}

	// 검색 처리된 게시글 건수를 반환한다.
	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return memberMapper.count(pageRequest);
	}

}
