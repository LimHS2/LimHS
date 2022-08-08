<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet" href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet" href="style.css" />

<!-- 수업 등록 헤더 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
	<spring:message code="classgroup.header.read" />
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 상세 테이블 -->
<form:form modelAttribute="classGroup" action="register">
	<table style="width: 1000px;">
	<form:hidden path="classNum" />
	
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
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classStudent" /></td>
			<td><form:input path="classStudent" readonly="true" /></td>
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

<!-- 수정 / 삭제 / 목록 버튼 -->
<br>
<div style="text-align: center;">
	<button type="submit" id="btnEdit">
		<spring:message code="action.edit" />
	</button>
	<button type="submit" id="btnRemove">
		<spring:message code="action.remove" />
	</button>
	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>

<script>
	$(document).ready(function() {

		var formObj = $("#classGroup");

		$("#btnEdit").on("click", function() {
			var classNum = $("#classNum");
			var classNumVal = classNum.val();

			self.location = "modify?classNum=" + classNumVal;
		});

		$("#btnRemove").on("click", function() {
			
		var remove = confirm("등록하신 수업을 삭제하시겠습니까?");
			
			if(remove){
				
				formObj.attr("action", "/admin/classgroup/remove");
				formObj.submit();
			    
			}else{
				
			}
		});

		$("#btnList").on("click", function() {
			
		var cancellation = confirm("수업목록 페이지로 이동하시겠습니까?");
			
			if(cancellation){
			    
			    self.location = "list";
			    
			}else{
				
			}
		});

	});
</script>