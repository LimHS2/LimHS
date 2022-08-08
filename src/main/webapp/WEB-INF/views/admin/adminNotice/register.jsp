<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 보안 태그 라이브러리 -->
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet" href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet" href="style.css" />

<!-- 공지사항 등록 헤더 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
		<spring:message code="adminNotice.header.register" />
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 등록 테이블 -->
<form:form modelAttribute="adminNotice" action="register"
	enctype="multipart/form-data">
	<table style="width: 900px;">
		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="adminNotice.title" /></td>
			<td><form:input path="noticeTitle" style="width:800px;" /></td>
		</tr>
		<tr style="height: 400px;">
			<td style="text-align:center; background-color: #ececec;"><spring:message code="adminNotice.content"  /></td>
			<td><form:textarea path="noticeContent" style="height: 400px; width:800px;" /></td>
		</tr>
		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="pds.itemFile" /></td>
			<td><input type="file" id="inputFile">
				<div class="uploadedList"></div></td>
		</tr>
		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="adminNotice.writer" /></td>
			<td><form:input value="관리자" path="noticeWriter" readonly="true"  /></td>
		</tr>
	</table>
</form:form>

<!-- 등록 / 목록 버튼 -->
<br>
<div style="text-align: center;">
	<!-- <sec:authorize access="hasRole('ROLE_ADMIN')"> -->
	<button type="submit" id="btnRegister">
		<spring:message code="action.register" />
	</button>
	<!-- </sec:authorize> -->

	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>

<!-- 첨부파일 추가하면서 만든 스크립트 / 다운 기능 추가 -->
<script>
$(document).ready(function() {
	
	var formObj = $("#adminNotice");

	$("#btnRegister").on("click", function() {
		formObj.submit();
	});

	$("#btnList").on("click", function() {
		self.location = "list";
	});
	
	$(".uploadedList").on("click", "span", function(event){
		$(this).parent("div").remove();
	});
		
	function getOriginalName(fileName){
		
		var idx = fileName.indexOf("_") + 1 ;
		
		return fileName.substr(idx);
	}

	$("#adminNotice").submit(function(event){
		
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		
		$(".uploadedList a").each(function(index){	
			 var value = $(this).attr("href");
			 
			 console.log("value = " + value);
			 
			 value = value.substr(27);
		
			 str += "<input type='hidden' name='files["+index+"]' value='"+ value +"'> ";
		});
		
		console.log("str = " + str);
		
		that.append(str);

		that.get(0).submit();
	});
	
	$("#inputFile").on("change", function(event){
		var files = event.target.files;
		var file = files[0];

		console.log(file);
		
		var formData = new FormData();
		formData.append("file", file);
		
		$.ajax({
		  url: "/admin/adminNotice/uploadAjax?${_csrf.parameterName}=${_csrf.token}",
		  data: formData,
		  dataType:"text",
		  processData: false,
		  contentType: false,
		  type: "POST",
		  success: function(data){
			  
			  console.log(data);
			  
			  var str = "<div><a href='/admin/adminNotice/downloadFile?fullName="+data+"'>" 
			  + getOriginalName(data)+"</a>" +" <span>X</span></div>";
			  
			  $(".uploadedList").append(str);
		  }
		});
	});
		
});
</script>