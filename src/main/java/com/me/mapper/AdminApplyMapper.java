package com.me.mapper;

import java.util.List;

import com.me.common.domain.PageRequest;
import com.me.domain.AdminApply;

public interface AdminApplyMapper {

	//등록 처리
	public void create(AdminApply adminApply) throws Exception;

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	public List<AdminApply> list(PageRequest pageRequest) throws Exception;

	//상세보기
	public AdminApply read(Integer applyNum) throws Exception;

	//첨부파일
	public String getApplyFile(Integer applyNum)throws Exception;
	
	// 검색 처리된 게시글 건수를 반환한다.
	public int count(PageRequest pageRequest) throws Exception;
	
}
