package com.me.service;

import java.util.List;

import com.me.common.domain.PageRequest;
import com.me.domain.Show;

public interface ShowService {

	// 등록 처리
	public void register(Show show) throws Exception;

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다. 
	public List<Show> list(PageRequest pageRequest) throws Exception;

	// 상세 페이지
	public Show read(Integer showNum) throws Exception;

	// 첨부파일
	public String getShowFile(Integer showNum) throws Exception;

	// 검색 처리된 게시글 건수를 반환한다.
	public int count(PageRequest pageRequest) throws Exception;
}
