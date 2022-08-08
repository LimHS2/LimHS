<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<head>
<title>ME 로그인</title>
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

<hr />
<br />
<div class="container">
	<form method="post" action="/login" class="needs-validation" novalidate>
		<div class="form-group">
			<input type="text" class="form-control" id="uname" placeholder="아이디"
				name="username" required style="width:250px;">
			<div class="valid-feedback"></div>
			<div align="left" class="invalid-feedback">아이디를 입력해주세요.</div>
		</div>
		<div class="form-group">
			<input type="password" class="form-control" id="pwd"
				placeholder="비밀번호" name="password" required style="width:250px;">
			<div class="valid-feedback"></div>
			<div align="left" class="invalid-feedback">비밀번호를 입력해주세요.</div>
		</div>
		<div align="left" style="margin-left: 430px;">
			<input type="checkbox" name="remember-me"> 로그인유지
		</div>
		<br>
		<button type="submit" class="btn btn-danger btn-block btn-lg" style="width:250px;">로그인</button>
		<sec:csrfInput />
	</form>
	<br><a href="../join/register"><button style="width:250px; height: 50px;"
			class="btn btn-outline-danger btn-block">회원가입</button></a>
</div>

<script>
	(function() {
		'use strict';
		window.addEventListener('load', function() {

			var forms = document.getElementsByClassName('needs-validation');

			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();
</script>
