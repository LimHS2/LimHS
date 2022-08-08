package com.me.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.common.domain.PageRequest;
import com.me.domain.AdminApply;
import com.me.mapper.AdminApplyMapper;

@Service
public class AdminApplyServiceImpl implements AdminApplyService{

	@Autowired
	private AdminApplyMapper applyMapper;
	
	//등록 처리
	@Override
	public void regsiter(AdminApply adminApply) throws Exception {
		applyMapper.create(adminApply);
	}

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<AdminApply> list(PageRequest pageRequest) throws Exception {
		return applyMapper.list(pageRequest);
	}
	
	//상세보기
	@Override
	public AdminApply read(Integer applyNum) throws Exception {
		return applyMapper.read(applyNum);
	}

	//첨부파일
	@Override
	public String getApplyFile(Integer applyNum) throws Exception {
		return applyMapper.getApplyFile(applyNum);
	}
	
	// 검색 처리된 게시글 건수를 반환한다.
	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return applyMapper.count(pageRequest);
	}

}
