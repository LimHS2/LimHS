package com.me.service;

import java.util.List;

import com.me.common.domain.PageRequest;
import com.me.domain.UserNotice;

public interface UserNoticeService {

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다. 
	public List<UserNotice> list(PageRequest pageRequest) throws Exception;

	// 상세 페이지
	public UserNotice read(int noticeNum) throws Exception;
	
	// 첨부파일 다운로드 건수
	public void updateAttachDownCnt(String fullName) throws Exception;

	// 첨부파일 업로드 처리
	public List<String> getAttach(Integer noticeNum) throws Exception;
	
	// 검색 처리된 게시글 건수를 반환한다.
	public int count(PageRequest pageRequest) throws Exception;
}
