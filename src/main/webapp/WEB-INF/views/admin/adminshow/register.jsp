<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet" href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet" href="style.css" />

<!-- 제목 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
	<spring:message code="admin.show.register" />
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 공연등록 테이블 -->
<form:form modelAttribute="adminShow" action="register" enctype="multipart/form-data">
	<table style="width: 900px;">
	
		<!-- 공연번호 -->
		<form:hidden path="showNum" />
		
		<tr>
			<!-- 공연명 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.name" /></td>
			<td><form:select path="showName">
					<option value="레베카" selected="selected">레베카</option>
					<option value="레미제라블">레미제라블</option>
					<option value="맘마미아">맘마미아</option>
				</form:select></td>
		</tr>
		
		<tr>
			<!-- 공연장소 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.place" /></td>
			<td><form:input path="showPlace" /></td>
		</tr>
		
		<tr>
			<!-- 공연회차 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.round" /></td>
			<td><form:select path="showRound">
					<option value="1" selected="selected">1회</option>
					<option value="2">2회</option>
					<option value="3">3회</option>
					<option value="4">4회</option>
				</form:select></td>
		</tr>
		
		<tr>
			<!-- 공연일정 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.date" /></td>
			<td><form:input type="date" path="showDate" /></td>
		</tr>
		
		<tr>
			<!-- 출연진 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.cast" /></td>
			<td><form:input path="showCast" /></td>
		</tr>
		
		<tr>
			<!-- 출연진 수 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.numofcast" /></td>
			<td><form:input path="showNumOfCast" /></td>
		</tr>
		
		<tr>
			<!-- 공연 첨부파일 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.file" /></td>
			<td><input type="file" name="showFile"/></td>
		</tr>
		 
		 <tr>
			<!-- 런타임 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.runtime" /></td>
			<td><form:select path="showRuntime">
					<option value="120" selected="selected">120분</option>
					<option value="90">90분</option>
				</form:select></td>
		</tr>
		
		<tr>
			<!-- 수용 가능 인원 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.capacity" /></td>
			<td><form:input path="showCapacity" /></td>
		</tr>
		
		<tr>
			<!-- 현 예약인원-->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.reservations" /></td>
			<td><form:input path="showReservations" /></td>
		</tr>
		
		<tr>
			<!-- 총 예약인원-->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.totalreservations" /></td>
			<td><form:input path="showTotalReservations" /></td>
		</tr>
		
	</table>
</form:form>

<!-- 취소, 등록 버튼 -->
<br>
<div style="text-align: center;">
	<button type="submit" id=btnCancel>
		<spring:message code="action.cancel" />
	</button>

	<button type="submit" id=btnRegister>
		<spring:message code="action.register" />
	</button>
</div>

<!-- 등록 / 취소 스크립트 -->
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("#adminShow");

		//취소 버튼
		$("#btnCancel").on("click", function() {
			if (confirm("작성중인 내용을 취소하고 공연관리로 이동할까요?") == true) {//확인
				self.location = "list";
			} else {//취소
				return false;
			}
		});

		//등록 버튼
		$("#btnRegister").on("click", function() {
			if (confirm("입력하신 정보로 등록하시겠습니까?") == true) {//확인
				formObj.submit();
			} else {//취소
				return false;
			}
		});

	});
</script>