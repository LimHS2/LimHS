<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet" href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet" href="style.css" />

<!-- 수정부분 헤더 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
		<spring:message code="classgroup.header.modify" />
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 수정 테이블 -->
<form:form modelAttribute="classGroup" action="modify">
<form:hidden path="classNum" />

	<table style="width: 1000px;">

		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classTitle" /></td>
			<td><form:input path="classRegistTitle" style="width:850px;" /></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.className" /></td>
			<td><form:select name="className" path="className">
					<option value="레베카" selected="selected">레베카</option>
					<option value="레미제라블">레미제라블</option>
					<option value="맘마미아">맘마미아</option>
				</form:select></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classgisu" /></td>
			<td><form:input path="classGisu" /></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classPeriod" /></td>
			<td><form:select name="classPeriod" path="classPeriod">
					<option value="4주" selected="selected">4주</option>
					<option value="16주">16주</option>
				</form:select></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classTime" /></td>
			<td><form:select name="classTime" path="classTime">
					<option value="월요일 19시" selected="selected">월요일 19시</option>
					<option value="목요일 19시">목요일 19시</option>
					<option value="토요일 15시">토요일 15시</option>
				</form:select></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classStudent" /></td>
			<td><form:input path="classStudent" /></td>
		</tr>

		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classRecruitment" /></td>
			<td><form:select name="classRegistRecruitment"
					path="classRegistRecruitment">
					<option value="모집중" selected="selected">모집중</option>
					<option value="모집마감">모집마감</option>
				</form:select></td>
		</tr>

		<tr style="height: 300px;">
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classContent" /></td>
			<td><form:textarea path="classContent" style="height: 300px; width:850px;" /></td>
		</tr>
	</table>
</form:form>

<!-- 수정 / 목록 버튼 -->
<br>
<div style="text-align: center;">
	<button type="submit" id="btnModify">
		<spring:message code="action.modify" />
	</button>

	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>

<script>
	$(document).ready(function() {
		
		var formObj = $("#classGroup");
		
		$("#btnModify").on("click", function() {
		
		var cancellation = confirm("작성하신 내용으로 수정하시겠습니까?");
		
		if(cancellation){
			
				formObj.submit();
				
		}else{
			
		}

		});

		$("#btnList").on("click", function() {
			
		var cancellation = confirm("수정을 중단하고 수업목록 페이지로 이동하시겠습니까?");
			
			if(cancellation){
			    
			    self.location = "list";
			    
			}else{
				
			}
		});

	});
</script>