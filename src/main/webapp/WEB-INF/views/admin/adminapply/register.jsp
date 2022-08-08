<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 제목 -->
<h2>
	수강 신청 등록
</h2>

<!-- 수강 신청 등록 테이블 -->
<form:form modelAttribute="adminApply" action="register" enctype="multipart/form-data">
	<table>
	
		<!-- 지원번호 -->
		<form:hidden path="applyNum" />
		
		<tr>
			<!-- 회원번호 -->
			<td id="registerTD"><spring:message code="admin.user.num" /></td>
			<td id="reg_td"><form:input path="userNo" /></td>
		</tr>
		
		<tr>
			<!-- 수업번호 -->
			<td id="registerTD"><spring:message code="classgroup.classNum" /></td>
			<td id="reg_td"><form:input path="classNum" /></td>
		</tr>
		
		<tr>
			<!-- 기수 -->
			<td id="registerTD"><spring:message code="admin.apply.gisu" /></td>
			<td id="reg_td"><form:input path="applyGisu" /></td>
		</tr>
		
		<tr>
			<!-- 수강신청 날짜 -->
			<td id="registerTD"><spring:message code="admin.apply.registrationdate" /></td>
			<td id="reg_td"><form:input type="date" path="applyRegistrationDate" /></td>
		</tr>
		
		<tr>
			<!-- 환불신청 날짜 -->
			<td id="registerTD"><spring:message code="admin.apply.refundrequestdate" /></td>
			<td id="reg_td"><form:input type="date" path="applyRefundRequestDate" /></td>
		</tr>
		
		<tr>
			<!-- 수강현황 -->
			<td id="registerTD"><spring:message code="admin.apply.attendancestatus" /></td>
			<td id="reg_td"><form:select path="applyAttendanceStatus">
					<option value="classBefore" selected="selected">수강 전</option>
					<option value="classTaking">수강중</option>
					<option value="classComplete">수강완료</option>
				</form:select></td>
		</tr>
	
		
	</table>
</form:form>

<!-- 취소, 등록 버튼 -->
<div>
	<button type="submit" id=btnCancel>
		<spring:message code="action.cancel" />
	</button>

	<button type="submit" id=btnRegister>
		<spring:message code="action.register" />
	</button>
</div>

<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("#adminApply");

		//취소 버튼
		$("#btnCancel").on("click", function() {
			if (confirm("작성중인 내용을 취소합니까?") == true) {//확인
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

<style>
table {
	border: 1px solid black;
	border-collapse: collapse;
	margin-right: auto;
	margin-left: auto;
}

#registerTD {
	border: 1px solid black;
	background-color: #FCFBB4;
	font-weight: bold;
	text-align: center;
}

#reg_td {
	border: 1px solid black;
}

div {
	margin-right: auto;
	margin-left: auto;
}
</style>