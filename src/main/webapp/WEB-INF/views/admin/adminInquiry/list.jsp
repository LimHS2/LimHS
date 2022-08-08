<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 보안 태그 라이브러리 -->
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet"
	href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet"
	href="style.css" />

<!-- 문의사항 헤더 -->
<br>
<div>
<h3 style="line-height: 2.0;">
	<spring:message code="adminInquiry.header.list" />
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

<!-- 문의사항 리스트 -->
<table border="1" class="type01">
	<tr>
		<th align="center" width="80"><spring:message
				code="adminInquiry.no" /></th>
		<th align="center" width="320"><spring:message
				code="adminInquiry.title" /></th>
		<th align="center" width="180"><spring:message
				code="adminInquiry.regdate" /></th>
		<th align="center" width="180"><spring:message
				code="adminInquiry.writer" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="4"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="adminInquiry">
				<tr>
					<td align="center">${adminInquiry.inquiryNum}</td>
					<%-- <td align="left"><a href="/adminInquiry/read?inquiryNum=${adminInquiry.inquiryNum}"><c:out value="${adminInquiry.inquiryTitle}" /></a></td> --%>
					<!-- 게시글 상세보기할 때 페이징 요청 정보를 매개변수로 전달한다. -->
					<td align="left"><a
						href="/admin/adminInquiry/read${pgrq.toUriString(pgrq.page)}&inquiryNum=${adminInquiry.inquiryNum}"><c:out
								value="${adminInquiry.inquiryTitle}" /></a></td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${adminInquiry.inquiryReg}" /></td>
					<td align="center">${adminInquiry.inquiryWriter}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<br>

<!-- 문의사항 등록 -->
<div style="margin-left: 1700px;">
	<button type="button" onclick="location.href='register' ">등록</button>
</div>


<!-- 페이징 네비게이션 -->
<div style="text-align: center;">

	<c:if test="${pagination.prev}">
		<a href="${pagination.startPage - 1}">&laquo;</a>
	</c:if>

	<c:forEach begin="${pagination.startPage }"
		end="${pagination.endPage }" var="idx">
		<a href="/admin/adminInquiry/list${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="${pagination.endPage +1}">&raquo;</a>
	</c:if>

</div>

<script>
	var result = "${msg}";

	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>