<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<head>
<title>ME 로그아웃</title>
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
<div class="container">
	<hr />
	<br />
	<h1>로그아웃 하시겠습니까?</h1>
	<br />
	<div class="form-group">
		<form action="/auth/logout" method="post">
			<sec:csrfInput />
			<button class="btn btn-danger btn-block" style="width:200px;">예</button>
		</form>
	</div>
	<div class="form-group">
		<a href="/"><button class="btn btn-outline-danger btn-block" style="width:200px;">아니오</button></a>
	</div>
</div>