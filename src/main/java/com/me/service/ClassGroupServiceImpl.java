package com.me.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.common.domain.PageRequest;
import com.me.domain.ClassGroup;
import com.me.mapper.ClassGroupMapper;

@Service
public class ClassGroupServiceImpl implements ClassGroupService {

	@Autowired
	private ClassGroupMapper mapper;

	// 등록 처리
	@Override
	public void register(ClassGroup classGroup) throws Exception {
		mapper.create(classGroup);
	}

	// 목록 페이지
	/*
	 * @Override public List<ClassGroup> list() throws Exception {
	 * 
	 * return mapper.list(); }
	 */

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<ClassGroup> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);
	}

	// 상세 페이지(수정 페이지)
	@Override
	public ClassGroup read(int classNum) throws Exception {

		return mapper.read(classNum);
	}

	// 수정 처리
	@Override
	public void modify(ClassGroup classGroup) throws Exception {
		mapper.update(classGroup);
	}

	// 삭제 처리
	@Override
	public void remove(int classNum) throws Exception {
		mapper.delete(classNum);
	}

	// 검색 처리된 게시글 건수를 반환한다.
	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return mapper.count(pageRequest);
	}

}
