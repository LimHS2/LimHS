<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>공연등록</h2>
<form:form modelAttribute="show" action="register" encType="Multipart/form-data">
	<table>
		<tr>
			<td>공연명</td>
			<td><form:input path="showName" /></td>
			<td><font color="red"><form:errors path="showName" /></font></td>
		</tr>
		<tr>
			<td>공연장소</td>
			<td><form:input path="showPlace" /></td>
			<td><font color="red"><form:errors path="showPlace" /></font></td>
		</tr>
		<tr>
			<td>공연회차</td>
			<td><form:input path="showRound" /></td>
			<td><font color="red"><form:errors path="showRound" /></font></td>
		</tr>
		<tr>
			<td>공연일정</td>
			<td><form:input type="date" path="showDate" /></td>
			<td><form:input type="time" path="showDate" /></td>
			<td><font color="red"><form:errors path="showDate" /></font></td>
		</tr>
		<tr>
			<td>출연진</td>
			<td><form:input path="showCast" /></td>
			<td><font color="red"><form:errors path="showCast" /></font></td>
		</tr>
		<tr>
			<td>출연진 수</td>
			<td><form:input path="showNumOfCast" /></td>
			<td><font color="red"><form:errors path="showNumOfCast" /></font></td>
		</tr>
		
		<tr>
			<td id="registerTD">공연이미지 첨부파일</td>
			<td id="reg_td"><input type="file" name="showFile"/></td>
			<td></td>
		</tr>
		<tr>
			<td>현 예약 인원</td>
			<td><form:input path="showReservations" /></td>
			<td><font color="red"><form:errors path="showReservations" /></font></td>
		</tr>
		<tr>
			<td>런타임</td>
			<td><form:input path="showRuntime" /></td>
			<td><font color="red"><form:errors path="showRuntime" /></font></td>
		</tr>
		<tr>
			<td>수용가능인원</td>
			<td><form:input path="showCapacity" /></td>
			<td><font color="red"><form:errors path="showCapacity" /></font></td>
		</tr>
		<tr>
			<td>총 예약 인원</td>
			<td><form:input path="showTotalReservations" /></td>
			<td><font color="red"><form:errors path="showTotalReservations" /></font></td>
		</tr>
	</table>
</form:form>

<div>
	<button type="submit" id="btnRegister">공연등록</button>
	<button type="submit" id="btnList">공연목록보기</button>
</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
		$(document).ready(function() {
			var formObj = $("#show");
			$("#btnRegister").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				self.location = "list";
			});
		});
	</script>