<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 보안 태그 라이브러리 -->
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet" href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet" href="style.css" />

<!-- 문의사항 등록 헤더 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
	<spring:message code="adminInquiry.header.register" />
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 등록 테이블 -->
<form:form modelAttribute="adminInquiry" action="register">
	<table class="type01" style="width: 900px;">
		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="adminInquiry.title" /></td>
			<td><form:input path="inquiryTitle" style="width:800px;" /></td>
		</tr>
		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="adminInquiry.content" /></td>
			<td><form:textarea path="inquiryContent" style="height: 400px; width:800px;" /></td>
		</tr>
		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="adminInquiry.writer" /></td>
			<td><form:input value="관리자" path="inquiryWriter" readonly="true" /></td>
		</tr>
	</table>
</form:form>

<!-- 등록 / 목록 버튼 -->
<br>
<div style="text-align: center;">
	<button type="submit" id="btnRegister">
		<spring:message code="action.register" />
	</button>

	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>

<script>
	$(document).ready(function() {

		var formObj = $("#adminInquiry");

		$("#btnRegister").on("click", function() {
			formObj.submit();
		});

		$("#btnList").on("click", function() {
			self.location = "list";
		});

	});
</script>
