package com.me.mapper;

import java.util.List;
//import java.util.Map;

import com.me.common.domain.PageRequest;
import com.me.domain.AdminShow;

public interface AdminShowMapper {

	// 등록 처리
	public void create(AdminShow adminShow) throws Exception;

	// 목록 페이지
	// public List<AdminShow> list() throws Exception;

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	public List<AdminShow> list(PageRequest pageRequest) throws Exception;

	// 상세 페이지, 수정 페이지
	public AdminShow read(Integer showNum) throws Exception;

	// 수정 처리
	public void update(AdminShow adminShow) throws Exception;

	// 삭제 처리
	public void delete(Integer showNum) throws Exception;

	// 검색 처리된 게시글 건수를 반환한다.
	public int count(PageRequest pageRequest) throws Exception;

	// 첨부파일
	public String getShowFile(Integer showNum) throws Exception;

}
