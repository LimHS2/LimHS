package com.me.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.me.common.domain.PageRequest;
import com.me.domain.AdminNotice;
import com.me.mapper.AdminNoticeMapper;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	private AdminNoticeMapper mapper;

	// 공지사항 및 첨부파일 등록 처리
	@Transactional
	@Override
	public void register(AdminNotice adminNotice) throws Exception {

		mapper.create(adminNotice);

		// 첨부 파일 추가
		String[] files = adminNotice.getFiles();

		if (files == null) {

			return;

		}
		for (String fileName : files) {

			mapper.addAttach(fileName);
		}
	}

	@Override
	public List<String> getAttach(Integer noticeNum) throws Exception {

		return mapper.getAttach(noticeNum);
	}

	// 공지사항 목록 페이지
	/*
	 * @Override public List<AdminNotice> list() throws Exception { return
	 * mapper.list(); }
	 */

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<AdminNotice> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);
	}

	// 공지사항 상세 페이지
	@Override
	public AdminNotice read(Integer noticeNum) throws Exception {
		return mapper.read(noticeNum);
	}

	// 공지사항 수정 처리
	@Override
	public void modify(AdminNotice adminNotice) throws Exception {
		mapper.update(adminNotice);

		Integer noticeNum = adminNotice.getNoticeNum();

		mapper.deleteAttach(noticeNum);

		String[] files = adminNotice.getFiles();

		if (files == null) {

			return;
		}

		for (String fileName : files) {

			mapper.replaceAttach(fileName, noticeNum);
		}
	}

	// 공지사항 삭제 처리
	@Override
	public void remove(Integer noticeNum) throws Exception {
		mapper.deleteAttach(noticeNum);
		mapper.delete(noticeNum);
	}

	// 게시글 전체 건수를 반환한다.
	/*
	 * @Override public int count() throws Exception { return mapper.count(); }
	 */

	// 검색 처리된 게시글 건수를 반환한다.
	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return mapper.count(pageRequest);
	}

	@Override
	public void updateAttachDownCnt(String fullName) throws Exception {
		mapper.updateAttachDownCnt(fullName);
	}
}