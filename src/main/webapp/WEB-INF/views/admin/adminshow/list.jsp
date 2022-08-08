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

<!-- 공연등록 헤더 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
	<spring:message code="admin.show.list" />
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
				<c:forEach items="${list}" var="showlist">
					<tr>
						<!-- 체크박스 -->
						<%-- <td align="center"><input type="checkbox" name="check"
							value="${showlist.showNum}" /></td> --%>

						<!-- 공연번호 -->
						<td align="center">${showlist.showNum}</td>

						<!-- 공연명 -->
						<td align="center"><a
							href="/admin/adminshow/read?showNum=${showlist.showNum}">${showlist.showName}</a></td>

						<!-- 공연장소 -->
						<td align="center">${showlist.showPlace}</td>

						<!-- 공연회차 -->
						<td align="center">${showlist.showRound}회</td>

						<!-- 공연일정 -->
						<td align="center">${showlist.showDate}</td>

						<!-- 출연진 -->
						<td align="center">${showlist.showCast}</td>

						<!-- 출연진 수 
						<td align="center">${showlist.showNumOfCast}명</td>  -->

						<!-- 공연 첨부파일 명 
						<td align="center">${showlist.showAttachments}</td>-->

						<!-- 런타임 -->
						<td align="center">${showlist.showRuntime}분</td>

						<!-- 수용 가능 인원 -->
						<td align="center">${showlist.showCapacity}명</td>

						<!-- 현 예약 인원 -->
						<td align="center">${showlist.showReservations}명</td>

						<!-- 총 예약 인원 
						<td align="center">${showlist.showTotalReservations}명</td>  -->
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</form:form>

<!-- 삭제, 등록 버튼 -->
<br>
<div style="margin-left: 1700px;">
	<%-- <button type="submit" id="btnDelete">
		<spring:message code="action.remove" />
	</button> --%>

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
		<a href="/admin/adminshow/list${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="${pagination.endPage +1}">&raquo;</a>
	</c:if>

</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	$(document)
			.ready(
					function() {

						var formObj = $("#adminShow");

						//체크박스 전체선택
						//https://mygomii.tistory.com/16 참고
						$("#checkAll").click(function() {

							if ($("#checkAll").prop("checked")) {//체크박스 전체 선택 
								$("input[name=check]").prop("checked", true);

							} else {//체크박스 전체 선택해제
								$("input[name=check]").prop("checked", false)
							}
						});

						//삭제 버튼(체크한 항목을 삭제함)
						//http://www.joshi.co.kr/index.php?mid=board_XbwP90&document_srl=668 참고
						//화면에선 삭제되지만 DB 연결 안돼있어서 새로고침하면 다시 들어옴
						$("#btnDelete")
								.on(
										"click",
										function() {
											if ($("input[name=check]").is(
													":checked")) {
												if (confirm("삭제 하시겠습니까?")) {
													for (var i = $("[name='check']:checked").length - 1; i > -1; i--) {
														$(
																"[name='check']:checked")
																.eq(i).closest(
																		"tr")
																.remove();
													}
												}
											} else {
												alert("선택된 데이터가 없습니다.");
											}
										});

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