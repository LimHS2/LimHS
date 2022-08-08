<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tiles Layout Main</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
#container {
	width: 100%;
	margin: 0px auto;
	text-align: center;
	border: 0px solid #bcbcbc;
}

#header {
	padding: 5px;
	height: 100px;
	margin-bottom: 0px;
	border: 0px solid #bcbcbc;
	background-color: #737373;
}

/* #sidebar-left {
	width: 15%;
	height: 700px;
	padding: 5px;
	margin-right: 5px;
	margin-bottom: 5px;
	float: left;
	background-color: rgb(5, 68, 104);
	border: 0px solid #bcbcbc;
	font-size: 10px;
} */

#sidebar-left {
	width: 15%;
	height: 850px;
	padding: 5px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	float: left;
	background-color: rgb(5, 68, 104);
	border: 0px solid #bcbcbc;
	font-size: 10px;
	padding: 20px 0;
}

/* .wrapper .sidebar{
    background: rgb(5, 68, 104);
    position: fixed;
    float: left;
    top: 0;
    left: 0;
    width: 225px;
    height: 100%;
    padding: 20px 0;
    transition: all 0.5s ease; */
}

#content {
	width: 75%;
	padding: 5px;
	margin-right: 5px;
	float: center;
	border: 0px solid #bcbcbc;
}

/* #footer {
	clear: both;
	padding: 5px;
	height: 50px;
	border: 0px solid #bcbcbc;
	background-color: lightblue;
} */
</style>

</head>
<body>

	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>

	<div id="sidebar-left">
		<tiles:insertAttribute name="menu" />
	</div>

	<div id="content">
		<tiles:insertAttribute name="content" />
	</div>

	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>