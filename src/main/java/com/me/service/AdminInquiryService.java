package com.me.service;

import java.util.List;

import com.me.common.domain.PageRequest;
import com.me.domain.AdminInquiry;

public interface AdminInquiryService {

	// 문의사항 등록 처리
	public void register(AdminInquiry adminInquiry) throws Exception;

	// 문의사항 목록 페이지
	/* public List<AdminInquiry> list() throws Exception; */

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	public List<AdminInquiry> list(PageRequest pageRequest) throws Exception;

	// 문의사항 상세 페이지
	public AdminInquiry read(Integer inquiryNum) throws Exception;

	// 문의사항 수정 처리
	public void modify(AdminInquiry adminInquiry) throws Exception;

	// 문의사항 삭제 처리
	public void remove(Integer inquiryNum) throws Exception;

	// 게시글 전체 건수 반환 처리
	// public int count() throws Exception;

	// 검색 처리된 게시글 건수를 반환한다.
	public int count(PageRequest pageRequest) throws Exception;

}
