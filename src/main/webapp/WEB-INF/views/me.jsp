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

<!-- 메인페이지 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;메인페이지
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 공연 헤더 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
		<spring:message code="admin.show.list" />
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 공연목록 테이블 -->
<form:form modelAttribute="adminShow">

	<table>
		<tr>
			<!-- 체크박스 전체 선택 -->
			<!-- <th><input type="checkbox" name="checkAll"
				id="checkAll" /></th> -->

			<!-- 공연번호 -->
			<th align="center" width="100"><spring:message
					code="admin.show.num" /></th>

			<!-- 공연명 -->
			<th align="center" width="100"><spring:message
					code="admin.show.name" /></th>

			<!-- 공연장소 -->
			<th align="center" width="200"><spring:message
					code="admin.show.place" /></th>

			<!-- 공연회차 -->
			<th align="center" width="80"><spring:message
					code="admin.show.round" /></th>

			<!-- 공연일정 -->
			<th align="center" width="150"><spring:message
					code="admin.show.date" /></th>

			<!-- 출연진 -->
			<th align="center" width="100"><spring:message
					code="admin.show.cast" /></th>

			<!-- 출연진 수	 -->
			<%-- <th align="center" width="80"><spring:message
					code="admin.show.numofcast" /></th>  --%>

			<!-- 공연 첨부파일 명
			<th align="center" width="150">첨부파일 명</th> -->

			<!-- 런타임 -->
			<th align="center" width="80"><spring:message
					code="admin.show.runtime" /></th>

			<!-- 수용 가능 인원 -->
			<th align="center" width="100"><spring:message
					code="admin.show.capacity" /></th>

			<!-- 현 예약 인원 -->
			<th align="center" width="100"><spring:message
					code="admin.show.reservations" /></th>

			<!-- 총 예약 인원 	
			<th align="center" width="100"><spring:message
					code="admin.show.totalreservations" /></th>-->
		</tr>

		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="9" align="center"><spring:message
							code="common.listEmpty" /></td>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="adminShow">
					<tr>
						<!-- 체크박스 -->
						<%-- <td align="center"><input type="checkbox" name="check"
							value="${adminShow.showNum}" /></td> --%>

						<!-- 공연번호 -->
						<td align="center">${adminShow.showNum}</td>

						<!-- 공연명 -->
						<td align="center"><a
							href="/admin/adminshow/read?showNum=${adminShow.showNum}">${adminShow.showName}</a></td>

						<!-- 공연장소 -->
						<td align="center">${adminShow.showPlace}</td>

						<!-- 공연회차 -->
						<td align="center">${adminShow.showRound}회</td>

						<!-- 공연일정 -->
						<td align="center">${adminShow.showDate}</td>

						<!-- 출연진 -->
						<td align="center">${adminShow.showCast}</td>

						<!-- 출연진 수 
						<td align="center">${adminShow.showNumOfCast}명</td>  -->

						<!-- 공연 첨부파일 명 
						<td align="center">${adminShow.showAttachments}</td>-->

						<!-- 런타임 -->
						<td align="center">${adminShow.showRuntime}분</td>

						<!-- 수용 가능 인원 -->
						<td align="center">${adminShow.showCapacity}명</td>

						<!-- 현 예약 인원 -->
						<td align="center">${adminShow.showReservations}명</td>

						<!-- 총 예약 인원 
						<td align="center">${adminShow.showTotalReservations}명</td>  -->
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</form:form>

<!-- 수업 헤더 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
		<spring:message code="classgroup.header.list" />
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 수업 리스트 -->
<table border="1" class="type01">
	<tr>
		<th align="center" width="160"><spring:message
				code="classgroup.classNum" /></th>
		<th align="center" width="160"><spring:message
				code="classgroup.classTitle" /></th>
		<th align="center" width="180"><spring:message
				code="classgroup.classMale" /></th>
		<th align="center" width="180"><spring:message
				code="classgroup.classFemale" /></th>
		<th align="center" width="180"><spring:message
				code="classgroup.classTotal" /></th>
		<th align="center" width="180"><spring:message
				code="classgroup.regdate" /></th>
		<th align="center" width="180"><spring:message
				code="classgroup.classRecruitment" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="7" align="center"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="classGroup">
				<tr>
					<td align="center">${classGroup.classNum}</td>
					<td align="left"><a
						href="/admin/classgroup/read?classNum=${classGroup.classNum}">${classGroup.classRegistTitle}
					</a></td>
					<td align="center">${classGroup.classFemaleNum}</td>
					<td align="center">${classGroup.classMaleNum}</td>
					<td align="center">${classGroup.classTotalPeople}</td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${classGroup.classRegDate}" /></td>
					<td align="center">${classGroup.classRegistRecruitment}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>

<!-- 회원 조회 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 목록</h3>
	<hr class="testhr1">
	<br>
</div>

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
						<td align="center"><a
							href="/admin/adminmember/read?userNo=${mlist.userNo}">${mlist.userId}</a></td>

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