package com.me.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.common.domain.PageRequest;
import com.me.domain.AdminInquiry;
import com.me.mapper.AdminInquiryMapper;

@Service
public class AdminInquiryServiceImpl implements AdminInquiryService {

	@Autowired
	private AdminInquiryMapper mapper;

	// 문의사항 등록 처리
	@Override
	public void register(AdminInquiry adminInquiry) throws Exception {
		mapper.create(adminInquiry);
	}

	// 문의사항 목록 페이지
	/*
	 * @Override public List<AdminInquiry> list() throws Exception { return
	 * mapper.list(); }
	 */

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<AdminInquiry> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);
	}

	// 문의사항 상세 페이지
	@Override
	public AdminInquiry read(Integer inquiryNum) throws Exception {
		return mapper.read(inquiryNum);
	}

	// 문의사항 수정 처리
	@Override
	public void modify(AdminInquiry adminInquiry) throws Exception {
		mapper.update(adminInquiry);
	}

	// 문의사항 삭제 처리
	@Override
	public void remove(Integer inquiryNum) throws Exception {
		mapper.delete(inquiryNum);
	}

	// 게시글 전체 건수를 반환한다.
	/*
	 * @Override public int count() throws Exception { return mapper.count(); }
	 */

	// 검색 처리된 게시글 건수를 반환한다.
	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return mapper.count(pageRequest);
	}

}
