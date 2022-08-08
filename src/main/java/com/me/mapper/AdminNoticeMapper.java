package com.me.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.me.common.domain.PageRequest;
import com.me.domain.AdminNotice;

public interface AdminNoticeMapper {

	// 공지사항 등록 처리
	public void create(AdminNotice adminNotice) throws Exception;
	
	// 첨부파일 리스트
	public List<String> getAttach(Integer noticeNum) throws Exception;
	
	// 첨부파일 이름처리
	public void addAttach(String fullName) throws Exception;

	// 공지사항 목록 페이지
	/* public List<AdminNotice> list() throws Exception; */

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	public List<AdminNotice> list(PageRequest pageRequest) throws Exception;

	// 공지사항 상세 페이지
	public AdminNotice read(Integer noticeNum) throws Exception;

	// 공지사항 수정 처리
	public void update(AdminNotice adminNotice) throws Exception;
	
	// 첨부파일 삭제
	public void deleteAttach(Integer noticeNum) throws Exception;
	
	// 첨부파일 교체
	public void replaceAttach(@Param("fullName") String fullName, @Param("noticeNum") Integer noticeNum) throws Exception;

	// 공지사항 삭제 처리
	public void delete(Integer noticeNum) throws Exception;

	// 게시글 전체 건수를 반환한다.
	// public int count() throws Exception;

	// 검색 처리된 게시글 건수를 반환한다.
	public int count(PageRequest pageRequest) throws Exception;
	
	// 첨부파일 다운로드 건수
	public void updateAttachDownCnt(String fullName) throws Exception;

}
