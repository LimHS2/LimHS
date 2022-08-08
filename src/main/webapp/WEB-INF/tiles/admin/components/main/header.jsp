<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS 링크 -->
<link href="${path}/resource/css/button.css" rel="stylesheet"
	href="style.css" />

<a href="/" style="float: left;"> <img
	src="https://blog.kakaocdn.net/dn/qQE0B/btrIO3zYWzz/JuGbqZ2DI8IyMLf74s3K31/img.png"
	width="130" height="80"></a>

<div style="margin-left: 1570px; margin-top: 60px;">
	<sec:authorize access="isAuthenticated()">
		<li class="detailbtn" id="jb-white">
			<h3 id="jb-white">
				<sec:authentication property="principal.username" />
			</h3> &nbsp;님 안녕하세요.&nbsp;
		</li>
	</sec:authorize>
</div>
<div style="float: left; margin-top: -31px; margin-left: 1750px;">
	<button type="button" class="buttonLogo"
		onclick="location.href='/auth/logout' ">로그아웃</button>
</div>

<style>
.logo {
	font-size: 60px;
	text-align: center;
}

#jb-white {
	color: white;
	float: left;
}
</style>