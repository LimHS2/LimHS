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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 목록
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

<!-- 테이블 -->
<form:form modelAttribute="adminMember">

	<table>
		<tr>

			<!-- 회원등급 -->
			<th align="center" width="100"><spring:message
					code="admin.user.level" /></th>

			<!-- 회원번호 -->
			<th align="center" width="100"><spring:message
					code="admin.user.num" /></th>
			
			<!-- 아이디 -->
			<th align="center" width="200"><spring:message
					code="admin.user.id" /></th>
			
			<!-- 이름 -->
			<th align="center" width="200"><spring:message
					code="admin.user.name" /></th>
			
			<!-- 성별 -->
			<th align="center" width="200"><spring:message
					code="admin.user.gender" /></th>
			
			<!-- 생년월일 -->
			<th align="center" width="200"><spring:message
					code="admin.user.birth" /></th>
					
			<!-- 이메일 -->
			<th align="center" width="200"><spring:message
					code="admin.user.email" /></th>
			
			<!-- 휴대폰번호 -->
			<th align="center" width="200"><spring:message
					code="admin.user.phone" /></th>
					
			<!-- 광고동의여부 -->
			<th align="center" width="200"><spring:message
					code="admin.user.agreead" /></th>
		</tr>
		
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="9" align="center"><spring:message
							code="common.listEmpty" /></td>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="mlist">
					<tr id="listTR">

						<!-- 회원등급 -->
						<td align="center">${mlist.userLevel}</td>
						
						<!-- 회원번호 -->
						<td align="center">${mlist.userNo}</td>

						<!-- 아이디 -->
						<td align="center"><a href="/admin/adminmember/read?userNo=${mlist.userNo}" >${mlist.userId}</a></td>
						
						<!-- 이름 -->
						<td align="center">${mlist.userName}</td>
						
						<!-- 성별 -->
						<td align="center">${mlist.userGender}</td>
						
						<!-- 생년월일 -->
						<td align="center">${mlist.userYear}.${mlist.userMonth}.${mlist.userDay}</td>
						
						<!-- 이메일 -->
						<td align="center">${mlist.userEmailid}${mlist.userEmailsite}</td>
						
						<!-- 휴대폰번호 -->
						<td align="center">${mlist.userPnum1}&nbsp;-&nbsp;${mlist.userPnum2}&nbsp;-&nbsp;${mlist.userPnum3}</td>
						
						<!-- 광고동의여부 -->
						<td align="center">${mlist.agreeAd}</td>
					
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</form:form>

<!-- 등록 버튼 -->
<br>
<div style="margin-left: 1700px;">
	<button type="submit" id="btnRegister">
		<spring:message code="action.register" />
	</button>
</div>

<!-- 페이징 네비게이션 -->
<div style="text-align: center;">

	<c:if test="${pagination.prev}">
		<a href="${pagination.startPage - 1}">&laquo;</a>
	</c:if>

	<c:forEach begin="${pagination.startPage }"
		end="${pagination.endPage }" var="idx">
		<a href="/admin/adminmember/list${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="${pagination.endPage +1}">&raquo;</a>
	</c:if>

</div>

<!-- 등록버튼 스크립트 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	$(document).ready(function() {

		var formObj = $("#adminMember");

		//등록 버튼
		$("#btnRegister").on("click", function() {
			self.location = "register";
		});

	});

	var result = "${msg}";

	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />")
	}
</script>