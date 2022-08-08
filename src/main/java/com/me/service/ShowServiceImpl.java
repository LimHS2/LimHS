package com.me.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.common.domain.PageRequest;
import com.me.domain.Show;
import com.me.mapper.ShowMapper;

@Service
public class ShowServiceImpl implements ShowService {

	@Autowired
	private ShowMapper mapper;

	// 등록 처리
	@Override
	public void register(Show show) throws Exception {
		mapper.create(show);
	}

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<Show> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);
	}

	// 상세 페이지
	@Override
	public Show read(Integer showNum) throws Exception {
		return mapper.read(showNum);
	}

	// 첨부파일
	@Override
	public String getShowFile(Integer showNum) throws Exception {
		return mapper.getShowFile(showNum);
	}
	
	// 검색 처리된 게시글 건수를 반환한다.
	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return mapper.count(pageRequest);
	}

}
