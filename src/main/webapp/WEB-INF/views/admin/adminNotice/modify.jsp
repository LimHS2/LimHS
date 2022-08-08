<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 보안 태그 라이브러리 -->
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet" href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet" href="style.css" />

<!-- 수정부분 헤더 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
		<spring:message code="adminNotice.header.modify" />
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 수정 테이블 -->
<form:form modelAttribute="adminNotice" action="modify" enctype="multipart/form-data">
	<form:hidden path="noticeNum" />

	<!-- 현재 페이지 번호와 페이징 크기 그리고 검색유형, 검색어를 숨겨진 필드 요소를 사용하여 전달 -->
	<%-- <input type="hidden" name="page" value="${pgrq.page}">
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
	<input type="hidden" name="searchType" value="${pgrq.searchType}">
	<input type="hidden" name="keyword" value="${pgrq.keyword}"> --%>

	<table style="width: 900px;">
		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="adminNotice.title" /></td>
			<td><form:input path="noticeTitle" style="width:800px;" /></td>
		</tr>
		<tr style="height: 400px;">
			<td style="text-align:center; background-color: #ececec;"><spring:message code="adminNotice.content" /></td>
			<td><form:textarea path="noticeContent" style="height: 400px; width:800px;" /></td>
		</tr>
		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="pds.itemFile" /></td>
			<td><input type="file" id="inputFile">
				<div class="uploadedList"></div></td>
		</tr>
		<tr>
			<td style="text-align:center; background-color: #ececec;"><spring:message code="adminNotice.writer" /></td>
			<td><form:input path="noticeWriter" readonly="true" /></td>
		</tr>
	</table>
</form:form>

<!-- 수정 / 목록 버튼 -->
<br>
<div style="text-align: center;">
	<!-- <sec:authorize access="hasRole('ROLE_ADMIN')"> -->
	<button type="submit" id="btnModify">
		<spring:message code="action.modify" />
	</button>
	<!-- </sec:authorize> -->

	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>

<!-- 첨부파일 스크립트 -->
<script>
$(document).ready(function() {
	
	var formObj = $("#adminNotice");

	$("#btnModify").on("click", function() {
		formObj.submit();
	});

	$("#btnList").on("click", function() {
		self.location = "list";
	});
  
	$(".uploadedList").on("click", "span", function(event){
		$(this).parent("div").remove();
	});
		
	function getOriginalName(fileName){
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}
	
	var noticeNum = ${adminNotice.noticeNum};

	$.getJSON("/admin/adminNotice/getAttach/"+noticeNum,function(list){
		$(list).each(function(){
			
			console.log("data : " + this);
			
			var data = this;
			
			console.log("data : " + data);
			console.log("getOriginalName(data) : " + getOriginalName(data));
			
			var str = "<div><a href='/admin/adminNotice/download"+data+"'>" + getOriginalName(data)+"</a>"
				+ "<span>X</span></div>";
			  
			  $(".uploadedList").append(str);
		});
	});
	
	$("#adminNotice").submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList a").each(function(index){	
			 var value = $(this).attr("href");
			 value = value.substr(27);
		
			 str += "<input type='hidden' name='files[" + index + "]' value='" + value + "'> ";
		});
		
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
			  var str = "<div><a href='/admin/adminNotice/downloadFile?fullName=" + data + "'>" 
			  + getOriginalName(data) + "</a>" + "<span>X</span></div></div>";
			  
			  $(".uploadedList").append(str);
		  }
		});
	});
		
});
</script>