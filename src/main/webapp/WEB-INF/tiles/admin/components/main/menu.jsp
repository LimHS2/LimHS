<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap')
	;

* {
	list-style: none;
	text-decoration: none;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Open Sans', sans-serif;
}

body {
	background: #f5f6fa;
}

/* 프로필 */
.wrapper .sidebar .profile {
	margin-bottom: 30px;
	text-align: center;
}

.wrapper .sidebar .profile img {
	display: block;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin: 0 auto;
}

.wrapper .sidebar .profile h3 {
	color: #ffffff;
	margin: 10px 0 5px;
}

.wrapper .sidebar .profile p {
	color: rgb(206, 240, 253);
	font-size: 14px;
}

/* 메뉴항목 */
.wrapper .sidebar ul li a {
	display: block;
	padding: 13px 30px;
	border-bottom: 1px solid #10558d;
	color: rgb(241, 237, 237);
	font-size: 16px;
	position: relative;
}

.wrapper .sidebar ul li a .icon {
	color: #dee4ec;
	width: 30px;
	display: inline-block;
}

/* 메뉴항목 효과 */
.wrapper .sidebar ul li a:hover, .wrapper .sidebar ul li a.active {
	color: #0c7db1;
	background: white;
	border-right: 2px solid rgb(5, 68, 104);
}

.wrapper .sidebar ul li a:hover .icon, .wrapper .sidebar ul li a.active .icon
	{
	color: #0c7db1;
}

.wrapper .sidebar ul li a:hover:before, .wrapper .sidebar ul li a.active:before
	{
	display: block;
}
</style>



<div class="wrapper">

	<!--Top menu -->
	<div class="sidebar">

		<!-- 		<div class="profile">
			<img src="./image/JUS.jpg" alt="이미지가 안보여">
			<h3>전우석 교수</h3>
			<p>관리자</p>
		</div> -->


		<ul>
			<li><a href="/admin" class="active"> <span class="icon"><i
						class="fas fa-home"></i></span> <span class="item">Home</span>
			</a></li>

			<li><a href="#"> <span class="icon"><i
						class="fas fa-desktop"></i></span> <span class="item">게시판 관리</span>
			</a></li>

			<li><a href="/admin/adminNotice/list"> <span class="icon"><i></i></span>
					<span class="item">·&nbsp;&nbsp;&nbsp;공지사항</span>
			</a></li>

			<li><a href="#"> <span class="icon"><i
						class="fas fa-user-friends"></i></span> <span class="item">공연관리</span>
			</a></li>

			<li><a href="/admin/adminshow/list"> <span class="icon"><i></i></span>
					<span class="item">·&nbsp;&nbsp;&nbsp;공연조회</span>
			</a></li>

			<li><a href="#"> <span class="icon"><i
						class="fas fa-tachometer-alt"></i></span> <span class="item">회원관리</span>
			</a></li>

			<li><a href="/admin/adminmember/list"> <span class="icon"><i></i></span> <span
					class="item">·&nbsp;&nbsp;&nbsp;회원 조회</span>
			</a></li>

			<li><a href="/admin/adminapply/list"> <span class="icon"><i></i></span> <span
					class="item">·&nbsp;&nbsp;&nbsp;수강신청 현황</span>
			</a></li>

			<li><a href="#"> <span class="icon"><i
						class="fas fa-database"></i></span> <span class="item">수업관리</span>
			</a></li>

			<li><a href="/admin/classgroup/list"> <span class="icon"><i></i></span>
					<span class="item">·&nbsp;&nbsp;&nbsp;수업등록</span>
			</a></li>

<!-- 			<li><a href="#"> <span class="icon"><i
						class="fas fa-chart-line"></i></span> <span class="item">통계</span>
			</a></li>

			<li><a href="#"> <span class="icon"><i></i></span> <span
					class="item">·&nbsp;&nbsp;&nbsp;수입조회</span>
			</a></li> -->

			<!-- 			<li><a href="#"> <span class="icon"><i
						class="fas fa-user-shield"></i></span> <span class="item">Admin</span>
			</a></li>
			<li><a href="#"> <span class="icon"><i
						class="fas fa-cog"></i></span> <span class="item">Settings</span>
			</a></li> -->

		</ul>
	</div>
</div>