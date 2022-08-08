package com.me.service;

import java.util.List;

import com.me.common.domain.PageRequest;
import com.me.domain.AdminNotice;

public interface AdminNoticeService {

	// 공지사항 등록 처리
	public void register(AdminNotice adminNotice) throws Exception;
	
	// 첨부파일 업로드 처리
	public List<String> getAttach(Integer noticeNum) throws Exception;
	
	// 공지사항 목록 페이지
	/* public List<AdminNotice> list() throws Exception; */
	
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다. 
	public List<AdminNotice> list(PageRequest pageRequest) throws Exception;
	
	// 공지사항 상세 페이지
	public AdminNotice read(Integer noticeNum) throws Exception; 
	
	// 공지사항 수정 처리
	public void modify(AdminNotice adminNotice) throws Exception; 
	
	// 공지사항 삭제 처리
	public void remove(Integer noticeNum) throws Exception;
	
	// 게시글 전체 건수 반환 처리
	// public int count() throws Exception;
	
	// 검색 처리된 게시글 건수를 반환한다.
	public int count(PageRequest pageRequest) throws Exception;
	
	// 첨부파일 다운로드 건수
	public void updateAttachDownCnt(String fullName) throws Exception;

}
