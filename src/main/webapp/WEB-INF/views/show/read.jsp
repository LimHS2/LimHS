<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- 공연등록 테이블 -->
<form:form modelAttribute="show">
	<div style="margin: 50px;">
		<div style="float: left; padding-right: 30px;">
			<!-- 공연 첨부파일 -->
			<div>
				<img src="display?showNum=${show.showNum}" width="800" height="600"
					style="padding-left: 30px;">
			</div>
		</div>

		<!-- 공연명 -->
		<div>
			<h1>${show.showName}</h1>
			<br>
			<hr>
			<br>
			<h2>${show.showPlace}</h2>
			<br>
			<h2>${show.showDate}-${show.showRound}회차</h2>
			<br>
			<h2>런타임 : ${show.showRuntime}분</h2>
			<br>
			<hr>
			<br>
			<h4>출연진 정보 (${show.showNumOfCast})</h4>
			<br>
			<h3>${show.showCast}</h3>
			<br>
			<hr>
			<br>
			<h4>예약현황</h4>
			<br>
			<h3>${show.showReservations}/${show.showCapacity}(명)</h3>
			<br>
			<h3>잔여좌석 :</h3>

		</div>
	</div>
</form:form>

<div>
	<button type="submit" id="btnList">공연목록보기</button>
	<button type="submit" id="btnBook">예매하기</button>
</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("#show");
		$("#btnBook").on("click", function() {
			self.location = "book";
		});
		$("#btnList").on("click", function() {
			self.location = "list";
		});
	});
</script>
<style>
#btnList {
	width: 200px;
	height: 50px;
	background-color: #dcdcdc;
	font-size: 25px;
	color: white;
	border: none;
}

#btnBook {
	width: 200px;
	height: 50px;
	background-color: #94EB3E;
	border: none;
	font-size: 25px;
	color: white;
}
</style>