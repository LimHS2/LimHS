<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet"
	href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet"
	href="style.css" />

<!-- 사용자 수업 -->
<div>
	<h3 style="line-height: 2.0;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수업 상세보기
	</h3>
	<hr class="testhr1">
	<br>
</div>

<form:form modelAttribute="userClassGroup">
<form:hidden path="classNum" />

	<table style="width: 1000px;">

<%-- 		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classTitle" /></td>
			<td><form:input path="classRegistTitle"  readonly="true" style="width: 400px;"/></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;">수업명</td>
			<td><form:input path="className" readonly="true" style="width: 400px;"/></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;">수업기간</td>
			<td><form:input path="classPeriod" readonly="true" style="width: 400px;"/></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;">모집인원</td>
			<td><form:input path="classStudent" readonly="true" style="width: 400px;"/></td>
		</tr> --%>
		
		
		
		
		
		
		
		
		
		
		
		
		
		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classTitle" /></td>
			<td><form:input path="classRegistTitle" readonly="true" style="width:850px;" /></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.className" /></td>
			<td><form:input path="className" readonly="true" /></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classgisu" /></td>
			<td><form:input path="classGisu" readonly="true" /></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classPeriod" /></td>
			<td><form:input path="classPeriod" readonly="true" /></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classTime" /></td>
			<td><form:input path="classTime" readonly="true" /></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classRecruitment" /></td>
			<td><form:input path="classRegistRecruitment" readonly="true" /></td>
		</tr>

		<tr style="height: 300px;">
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classContent" /></td>
			<td><form:textarea path="classContent" readonly="true" style="height: 300px; width:850px;" /></td>
		</tr>
		
		
		
		
		
		
		
		
		
		
		

	</table>
</form:form>

<br>

<!-- 지원하기 버튼 -->
<div style="text-align: center;">
	<button type="submit" id=btnApply>
		지원
	</button>

</div>

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