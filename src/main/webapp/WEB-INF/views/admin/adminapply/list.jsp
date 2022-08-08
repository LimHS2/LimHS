<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet"
	href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet"
	href="style.css" />

<!-- 제목 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수강신청 현황
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 검색 폼 -->
<form:form modelAttribute="pgrq" method="get"
	action="list${pgrq.toUriStringByPage(1)}" style="text-align: center;">
	카테고리
	<form:select path="searchType" items="${searchTypeCodeValueList}"
		itemValue="value" itemLabel="label" class="search" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;검색
	<form:input path="keyword" placeholder="검색어 입력" />
	<button id='searchBtn'>
		<spring:message code="action.search" />
	</button>
	<br>
	<br>
	<hr class="testhr2">
	<br>
</form:form>

<!-- 수강 신청 현황 목록 테이블 -->
<form:form modelAttribute="adminApply">

	<table id="listTBL">
		<tr id="listTR">

			<!-- 회원번호 -->
			<th align="center" width="100"><spring:message
					code="admin.user.num" /></th>

			<!-- 수업명 -->
			<th align="center" width="100"><spring:message
					code="classgroup.className" /></th>
					
			<!-- 지원기수 -->
			<th align="center" width="50"><spring:message
					code="admin.apply.gisu" /></th>

			<!-- 이름 -->
			<th align="center" width="200"><spring:message
					code="admin.user.name" /></th>

			<!-- 성별 -->
			<th align="center" width="80"><spring:message
					code="admin.user.gender" /></th>

			<!-- 휴대폰번호 -->
			<th align="center" width="150"><spring:message
					code="admin.user.phone" /></th>

			<!-- 무대경험 -->
			<th align="center" width="100"><spring:message
					code="admin.apply.stageexperience" /></th>

			<!-- 지원서 -->
			<th align="center" width="80"><spring:message
					code="admin.apply.form" /></th>

		</tr>

		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="8" align="center"><spring:message
							code="common.listEmpty" /></td>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="applylist">
					<tr id="listTR">

						<!-- 회원번호 -->
						<td align="center">${applylist.applyUserNo}</td>

						<!-- 수업번호, 수업명 -->
						<td align="center">${applylist.applyClassNum}&nbsp;${applylist.applyClassName}</td>
						
						<!-- 지원기수 -->
						<td align="center">${applylist.applyGisu}</td>

						<!-- 이름 -->
						<td align="center">${applylist.applyUserName}</td>

						<!-- 성별 -->
						<td align="center">${applylist.applyUserGender}</td>

						<!-- 휴대폰번호 -->
						<td align="center">${applylist.applyUserPnum1}-${applylist.applyUserPnum2}-${applylist.applyUserPnum3}</td>

						<!-- 무대경험 -->
						<td align="center">${applylist.applyStageExperience}</td>

						<!-- 지원서 -->	
						<td align="center"><a href="/admin/adminapply/read?applyNum=${applylist.applyNum}"
	onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">열람하기</a></td>
						
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</form:form>

<!-- 페이징 네비게이션 -->
<br>
<div style="text-align: center;">

	<c:if test="${pagination.prev}">
		<a href="${pagination.startPage - 1}">&laquo;</a>
	</c:if>

	<c:forEach begin="${pagination.startPage }"
		end="${pagination.endPage }" var="idx">
		<a href="/admin/adminapply/list${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="${pagination.endPage +1}">&raquo;</a>
	</c:if>
</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>

	function readPopup()  {
		
		var applyNum = $("#applyNum");
		var applyNumVal = applyNum.val();
		
		window.location.href = 'https:/localhost:8080/admin/adminapply/read?applyNum='+ applyNumVal;
		}

	var result = "${msg}";

	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />")
	}
	
</script>