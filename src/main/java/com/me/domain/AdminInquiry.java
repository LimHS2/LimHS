package com.me.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminInquiry {
	
	private int inquiryNum; // 게시글 번호
	private String inquiryTitle; // 제목
	private String inquiryContent; // 내용
	private Date inquiryReg; // 등록일
	private String inquiryWriter; // 작성자

}