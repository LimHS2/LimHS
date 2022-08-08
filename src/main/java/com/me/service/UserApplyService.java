package com.me.service;

import java.util.List;

import com.me.domain.UserApply;

public interface UserApplyService{

	//등록 처리
	public void regsiter(UserApply userApply) throws Exception;

	//목록 페이지
	public List<UserApply> list() throws Exception;

	//첨부파일
	public String getApplyFile(Integer applyNum)throws Exception;
	
}
