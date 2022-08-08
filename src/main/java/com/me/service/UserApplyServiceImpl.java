package com.me.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.domain.UserApply;
import com.me.mapper.UserApplyMapper;

@Service
public class UserApplyServiceImpl implements UserApplyService{

	@Autowired
	private UserApplyMapper mapper;
	
	//등록 처리
	@Override
	public void regsiter(UserApply userApply) throws Exception {
		mapper.create(userApply);
	}

	//목록 페이지
	@Override
	public List<UserApply> list() throws Exception {
		return mapper.list();
	}

	//첨부파일
	@Override
	public String getApplyFile(Integer applyNum) throws Exception {
		return mapper.getApplyFile(applyNum);
	}

}
