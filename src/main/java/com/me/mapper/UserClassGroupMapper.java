package com.me.mapper;

import java.util.List;

import com.me.common.domain.PageRequest;
import com.me.domain.UserClassGroup;

public interface UserClassGroupMapper {

	// 등록 처리
	public void create(UserClassGroup userClassGroup) throws Exception;

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	public List<UserClassGroup> list(PageRequest pageRequest) throws Exception;

	// 상세 페이지 (수정 페이지)
	public UserClassGroup read(int classNum) throws Exception;

	// 수정 처리
	public void update(UserClassGroup userClassGroup) throws Exception;

	// 삭제 처리
	public void delete(int classNum) throws Exception;
	
	// 지원 페이지
	public UserClassGroup supportRead(int classNum) throws Exception;
	
	// 검색 처리된 게시글 건수를 반환한다.
	public int count(PageRequest pageRequest) throws Exception;

}
