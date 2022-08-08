<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
<title>ME 회원가입 성공</title>
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
</head>
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
	font-size: 1px;
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
	font-size: 1px;
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
</div>
<hr />
<br />
<div class="container" align="center">
	<div>
		<h2>회원가입이 완료되었습니다.</h2>
		<br/>
		<a href="/auth/login"><button
				class="btn btn-danger btn-block btn-lg">로그인하기</button></a>
	</div>
</div>