<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet"
	href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet"
	href="style.css" />

<!-- 지원 -->
<div>
	<h3 style="line-height: 2.0;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수강 신청 등록
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 수강 신청 등록 테이블 -->
<form:form modelAttribute="userApply" action="register" enctype="multipart/form-data">
	<table style="width: 950px;">
		<!-- 지원번호 -->
		<form:hidden path="applyNum" />
		
		<tr>
			<!-- 회원번호 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.num" /></td>
			<td><input name="applyUserNo" placeholder="회원번호 ex)62" /></td>
		</tr>
		
		<tr>
			<!-- 수업번호 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.classNum" /></td>
			<td><input name="applyClassNum" placeholder="수업번호 ex)21" /></td>
		</tr>
		
		<tr>
			<!-- 수업명 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="classgroup.className" /></td>
			<td><form:select path="applyClassName" style="height: 30px; width:100px;">
					<option value="레베카" selected="selected">레베카</option>
					<option value="레미제라블">레미제라블</option>
					<option value="맘마미아">맘마미아</option>
				</form:select></td>
		</tr>
		
		<tr>
			<!-- 기수 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.apply.gisu" /></td>
			<td><input name="applyGisu" placeholder="수업기수 ex)03" size="17"/>&nbsp;기</td>
		</tr>
		
		<!-- 수업기간 -->
		<form:hidden path="applyClassPeriod" value="수업기간"/>
		
		<!-- 모집현황 -->
		<form:hidden path="applyClassRegistRecruitment" value="모집중"/>
		
		<tr>
			<!-- 이름 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.name" /></td>
			<td><input name="applyUserName" /></td>
		</tr>
		
		<tr>
			<!-- 성별 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.gender" /></td>
			<td><form:select path="applyUserGender" style="height: 30px; width:100px;">
					<option value="여" selected="selected">여자</option>
					<option value="남">남자</option>
				</form:select></td>
		</tr>
		
		<tr>
			<!-- 생년월일 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.birth" /></td>
			<td><form:input path="applyUserYear" min="1900"
					value="2022" size="4" />
					<form:select path="applyUserMonth" style="height: 30px; width:50px;">
					<option value="01" selected="selected">1월</option>
					<option value="02">2월</option>
					<option value="03">3월</option>
					<option value="04">4월</option>
					<option value="05">5월</option>
					<option value="06">6월</option>
					<option value="07">7월</option>
					<option value="08">8월</option>
					<option value="09">9월</option>
					<option value="10">10월</option>
					<option value="11">11월</option>
					<option value="12">12월</option>
				</form:select>
				<form:select path="applyUserDay" style="height: 30px; width:50px;">
					<option value="01" selected="selected">01일</option>
					<option value="02">02일</option>
					<option value="03">03일</option>
					<option value="04">04일</option>
					<option value="05">05일</option>
					<option value="06">06일</option>
					<option value="07">07일</option>
					<option value="08">08일</option>
					<option value="09">09일</option>
					<option value="10">10일</option>
					<option value="11">11일</option>
					<option value="12">12일</option>
					<option value="13">13일</option>
					<option value="14">14일</option>
					<option value="15">15일</option>
					<option value="16">16일</option>
					<option value="17">17일</option>
					<option value="18">18일</option>
					<option value="19">19일</option>
					<option value="20">20일</option>
					<option value="21">21일</option>
					<option value="22">22일</option>
					<option value="23">23일</option>
					<option value="24">24일</option>
					<option value="25">25일</option>
					<option value="26">26일</option>
					<option value="27">27일</option>
					<option value="28">28일</option>
					<option value="29">29일</option>
					<option value="30">30일</option>
					<option value="31">31일</option>
				</form:select></td>
		</tr>

		<tr>
			<!-- 핸드폰번호 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.phone" /></td>
			<td><form:input path="applyUserPnum1" value="010"
					size="4" />&nbsp;-&nbsp;<form:input path="applyUserPnum2" value="1234"
					size="4" />&nbsp;-&nbsp;<form:input path="applyUserPnum3" value="5678"
					size="4" /></td>
		</tr>

		<tr>
			<!-- 이메일 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.email" /></td>
			<td><form:input path="applyUserEmailid" />&nbsp;@&nbsp;<form:select
					path="applyUserEmailsite" style="height: 30px; width:100px;">
					<option value="@naver.com" selected="selected">naver.com</option>
					<option value="@gmail.com">gmail.com</option>
				</form:select></td>
		</tr>

		<tr>
			<!-- 주소 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.address" /></td>
			<td><input type="number" name="applyUserPostcode"
				placeholder="우편번호" /><br> <input type="text"
				name="applyUserAddress1" placeholder="주소 입력" /><br> <input
				type="text" name="applyUserAddress2" placeholder="상세주소 입력" /></td>
		</tr>
		
		<tr>
			<!-- 수강신청 날짜 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.apply.registrationdate" /></td>
			<td><form:input type="date" path="applyRegistrationDate" /></td>
		</tr>
		
		<!-- 환불신청 날짜 -->
		<form:hidden path="applyRefundRequestDate" value="1111-01-01"/>
		
		<!-- 수강현황 -->
		<form:hidden path="applyAttendanceStatus" value="수강중"/>
		
		<tr>
			<!-- 무대경험 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.apply.stageexperience" /></td>
			<td>
			<input type ="radio" name="applyStageExperience" value="Y" checked="checked" />유
			<input type ="radio" name="applyStageExperience" value="N" />무
			
			<!-- 무대경험 있음 -->
			<input type="text" name="applyAboutSE" placeholder="어디서"/></td>
		</tr>
		
		<tr style="height: 300px;">
			<!-- 자기소개 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.apply.selfintroduction" /></td>
			<td><form:textarea path="applySelfIntroduction" style="height: 300px; width:750px;" /></td>
		</tr>
		
		<tr>
			<!-- 첨부파일 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.show.file" /></td>
			<td>얼굴 식별 가능 사진&nbsp;<input type="file" name="applyFile"/></td>
		</tr>
		
	</table>
</form:form>

<!-- 취소, 등록 버튼 -->
<br>
<div style="text-align: center;">
	<button type="submit" id=btnCancel>
		<spring:message code="action.cancel" />
	</button>

	<button type="submit" id=btnRegister>
		<spring:message code="action.register" />
	</button>
</div>

<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("#userApply");

		//취소 버튼
		$("#btnCancel").on("click", function() {
			if (confirm("작성중인 내용을 취소합니까?") == true) {//확인
				location.href = "http://localhost:8080/userclassgroup/list";
			} else {//취소
				return false;
			}
		});

		//등록 버튼
		$("#btnRegister").on("click", function() {
			if (confirm("입력하신 정보로 등록하시겠습니까?") == true) {//확인
				formObj.submit();
			} else {//취소
				return false;
			}
		});
		
		// 무대경험 라디오버튼 클릭시 이벤트 발생
		//https://sseung-fire.tistory.com/24 참고
	    $("input:radio[name=applyStageExperience]").click(function(){
	 
	        if($("input[name=applyStageExperience]:checked").val() == "Y"){
	        	// radio 버튼의 value 값이 Y이라면 활성화
	        	$("input:text[name=applyAboutSE]").attr("disabled",false);
	            
	 
	        }else if($("input[name=applyStageExperience]:checked").val() == "N"){
	        	// radio 버튼의 value 값이 N이라면 비활성화
	        	$("input:text[name=applyAboutSE]").attr("disabled",true);
	            
	        }
	    });

	});
</script>