<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet"
	href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet"
	href="style.css" />


<!-- 사용자 공지사항 -->
<div>
	<h3 style="line-height: 2.0;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사용자 공지사항
	</h3>
	<hr class="testhr1">
	<br>
</div>

<table border="1" class="type01">
	<tr>
		<th align="center" width="80"><spring:message code="adminNotice.no" /></th>
		<th align="center" width="320"><spring:message code="adminNotice.title" /></th>
		<%-- <th align="center" width="180"><spring:message code="adminNotice.content" /></th> --%>
		<th align="center" width="180"><spring:message code="adminNotice.regdate" /></th>
		<th align="center" width="80"><spring:message code="adminNotice.writer" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="5"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="userNotice">
				<tr>
					<td align="center">${userNotice.noticeNum}</td>
					<td align="left"><a href="/userNotice/read?noticeNum=${userNotice.noticeNum}">${userNotice.noticeTitle}
					</a></td>
					<%-- <td align="center">${userNotice.noticeContent}</td> --%>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${userNotice.noticeReg}" /></td>
					<td align="center">${userNotice.noticeWriter}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>

<!-- 페이징 네비게이션 -->
<br>
<div style="text-align: center;">
<<
	<c:if test="${pagination.prev}">
		<a href="${pagination.startPage - 1}">&laquo;</a>
	</c:if>

	<c:forEach begin="${pagination.startPage }"
		end="${pagination.endPage }" var="idx">
		<a href="/userNotice/list${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="${pagination.endPage +1}">&raquo;</a>
	</c:if>
	>>
</div>
<br>

<!-- 검색 폼 -->
<form:form modelAttribute="pgrq" method="get"
	action="list${pgrq.toUriStringByPage(1)}" style="text-align: center;" class="rect1">
	<form:select path="searchType" items="${searchTypeCodeValueList}"
		itemValue="value" itemLabel="label" class="search" style="height: 31px;" />
	<form:input path="keyword" placeholder="검색어 입력" />
	<button id='searchBtn' class="rect">
		<spring:message code="action.search" />
	</button>
</form:form>

<script>
	var result = "${msg}";
	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>