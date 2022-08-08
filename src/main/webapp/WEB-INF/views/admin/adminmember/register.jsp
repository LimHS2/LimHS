<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet" href="style.css" />
<link href="${path}/resource/css/adminNoticeTable.css" rel="stylesheet" href="style.css" />

<!-- 제목 -->
<br>
<div>
	<h3 style="line-height: 2.0;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 등록
	</h3>
	<hr class="testhr1">
	<br>
</div>

<!-- 테이블 -->
<form:form modelAttribute="adminMember" action="register"
	enctype="multipart/form-data">
	<table style="width: 900px;">

		<!-- 회원번호 -->
		<form:hidden path="userNo" />

		<tr>
			<!-- 회원등급 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.level" /></td>
			<td><form:select path="userLevel">
					<option value="일반" selected="selected">일반</option>
					<option value="배우">배우</option>
					<option value="특별">특별</option>
				</form:select></td>
		</tr>

		<tr>
			<!-- 아이디 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.id" /></td>
			<td><form:input path="userId" /></td>
		</tr>

		<tr>
			<!-- 비밀번호 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.pw" /></td>
			<td><form:input path="userPw" /></td>
		</tr>

		<tr>
			<!-- 이름 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.name" /></td>
			<td><form:input path="userName" /></td>
		</tr>

		<tr>
			<!-- 성별 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.gender" /></td>
			<td><form:select path="userGender">
					<option value="woman" selected="selected">여자</option>
					<option value="man">남자</option>
				</form:select></td>
		</tr>

		<tr>
			<!-- 생년월일 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.birth" /></td>
			<td><form:input path="userYear" min="1900"
					value="2022" size="4" />
					<form:select path="userMonth">
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
				<form:select path="userDay">
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
			<td><form:input path="userPnum1" value="010"
					size="4" />&nbsp;-&nbsp;<form:input path="userPnum2" value="1234"
					size="4" />&nbsp;-&nbsp;<form:input path="userPnum3" value="5678"
					size="4" /></td>
		</tr>

		<tr>
			<!-- 이메일 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.email" /></td>
			<td><form:input path="userEmailid" />&nbsp;@&nbsp;<form:select
					path="userEmailsite">
					<option value="@naver.com" selected="selected">naver.com</option>
					<option value="@gmail.com">gmail.com</option>
				</form:select></td>
		</tr>

		<tr>
			<!-- 주소 -->
			<td style="text-align:center; background-color: #ececec;"><spring:message code="admin.user.address" /></td>
			<td><input type="number" name="userPostcode"
				placeholder="우편번호" /><br> <input type="text"
				name="userAddress1" placeholder="주소 입력" /><br> <input
				type="text" name="userAddress2" placeholder="상세주소 입력" /></td>
		</tr>

		<tr>
			<!-- 광고동의여부 -->
			<td style="text-align:center; background-color: #ececec;">
			<spring:message code="admin.user.agreead" /></td>
			<td>
			<input type ="radio" name="agreeAd" value="N" checked="checked" />비동의 
			<input type ="radio" name="agreeAd" value="Y" />동의
			</td>
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

<!-- 취소 / 등록 스크립트 -->
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("#adminMember");

		//취소 버튼
		$("#btnCancel").on("click", function() {
			if (confirm("작성중인 내용을 취소하고 공연관리로 이동할까요?") == true) {//확인
				self.location = "list";
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

	});
</script>