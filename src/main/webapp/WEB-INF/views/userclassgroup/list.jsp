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

<!-- 사용자 수업 -->
<div>
	<h3 style="line-height: 2.0;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수업
		리스트</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 수업 리스트 테이블 -->
<table border="1" class="type01">
	<tr>
		<th align="center" width="160">글번호</th>
		<th align="center" width="160">수업명</th>
		<th align="center" width="180">수업기간</th>
		<th align="center" width="180">모집상황</th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="4"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="userClassGroup">
				<tr>
					<td align="center">${userClassGroup.classNum}</td>
					<td align="center"><a
						href="/userclassgroup/read?classNum=${userClassGroup.classNum}">${userClassGroup.classGisu}기&nbsp;${userClassGroup.className}
					</a></td>
					<td align="center">${userClassGroup.classPeriod}</td>
					<td align="center">${userClassGroup.classRegistRecruitment}</td>
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
		<a href="/userclassgroup/list${pagination.makeQuery(idx)}">${idx}</a>
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

<!-- 지원하기 버튼 -->
<%-- <div style="float: right; padding-right: 100px;">
	<button id='btnApply'>
		<spring:message code="action.apply" />
	</button>
</div> --%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		//지원하기 버튼
		$("#btnApply").on("click", function() {
			location.href = "http://localhost:8080/userapply/register";
		});

	});

	var result = "${msg}";

	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />")
	}
</script>