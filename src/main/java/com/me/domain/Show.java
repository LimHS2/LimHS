package com.me.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class Show {
	private Integer showNum;// 공연번호
	private String showName;// 공연이름
	private String showPlace;// 공연장소
	private int showRound;// 공연회차
	private String showDate;// 공연날짜
	private String showCast;// 출연진
	private int showNumOfCast;// 출연진 수
	private String showAttachments;// 공연 첨부파일 명
	private int showReservations;// 현 예약 인원
	private int showRuntime;// 런타임
	private int showCapacity;// 수용가능 인원
	private int showTotalReservations;// 총 예약 인원
	private MultipartFile showFile;// 공연사진 파일

}
