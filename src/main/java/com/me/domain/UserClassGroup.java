package com.me.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserClassGroup {
	
	private int classNum; // 수업 번호
	private String className; // 수업명 (작품명)
	private String classRegistTitle; // 글 제목
	private String classGisu; // 기수
	private String classPeriod; // 수업기간
	private String classTime; // 수업시간
	private int classStudent; // 모집인원
	private int classTotalPeople; // 총 인원수
	private int classFemaleNum; // 남 인원수
	private int classMaleNum; // 여 인원수
	private String classRegistRecruitment; // 모집현황
	private String classContent; // 내용
	private Date classRegDate; // 등록일
	private Date classUpdDate; // 수정일

}
