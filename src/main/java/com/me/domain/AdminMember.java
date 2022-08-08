package com.me.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminMember {
	private Integer userNo; //회원번호_pk
	private String userLevel; //회원등급
	private String userId; //아이디
	private String userPw; //비밀번호
	private String userName; //이름
	private String userGender; //성별
	private int userYear; //생년월일 년도
	private int userMonth; //생년월일 월
	private int userDay; //생년월일 일
	private int userPnum1; //핸드폰번호1
	private int userPnum2; //핸드폰번호2
	private int userPnum3; //핸드폰번호3
	private String userEmailid; //이메일
	private String userEmailsite; //이메일2
	private int userPostcode; //주소(우편번호)
	private String userAddress1; //주소(상세주소)1
	private String userAddress2; //주소(상세주소)2
	private String agreeAd; //광고동의여부
	private Date regDate; //등록일
}
