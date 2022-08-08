<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 보안 태그 라이브러리 -->
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet" href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet" href="style.css" />

<!-- 수정부분 헤더 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
	<spring:message code="adminInquiry.header.modify" />
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 수정 테이블 -->
<form:form modelAttribute="adminInquiry" action="modify">
	<form:hidden path="inquiryNum" />

	<!-- 현재 페이지 번호와 페이징 크기 그리고 검색유형, 검색어를 숨겨진 필드 요소를 사용하여 전달 -->
	<%-- <input type="hidden" name="page" value="${pgrq.page}">
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
	<input type="hidden" name="searchType" value="${pgrq.searchType}">
	<input type="hidden" name="keyword" value="${pgrq.keyword}"> --%>

	<table class="type01" style="width: 900px;">
		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="adminNotice.title" /></td>
			<td><form:input path="inquiryTitle" style="width:800px;" /></td>
		</tr>
		<tr style="height: 400px;">
			<td style="text-align:center; background-color: #ececec;"><spring:message code="adminNotice.content" /></td>
			<td><form:textarea path="inquiryContent" style="height: 400px; width:800px;" /></td>
		</tr>
<%-- 		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="pds.itemFile" /></td>
			<td><input type="file" id="inputFile">
				<div class="uploadedList"></div></td>
		</tr> --%>
		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="adminNotice.writer" /></td>
			<td><form:input path="inquiryWriter" readonly="true" /></td>
		</tr>
	</table>
</form:form>

<!-- 수정 / 목록 버튼 -->
<br>
<div style="text-align: center;">
	<!-- <sec:authorize access="hasRole('ROLE_ADMIN')"> -->
	<button type="submit" id="btnModify">
		<spring:message code="action.modify" />
	</button>
	<!-- </sec:authorize> -->

	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>

<script>
	$(document).ready(function() {

		var formObj = $("#adminInquiry");

		$("#btnModify").on("click", function() {
			formObj.submit();
		});

		$("#btnList").on("click", function() {
			self.location = "list";
		});

	});
</script>