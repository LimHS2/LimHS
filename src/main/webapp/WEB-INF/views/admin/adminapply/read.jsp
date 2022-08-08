<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet"
	href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet"
	href="style.css" />

<!-- 공지사항 헤더 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지원자 정보
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 수강 신청 등록 테이블 -->
<form:form modelAttribute="adminApply" enctype="multipart/form-data">
	<table>
		<tr>
			<!-- 회원번호 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.num" /></td>
			<td><form:input path="applyUserNo" readonly="true" size="10"/></td>
		</tr>
		
		<tr>
			<!-- 수업번호 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classNum" /></td>
			<td><form:input path="applyClassNum" readonly="true" size="10"/></td>
		</tr>
		
		<tr>
			<!-- 수업명 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.className" /></td>
			<td><form:input path="applyClassName" readonly="true"/></td>
		</tr>
		
		<tr>
			<!-- 기수 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.apply.gisu" /></td>
			<td><form:input path="applyGisu" readonly="true" size="10"/>&nbsp;기</td>
		</tr>
		
		<tr>
			<!-- 이름 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.name" /></td>
			<td><form:input path="applyUserName" readonly="true"/></td>
		</tr>
		
		<tr>
			<!-- 성별 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.gender" /></td>
			<td><form:input path="applyUserGender" readonly="true" size="6"/></td>
		</tr>
		
		<tr>
			<!-- 생년월일 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.birth" /></td>
			<td><form:input path="applyUserYear" readonly="true" size="4"/>.<form:input 
			path="applyUserMonth" readonly="true" size="4"/>.<form:input 
			path="applyUserDay" readonly="true" size="4"/></td>
		</tr>

		<tr>
			<!-- 핸드폰번호 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.phone" /></td>
			<td><form:input path="applyUserPnum1" readonly="true" size="4"/>&nbsp;-&nbsp;<form:input 
			path="applyUserPnum2" readonly="true" size="4"/>&nbsp;-&nbsp;<form:input 
			path="applyUserPnum3" readonly="true" size="4"/></td>
		</tr>

		<tr>
			<!-- 이메일 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.email" /></td>
			<td><form:input path="applyUserEmailid" readonly="true"/><form:input 
			path="applyUserEmailsite" readonly="true"/></td>
		</tr>

		<tr>
			<!-- 주소 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.address" /></td>
			<td><form:input path="applyUserPostcode"
				readonly="true" /><br> <form:input type="text"
				path="applyUserAddress1" readonly="true"/><br> <form:input
				path="applyUserAddress2" readonly="true" /></td>
		</tr>
		
		<tr>
			<!-- 수강신청 날짜 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.apply.registrationdate" /></td>
			<td><form:input type="date" path="applyRegistrationDate" readonly="true"/></td>
		</tr>
		
		<tr>
			<!-- 무대경험 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.apply.stageexperience" /></td>
			<td>
			<form:input path="applyStageExperience" readonly="true" size="2"/>
			
			<!-- 무대경험 있음 -->
			<form:input path="applyAboutSE" readonly="true"/></td>
		</tr>
		
		<tr>
			<!-- 자기소개 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.apply.selfintroduction" /></td>
			<td><form:input path="applySelfIntroduction" readonly="true"/></td>
		</tr>
		
		<tr>
			<!-- 첨부파일 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.file" /></td>
			<td><img src = "display?applyNum=${adminApply.applyNum}" width="150" height="150" ></td>
		</tr>
		
	</table>
</form:form>

<!-- 목록 버튼 -->
<%-- <div>
	<button type="submit" id=btnList>
		<spring:message code="action.list" />
	</button>
</div> --%>

<script type="text/javascript">
	$(document).ready(function() {

		//목록 버튼
		$("#btnList").on("click", function() {
				self.location = "list";
		});

	});
</script>