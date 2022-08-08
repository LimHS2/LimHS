package com.me.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.common.domain.PageRequest;
import com.me.domain.UserClassGroup;
import com.me.mapper.UserClassGroupMapper;

@Service
public class UserClassGroupServiceImpl implements UserClassGroupService {

	@Autowired
	private UserClassGroupMapper mapper;

	// 등록 처리
	@Override
	public void register(UserClassGroup userClassGroup) throws Exception {
		mapper.create(userClassGroup);
	}

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<UserClassGroup> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);
	}

	// 상세 페이지(수정 페이지)
	@Override
	public UserClassGroup read(int classNum) throws Exception {

		return mapper.read(classNum);
	}

	// 수정 처리
	@Override
	public void modify(UserClassGroup userClassGroup) throws Exception {
		mapper.update(userClassGroup);
	}

	// 삭제 처리
	@Override
	public void remove(int classNum) throws Exception {
		mapper.delete(classNum);
	}
	
	// 상세 페이지(수정 페이지)
	@Override
	public UserClassGroup supportRead(int classNum) throws Exception {

		return mapper.supportRead(classNum);
	}
	
	// 검색 처리된 게시글 건수를 반환한다.
	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return mapper.count(pageRequest);
	}

}