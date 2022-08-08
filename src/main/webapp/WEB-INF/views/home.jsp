<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.section input[id*="slide"] {
	display: none;
}

.section .slidewrap {
	max-width: 1200px;
	margin: 0 auto;
}

.section .slidelist {
	white-space: nowrap;
	font-size: 0;
	overflow: hidden;
	position: relative;
}

.section .slidelist>li {
	display: inline-block;
	vertical-align: middle;
	width: 100%;
	transition: all .5s;
}

.section .slidelist>li>a {
	display: block;
	position: relative;
}

.section .slidelist>li>a img {
	width: 100%;
}

.section .slidelist label {
	position: absolute;
	z-index: 10;
	top: 50%;
	transform: translateY(-50%);
	padding: 50px;
	cursor: pointer;
}

.section .slidelist .textbox {
	position: absolute;
	z-index: 1;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	line-height: 1.6;
	text-align: center;
}

.section .slidelist .textbox h3 {
	font-size: 36px;
	color: #fff;;
	transform: translateY(30px);
	transition: all .5s;
}

.section .slidelist .textbox p {
	font-size: 16px;
	color: #fff;
	opacity: 0;
	transform: translateY(30px);
	transition: all .5s;
}

/* input에 체크되면 슬라이드 효과 */
.section input[id="slide01"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(0%);
}

.section input[id="slide02"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-100%);
}

.section input[id="slide03"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-200%);
}

/* input에 체크되면 텍스트 효과 */
.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox h3
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .2s;
}

.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox p
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .4s;
}

.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox h3
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .2s;
}

.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox p
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .4s;
}

.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox h3
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .2s;
}

.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox p
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .4s;
}

/* 좌,우 슬라이드 버튼 */
.slide-control>div {
	display: none;
}

.section .left {
	left: 30px;
	background: url('./img/left.png') center center/100% no-repeat;
}

.section .right {
	right: 30px;
	background: url('./img/right.png') center center/100% no-repeat;
}

.section input[id="slide01"]:checked ~ .slidewrap .slide-control>div:nth-child(1)
	{
	display: block;
}

.section input[id="slide02"]:checked ~ .slidewrap .slide-control>div:nth-child(2)
	{
	display: block;
}

.section input[id="slide03"]:checked ~ .slidewrap .slide-control>div:nth-child(3)
	{
	display: block;
}

/* 페이징 */
.slide-pagelist {
	text-align: center;
	padding: 5px;
}

.slide-pagelist>li {
	display: inline-block;
	vertical-align: middle;
}

.slide-pagelist>li>label {
	display: block;
	padding: 5px 20px;
	border-radius: 30px;
	background: #ccc;
	margin: 10px 5px;
	cursor: pointer;
}

.section input[id="slide01"]:checked ~ .slidewrap .slide-pagelist>li:nth-child(1)>label
	{
	background: #999;
}

.section input[id="slide02"]:checked ~ .slidewrap .slide-pagelist>li:nth-child(2)>label
	{
	background: #999;
}

.section input[id="slide03"]:checked ~ .slidewrap .slide-pagelist>li:nth-child(3)>label
	{
	background: #999;
}
/* 포스터 */
.showlistwrap {
	max-width: 1100px;
	margin: 0 auto;
}

.showlist {
	white-space: nowrap;
	position: relative;
	overflow: hidden;
}

.showlist>li {
	display: inline-block;
	width: 25%;
}

.showlist>li>a {
	display: block;
	position: relative;
}

.showlist>li>a img {
	width: 100%;
}
</style>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<div class="section">
		<input type="radio" name="slide" id="slide01" checked> <input
			type="radio" name="slide" id="slide02"> <input type="radio"
			name="slide" id="slide03">
		<div class="slidewrap">
			<ul class="slidelist">
				<!-- 슬라이드 영역 -->
				<li class="slideitem"><a>
						<div class="textbox">
							<h3>레미제라블</h3>
							<p>자세히 보기</p>
						</div> <img
						src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20121108_97%2Fatropos332_1352303430259exRfn_JPEG%2FIMG_5250.JPG&type=sc960_832">
				</a></li>
				<li class="slideitem"><a>
						<div class="textbox">
							<h3>레베카</h3>
							<p>자세히 보기</p>
						</div> <img
						src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F5346%2F2020%2F01%2F20%2F0000148795_001_20200120230112588.jpg&type=sc960_832">
				</a></li>
				<li class="slideitem"><a>
						<div class="textbox">
							<h3>맘마미아</h3>
							<p>자세히 보기</p>
						</div> <img
						src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20130408_226%2Fjibisil_1365393954279OY0RB_JPEG%2F%25B8%25BE%25B8%25B6%25B9%25CC%25BE%25C6_%25B0%25C5%25C3%25A2_%25B0%25F8%25BF%25AC%252C_%25BC%25BA%25C8%25B2%25B8%25AE%25BF%25A1_%25B8%25B6%25C3%25C4.jpg&type=sc960_832">
				</a></li>

				<!-- 좌,우 슬라이드 버튼 -->
				<div class="slide-control">
					<div>
						<label for="slide03" class="left"></label> <label for="slide02"
							class="right"></label>
					</div>
					<div>
						<label for="slide01" class="left"></label> <label for="slide03"
							class="right"></label>
					</div>
					<div>
						<label for="slide02" class="left"></label> <label for="slide01"
							class="right"></label>
					</div>
				</div>

			</ul>
			<!-- 페이징 -->
			<ul class="slide-pagelist">
				<li><label for="slide01"></label></li>
				<li><label for="slide02"></label></li>
				<li><label for="slide03"></label></li>
			</ul>
		</div>
		
		<h1 style="padding-left: 20px; padding-top: 20px; padding-bottom: 30px; text-align: center;">추천 공연</h1>
		
		<!-- 포스터 -->
		<div class="showlistwrap">
			<ul class="showlist">
				<li class="show" ><a><img id="les" alt="레미제라블포스터"
						src="http://ojsfile.ohmynews.com/PHT_IMG_FILE/2015/1112/IE001892725_PHT.jpg"
						width="150px" height="250px"></a></li>
				<li class="show"><a><img id="reb" alt="레베카포스터"
						src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA0MDJfNTkg%2FMDAxNjQ4OTAyMDk4Mjc0.ffJ0m8xbgDIHd7YOC6z_9hINECiDZzqWm_1iZgq7D14g.mA8U4FYz03dI5BwKpvRO3iqh_aFVAsZHHQxbzaTUGtYg.PNG.black_stones%2F20211115_133906.png&type=sc960_832"
						width="150px" height="250px"></a></li>
				<li class="show"><a><img id="mam" alt="맘마미아포스터"
						src="https://img.insight.co.kr/static/2017/05/21/700/9tpv7qxp3p07385809gp.jpg"
						width="150px" height="250px"></a></li>
				<li class="show"><a><img id="comingsoon" alt="커밍순"
						src="https://search.pstatic.net/common/?src=http%3A%2F%2Fpost.phinf.naver.net%2FMjAxOTA0MjVfMjc3%2FMDAxNTU2MTk0ODcyNDAz.cQVCqmVUUlrLm-LjtpJ7JTamf0iUNLaF8fdaZwareQQg.2K2r8HO1g28FJVDnqNfM4gX2yemSTEM8b5r4YtOQnT8g.JPEG%2FILGKnuzlYmlzVY0zvT2DzmSXS46U.jpg&type=sc960_832"
						width="150px" height="250px"></a></li>
			</ul>
		</div>

	</div>
</body>
</html>
