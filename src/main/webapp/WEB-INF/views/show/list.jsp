	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h1 align="center">공연 목록</h1>
<hr>
<br>
<c:choose>
	<c:when test="${empty list}">
		<tr>
			<td colspan="3">등록 된 공연이 없습니다.</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${list}" var="show">
			<div style="float: left; margin-left: 150px; background-color: #dcdcdc;"
				align="center">
				<div>
					<a href="/show/read?showNum=${show.showNum}"><img
						src="display?showNum=${show.showNum}" width="300" height="400"></a>
				</div>
				<div style="text-align: center;">
					<a href="/show/read?showNum=${show.showNum}"
						style="text-decoration: none; font-size: 20px; color: black;"><strong>${show.showName}</strong></a>
					<br>${show.showDate}
				</div>
			</div>

		</c:forEach>
	</c:otherwise>
</c:choose>
<script>
	var result = "${msg}";
	if (result === "SUCCESS") {
		alert("공연등록 성공");
	}
</script>