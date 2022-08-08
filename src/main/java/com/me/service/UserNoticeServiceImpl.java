package com.me.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.common.domain.PageRequest;
import com.me.domain.UserNotice;
import com.me.mapper.UserNoticeMapper;

@Service
public class UserNoticeServiceImpl implements UserNoticeService{

	@Autowired
	private UserNoticeMapper mapper;
	
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<UserNotice> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);
	}

	//상세 페이지
	@Override
	public UserNotice read(int noticeNum) throws Exception {
		return mapper.read(noticeNum);
	}
	
	//첨부파일
	@Override
	public List<String> getAttach(Integer noticeNum) throws Exception {

		return mapper.getAttach(noticeNum);
	}

	// 첨부파일 다운로드 건수
	@Override
	public void updateAttachDownCnt(String fullName) throws Exception {
		mapper.updateAttachDownCnt(fullName);
	}
	
	// 검색 처리된 게시글 건수를 반환한다.
	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return mapper.count(pageRequest);
	}

}
