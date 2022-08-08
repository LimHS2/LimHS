package com.me.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminShow {
	private int showNum; //공연번호_pk
	private String showName; //공연명
	private String showPlace; //공연장소
	private int showRound; //공연회차
	private String showDate; //공연일정
	private String showCast; //출연진
	private Integer showNumOfCast; //출연진 수
	private MultipartFile showFile;//공연 첨부파일(=pdf 14-1 picture)
	private String showAttachments; //공연 첨부파일명(=pdf 14-1 picture url)
	private int showRuntime; //런타임
	private int showCapacity; //수용 가능 인원
	private int showReservations; //현 예약 인원
	private int showTotalReservations; //총 예약 인원
}
