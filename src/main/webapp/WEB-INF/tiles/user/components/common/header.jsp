<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
	<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet"
	href="style.css" />
	
<style>
.detailmenu {
	overflow: hidden;
	background-color: "white";
	border-top: solid 1px #e7e7e7;
	border-bottom: solid 1px #e7e7e7;
	padding: 0;
	text-align: right;
}

.detailmenu>ul>li {
	list-style-type: none;
}

.navi {
	list-style-type: none;
	overflow: hidden;
	background-color: #e7e7e7;
	border-top: solid 1px #e7e7e7;
	border-bottom: solid 1px #e7e7e7;
	padding: 0;
	margin: 0;
}

li a, .dropbtn {
	display: inline-block;
	color: black;
	text-align: center;
	padding: 10px 10px;
	text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
	background-color: "white";
}

li.dropdown {
	display: inline-block
}

li a.a:active, a.active:hover {
	background-color: "white";
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	opacity: 0.8;
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 10px 10px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
<div align="center">
	<div class="logo">
				<a href="/"><img
			src="https://blog.kakaocdn.net/dn/uh6M7/btrISN4htaV/nLcjmfXPB9uhduaK1ZJcKK/img.png"
			width="145" height="90"></a>
	</div>
	<table>
		<div class="detailmenu">
			<ul>
				<sec:authorize access="!isAuthenticated()">
					<li class="detailbtn" style="float: right;"><a
						href="/join/register">회원가입</a></li>
					<li class="detailbtn" style="float: right;"><a
						href="/auth/login">로그인</a></li>

				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="detailbtn"><sec:authentication
							property="principal.username" /> 님 안녕하세요 <a href="/auth/logout">로그아웃</a></li>
				</sec:authorize>
			</ul>
		</div>
		<div class="navi">
			<ul>
				<li class="dropdown"><a class="dropbtn"><strong>ME소개</strong></a>
					<div class="dropdown-content">
						<a href="/troupInfo">극단소개</a> <a href="/greeting">CEO인사말</a>
					</div></li>
				<li class="dropdown"><a class="dropbtn"><strong>모집공고</strong></a>
					<div class="dropdown-content">
						<a href="/userclassgroup/list">배우지원</a>
					</div></li>
				<li class="dropdown"><a class="dropbtn"><strong>공연</strong></a>
					<div class="dropdown-content">
						<a href="/show/list">공연소개</a>
					</div></li>
				<li class="dropdown"><a class="dropbtn"><strong>고객센터</strong></a>
					<div class="dropdown-content">
						<a href="/userNotice/list">공지사항</a>
					</div></li>
			</ul>
		</div>
	</table>

</div>
