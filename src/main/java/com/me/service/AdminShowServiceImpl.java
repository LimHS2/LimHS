package com.me.service;

import java.util.List;
//import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.common.domain.PageRequest;
import com.me.domain.AdminShow;
import com.me.mapper.AdminShowMapper;

@Service
public class AdminShowServiceImpl implements AdminShowService {
	@Autowired
	private AdminShowMapper showMapper;

	// 등록 처리
	@Override
	public void register(AdminShow adminShow) throws Exception {
		showMapper.create(adminShow);
	}

	// 목록 페이지
	/*
	 * @Override public List<AdminShow> list() throws Exception { return
	 * showMapper.list(); }
	 */

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<AdminShow> list(PageRequest pageRequest) throws Exception {
		return showMapper.list(pageRequest);
	}

	// 상세 페이지, 수정 페이지
	@Override
	public AdminShow read(Integer showNum) throws Exception {
		return showMapper.read(showNum);
	}

	// 수정 처리
	@Override
	public void modify(AdminShow adminShow) throws Exception {
		showMapper.update(adminShow);
	}

	// 삭제 처리
	@Override
	public void remove(Integer showNum) throws Exception {
		showMapper.delete(showNum);
	}

	// 검색 처리된 게시글 건수를 반환한다.
	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return showMapper.count(pageRequest);
	}

	// 첨부파일
	@Override
	public String getShowFile(Integer showNum) throws Exception {
		return showMapper.getShowFile(showNum);
	}

}
