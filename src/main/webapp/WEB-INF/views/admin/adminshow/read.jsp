<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet" href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet" href="style.css" />

<!-- 제목 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
	<spring:message code="admin.show.read" />
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 공연등록 테이블 -->
<form:form modelAttribute="adminShow">
	<table style="width: 900px;">
		<tr>
			<!-- 공연번호 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.num" /></td>
			<td><form:input path="showNum" readonly="true" /></td>
		</tr>
		
		<tr>
			<!-- 공연명 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.name"  /></td>
			<td><form:input path="showName" readonly="true" /></td>
		</tr>
		
		<tr>
			<!-- 공연장소 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.place" /></td>
			<td><form:input path="showPlace" readonly="true"/></td>
		</tr>
		
		<tr>
			<!-- 공연회차 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.round" /></td>
			<td><form:input path="showRound" readonly="true"/></td>
		</tr>
		
		<tr>
			<!-- 공연일정 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.date" /></td>
			<td><form:input type="date" path="showDate" readonly="true"/></td>
		</tr>
		
		<tr>
			<!-- 출연진 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.cast" /></td>
			<td><form:input path="showCast" readonly="true"/></td>
		</tr>
		
		<tr>
			<!-- 출연진 수 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.numofcast" /></td>
			<td><form:input path="showNumOfCast" readonly="true"/></td>
		</tr>
		
		<tr>
			<!-- 공연 첨부파일 -->
		 	<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.file" /></td>
			<td><img src = "display?showNum=${adminShow.showNum}" width="150" height="150" ></td>
		</tr>
		
		<tr>
			<!-- 런타임 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.runtime" /></td>
			<td><form:input path="showRuntime" readonly="true"/></td>
		</tr>
		
		<tr>
			<!-- 수용 가능 인원 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.capacity" /></td>
			<td><form:input path="showCapacity" readonly="true"/></td>
		</tr>
		
		<tr>
			<!-- 현 예약인원-->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.reservations" /></td>
			<td><form:input path="showReservations" readonly="true"/></td>
		</tr>
		
		<tr>
			<!-- 총 예약인원-->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.totalreservations" /></td>
			<td><form:input path="showTotalReservations" readonly="true"/></td>
		</tr>
	</table>
</form:form>

<!-- 목록, 삭제, 수정 버튼 -->
<br>
<div style="text-align: center;">
	<!-- 목록 버튼 -->
	<button type="submit" id=btnList>
		<spring:message code="action.list" />
	</button>

	<!-- 삭제 버튼 -->
	<button type="submit" id="btnDelete">
		<spring:message code="action.remove" />
	</button>
	
	<!-- 수정 버튼 -->
	<button type="submit" id=btnModify>
		<spring:message code="action.modify" />
	</button>
</div>

<!-- 목록 / 삭제 / 수정 스크립트 -->
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("#adminShow");

		//목록 버튼
		$("#btnList").on("click", function() {
			if (confirm("목록으로 이동할까요?") == true) {//확인
				self.location = "list";
			} else {//취소
				return false;
			}
		});

		//삭제 버튼
		$("#btnDelete").on("click", function() {
			if (confirm("삭제 하시겠습니까?") == true) {//확인
				formObj.attr("action","/admin/adminshow/remove");
				formObj.submit();
			} else {//취소
				return false;
			}
		});
		
		//수정 버튼
		$("#btnModify").on("click", function() {
		
			var showNum = $("#showNum");
			var showNumVal = showNum.val();
			
			self.location = "modify?showNum=" + showNumVal;
		});

	});
</script>

<style>
table {
	border: 1px solid black;
	border-collapse: collapse;
	margin-right: auto;
	margin-left: auto;
}

#readTD {
	border: 1px solid black;
	background-color: #FCFBB4;
	font-weight: bold;
	text-align: center;
}

#red_td {
	border: 1px solid black;
}

div {
	margin-right: auto;
	margin-left: auto;
}
</style>