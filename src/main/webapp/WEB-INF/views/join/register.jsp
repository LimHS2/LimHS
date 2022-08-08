<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
﻿
<title>ME 회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('userPostcode').value = data.zonecode;
				document.getElementById("userAddress1").value = roadAddr;
			}
		}).open();
	}
</script>

<!-- 비밀번호 일치 확인 -->
<script type="text/javascript">
	function passwordCheck() {

		var pw1 = document.getElementById("userPw").value;
		var pw2 = document.getElementById("userPwCheck").value;

		if (pw1 == "" || pw2 == "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		}

		if (pw1 != pw2) {
			alert("비밀번호가 일치하지 않습니다.");
			false;

		} else {
			alert("비밀번호 확인이 완료되었습니다.")
			name.focus();
		}
	}
</script>
<style type="text/css">
#box {
	width: 700px;
	height: 250px;
	border: 1px solid lightgrey;
	margin: 10px;
}

#agree {
	width: 700px
}

.container {
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	width: 700px;
	max-width: 100%;
}

.find-postcode {
	width: 130px
}

.header {
	border-bottom: 1px solid #f0f0f0;
	background-color: #f7f7f7;
	padding: 20px 40px;
}

.header h2 {
	margin: 0;
}

.form {
	padding: 30px 40px;
}
</style>
<hr />
<br />
<div class="container">
	<div class="header">
		<h2>회원가입</h2>
	</div>
	<br />
	<form:form modelAttribute="member" action="register">
		<div class="form-group">
			<div class="row">
				<div class="col">
					<input type="text" class="form-control" name="userId"
						placeholder="아이디" required>
				</div>
				<div class="col">
					<input type="button" id="idConfirmBtn" value="ID 중복확인"
						class="find-postcode btn btn-outline-danger form-control">
				</div>

			</div>
		</div>
		<div class="form-group">
			<div class="row">
				<div>
					<div class="col">
						<input type="password" class="form-control" name="userPw"
							id="userPw" placeholder="비밀번호" required />
					</div>
				</div>
				<div class="col">
					<input type="password" class="form-control" name="userPwCheck"
						id="userPwCheck" placeholder="비밀번호 확인" required />
				</div>
				<div class="col">
					<input type="button" value="비밀번호 확인" onclick="passwordCheck()"
						class="find-postcode btn btn-outline-danger form-control">
				</div>
			</div>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="userName"
				placeholder="이름" required />
		</div>
		<div class="check_font" id="name_check"></div>
		<div class="form-group">
			<select class="form-control" name="userGender" name="userGender"
				required>
				<option value="">성별</option>
				<option value="man">남</option>
				<option value="woman">여</option>
			</select>
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col">
					<select name="userYear" class="form-control" required>
						<option value="">년</option>
						<c:forEach var="i" begin="1900" end="2022">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col">
					<select name="userMonth" class="form-control" required>
						<option value="">월</option>
						<c:forEach var="i" begin="1" end="12">
							<c:choose>
								<c:when test="${i lt 10 }">
									<option value="0${i}">0${i}</option>
								</c:when>
								<c:otherwise>
									<option value="${i}">${i}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				<div class="col">
					<select name="userDay" class="form-control" required>
						<option value="">일</option>
						<c:forEach var="i" begin="1" end="31">
							<c:choose>
								<c:when test="${i lt 10 }">
									<option value="0${i}">0${i}</option>
								</c:when>
								<c:otherwise>
									<option value="${i}">${i}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col">
					<select name="userPnum1" class="form-control" required>
						<option value="">휴대폰</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
				</div>
				<div class="col">
					<input type="text" name="userPnum2" placeholder="4자리"
						class="form-control" required />
				</div>
				<div class="col">
					<input type="text" name="userPnum3" placeholder="4자리"
						class="form-control" required />
				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="row">
				<div class="col">
					<input type="text" name="userEmailId" placeholder="이메일 아이디"
						class="form-control" required />
				</div>
				<div class="col">
					<select name="userEmailSite" class="form-control" required>
						<option value="">이메일주소</option>
						<option value="@naver.com">naver.com</option>
						<option value="@daum.net">daum.net</option>
						<option value="@hotmail.com">hotmail.com</option>
						<option value="@nate.com">nate.com</option>
						<option value="@yahoo.co.kr">yahoo.co.kr</option>
						<option value="@paran.com">paran.com</option>
						<option value="@empas.com">empas.com</option>
						<option value="@dreamwiz.com">dreamwiz.com</option>
						<option value="@freechal.com">freechal.com</option>
						<option value="@lycos.co.kr">lycos.co.kr</option>
						<option value="@korea.com">korea.com</option>
						<option value="@gmail.com">gmail.com</option>
						<option value="@hanmir.com">hanmir.com</option>
					</select>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col">
					<input type="text" id="userPostcode" name="userPostcode"
						placeholder="우편번호" class="form-control" readonly required />
				</div>
				<div class="col">
					<input type="text" id="userAddress1" name="userAddress1"
						placeholder="도로명주소" class="form-control" readonly required />
				</div>
				<div class="col">
					<input type="button"
						class="find-postcode btn btn-outline-danger form-control"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				</div>
			</div>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="userAddress2"
				placeholder="상세주소" required />
		</div>
		<hr />
		<div id=box style="overflow: auto" align=left>
			<h2>광고 수신 동의 여부</h2>
			<pre>■ 수집하는 개인정보 항목
회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
- 수집항목 : 이름 , 생년월일 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록
- 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식

■ 개인정보의 수집 및 이용목적
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
- 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송
- 회원 관리
 · 회원제 서비스 이용에 따른 본인확인, 개인 식별, 연령확인, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 고지사항 전달
- 마케팅 및 광고에 활용
 · 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계

■ 개인정보의 보유 및 이용기간 
원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.
- 보존 항목 : 결제기록 
- 보존 근거 : 계약 또는 청약철회 등에 관한 기록 
- 보존 기간 : 3년 
- 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률) 
- 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률) 
- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)

■ 개인정보의 파기절차 및 방법 
회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.
- 파기절차
 · 회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 
 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. 
 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.
- 파기방법
 · 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

■ 개인정보 제공 
회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
- 이용자들이 사전에 동의한 경우
- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우

■ 개인정보 수집항목 및 목적, 보유기간
목 적	항 목	보유기간
이용자 식별 및 본인확인	성명, 아이디, 비밀번호	회원 탈퇴시까지
배송업무를 위한 확인	주소
민원해결 및 고충처리	연락처(이메일, 휴대전화번호)
만14세 미만 아동인지 확인	법정 생년월일

■ 이용자 및 법정대리인의 권리와 그 행사방법 
이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다. 
이용자 혹은 만 14세 미만 아동의 개인정보 조회,수정을 위해서는 "개인정보변경"(또는 "회원정보수정" 등)을 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭 하여 본인확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 
혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다. 귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까 지 당해 개인정보를 이용 또는 제공하지 않습니다. 
또한 잘못된 개인정보를 제3자 에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다. 
ME는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 "ME가 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.

■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항 
회사는 귀하의 정보를 수시로 저장하고 찾아내는 "쿠키(cookie)" 등을 운용합니다. 쿠키란 ME의 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. 
회사은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다.
- 쿠키 등 사용 목적
 · 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공
- 쿠키 설정 거부 방법
 · 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.
단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다. 

■ 개인정보에 관한 민원서비스 
회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다. 

귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다. 
기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.

1.정보보호마크인증위원회 (http://www.eprivacy.or.kr)
2.경찰청 사이버안전국 (http://cyberbureau.police.go.kr)</pre>
		</div>
		<div id=agree align=right>
			<label><input type="radio" name="agreeAd" value="Y"
				name="adagree" checked="checked"> 동의합니다.(선택) </label> <label><input
				type="radio" name="agreeAd" value="N" name="adagree" /> 동의하지 않습니다.</label>
		</div>
		<div id=box style="overflow: auto" align=left>
			<h2>개인 정보 수집 동의</h2>
			<pre>■ 수집하는 개인정보 항목
회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
- 수집항목 : 이름 , 생년월일 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록
- 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식

■ 개인정보의 수집 및 이용목적
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
- 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송
- 회원 관리
 · 회원제 서비스 이용에 따른 본인확인, 개인 식별, 연령확인, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 고지사항 전달
- 마케팅 및 광고에 활용
 · 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계

■ 개인정보의 보유 및 이용기간 
원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.
- 보존 항목 : 결제기록 
- 보존 근거 : 계약 또는 청약철회 등에 관한 기록 
- 보존 기간 : 3년 
- 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률) 
- 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률) 
- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)

■ 개인정보의 파기절차 및 방법 
회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.
- 파기절차
 · 회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 
 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. 
 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.
- 파기방법
 · 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

■ 개인정보 제공 
회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
- 이용자들이 사전에 동의한 경우
- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우

■ 개인정보 수집항목 및 목적, 보유기간
목 적	항 목	보유기간
이용자 식별 및 본인확인	성명, 아이디, 비밀번호	회원 탈퇴시까지
배송업무를 위한 확인	주소
민원해결 및 고충처리	연락처(이메일, 휴대전화번호)
만14세 미만 아동인지 확인	법정 생년월일

■ 이용자 및 법정대리인의 권리와 그 행사방법 
이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다. 
이용자 혹은 만 14세 미만 아동의 개인정보 조회,수정을 위해서는 "개인정보변경"(또는 "회원정보수정" 등)을 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭 하여 본인확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 
혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다. 귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까 지 당해 개인정보를 이용 또는 제공하지 않습니다. 
또한 잘못된 개인정보를 제3자 에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다. 
ME는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 "ME가 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.

■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항 
회사는 귀하의 정보를 수시로 저장하고 찾아내는 "쿠키(cookie)" 등을 운용합니다. 쿠키란 ME의 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. 
회사은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다.
- 쿠키 등 사용 목적
 · 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공
- 쿠키 설정 거부 방법
 · 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.
단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다. 

■ 개인정보에 관한 민원서비스 
회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다. 

귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다. 
기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.

1.정보보호마크인증위원회 (http://www.eprivacy.or.kr)
2.경찰청 사이버안전국 (http://cyberbureau.police.go.kr)</pre>
		</div>
		<div id=agree align=right>
			<label><input type=radio name=infoagree checked="checked">
				동의합니다.(<font color=red>필수</font>) </label> <label><input type=radio
				name=infoagree disabled> 동의하지 않습니다.</label>
		</div>
		<hr />
		<div class="form-group">
			<button class="btn btn-danger form-control" type="submit">가입하기</button>
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col">
					<input type=reset class="btn btn-outline-danger form-control"
						value="다시입력">
				</div>
				<div class="col">
					<input type=reset value="돌아가기"
						class="btn btn-outline-danger form-control"
						onclick="history.back()">
				</div>
			</div>
		</div>
	</form:form>
</div>

