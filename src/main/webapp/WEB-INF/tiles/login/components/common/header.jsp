<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- <div align="center">
	<div class="logo">
		<a href="/" style="text-decoration: none; color: black;"><strong>ME</strong></a>
	</div>
</div> -->

	<div class="logo">
				<a href="/"><img
			src="https://blog.kakaocdn.net/dn/uh6M7/btrISN4htaV/nLcjmfXPB9uhduaK1ZJcKK/img.png"
			width="145" height="90"></a>
	</div>