<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet" href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet" href="style.css" />

<!-- 제목 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원상세보기
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 공연등록 테이블 -->
<form:form modelAttribute="adminMember">
	<table style="width: 900px;">
		<tr>
			<!-- 회원번호 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.num" /></td>
			<td><form:input path="userNo" readonly="true" /></td>
		</tr>

		<tr>
			<!-- 회원등급 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.level" /></td>
			<td><form:input path="userLevel" readonly="true" /></td>
		</tr>

		<tr>
			<!-- 아이디 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.id" /></td>
			<td><form:input path="userId" readonly="true" /></td>
		</tr>

		<tr>
			<!-- 비밀번호 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.pw" /></td>
			<td><form:input path="userPw" readonly="true" /></td>
		</tr>

		<tr>
			<!-- 이름 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.name" /></td>
			<td><form:input path="userName" readonly="true" /></td>
		</tr>

		<tr>
			<!-- 성별 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.gender" /></td>
			<td><form:input path="userGender" readonly="true" /></td>
		</tr>

		<tr>
			<!-- 생년월일 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.birth" /></td>
			<td><form:input path="userYear" size="4"
					readonly="true" />.<form:input path="userMonth" size="4"
					readonly="true" />.<form:input path="userDay" size="4"
					readonly="true" /></td>
		</tr>

		<tr>
			<!-- 핸드폰번호 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.phone" /></td>
			<td><form:input path="userPnum1" size="4"
					readonly="true" />&nbsp;-&nbsp;<form:input path="userPnum2" size="4"
					readonly="true" />&nbsp;-&nbsp;<form:input path="userPnum3" size="4"
					readonly="true" /></td>
		</tr>
		
		<tr>
			<!-- 이메일 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.email" /></td>
			<td><form:input path="userEmailid" readonly="true" /><form:input path="userEmailsite" readonly="true" /></td>
		</tr>
		
		<tr>
			<!-- 주소 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.address" /></td>
			<td><form:input path="userPostcode" readonly="true" /><br>
			<form:input path="userAddress1" readonly="true" /><br>
			<form:input path="userAddress2" readonly="true" /></td>
		</tr>
		
		<tr>
			<!-- 광고동의여부 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.agreead" /></td>
			<td><form:input path="agreeAd" readonly="true" /></td>
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

	<!-- 수정 버튼 
	<button type="submit" id=btnModify>
		<spring:message code="action.modify" />
	</button>-->
</div>

<!-- 목록 / 삭제 / 수정 스크립트 -->
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("#adminMember");

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
				formObj.attr("action", "/admin/adminmember/remove");
				formObj.submit();
			} else {//취소
				return false;
			}
		});

		//수정 버튼
//		$("#btnModify").on("click", function() {

//			var userNo = $("#userNo");
//			var userNoVal = userNo.val();

//			self.location = "modify?userNo=" + userNoVal;
//		});

	});
</script>