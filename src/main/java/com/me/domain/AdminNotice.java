	package com.me.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminNotice {
	
	private int noticeNum; // 게시글 번호
	private String noticeTitle; // 제목
	private String noticeContent; // 내용
	private Date noticeReg; // 등록일
	private String noticeWriter; // 작성자
	private String[] files; // 첨부파일

}