<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
.logo {
	font-size: 50px;
	text-align: center;
}

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
	font-size: 5px;
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
	font-size: 10px;
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
		<a href="/" style="text-decoration: none; color: black;"><strong>ME</strong></a>
	</div>
	<table>
		<div class="detailmenu">
			<ul>
				<sec:authorize access="!isAuthenticated()">
					<li class="detailbtn" style="float: right;"><a href="/join/register">회원가입</a></li>
					<li class="detailbtn" style="float: right;"><a href="/auth/login">로그인</a></li>
					
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">				
					<li class="detailbtn"><a href="/">마이페이지</a><a href="/admin">관리자페이지</a></li>
					<li class="detailbtn"><sec:authentication
							property="principal.username" /> 님 <a href="/auth/logout">로그아웃</a></li>					
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
						<a href="/">배우지원</a>
					</div></li>
				<li class="dropdown"><a class="dropbtn"><strong>공연</strong></a>
					<div class="dropdown-content">
						<a href="/show/list">공연소개</a> <a href="/">공연예매</a>
					</div></li>
				<li class="dropdown"><a class="dropbtn"><strong>고객센터</strong></a>
					<div class="dropdown-content">
						<a href="/">공지사항</a> <a href="/">문의게시판</a>
					</div></li>
			</ul>
		</div>
	</table>

</div>

