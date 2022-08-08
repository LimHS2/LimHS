package com.me.domain;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class Member {

	private int userNo;
	private String userLevel;

	@NotBlank
	private String userId;

	@NotBlank
	private String userPw;
	private String userPwCheck;

	@NotBlank
	private String userName;

	private String userGender;
	private int userYear;
	private int userMonth;
	private int userDay;

	private int userPnum1;
	private int userPnum2;
	private int userPnum3;

	private String userEmailId;
	private String userEmailSite;

	private int userPostcode;
	private String userAddress1;
	private String userAddress2;

	private String agreeAd;
	private Date regDate;

	private List<MemberAuth> authList;

}