package com.me.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminApply {
		//지원
		private int applyNum; //지원번호_pk
		private String applyGisu; //기수
		private String applyRegistrationDate; //수강신청 날짜
		private String applyRefundRequestDate; //환불신청 날짜
		private String applyAttendanceStatus; //수강현황
		private String applyAttachments; //첨부파일명
		private MultipartFile applyFile;//지원 첨부파일
		private String applyStageExperience; //무대경험
		private String applyAboutSE; //무대경험 있음
		private String applySelfIntroduction; //자기소개
		
		//회원관련
		private Integer applyUserNo; //회원번호
		private String applyUserName; //이름
		private String applyUserGender; //성별
		private int applyUserYear; //회원_생년월일 년도
		private int applyUserMonth; //회원_생년월일 월
		private int applyUserDay; //회원_생년월일 일
		private int applyUserPnum1; //핸드폰번호1
		private int applyUserPnum2; //핸드폰번호2
		private int applyUserPnum3; //핸드폰번호3
		private String applyUserEmailid; //이메일
		private String applyUserEmailsite; //이메일2
		private int applyUserPostcode; //주소(우편번호)
		private String applyUserAddress1; //주소(상세주소)1
		private String applyUserAddress2; //주소(상세주소)2
		
		//수업관련
		private int applyClassNum; // 수업번호
		private String applyClassName; // 수업명
		private String applyClassPeriod; // 수업기간
		private String applyClassRegistRecruitment; // 모집현황
}
