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
	border: 0px solid #bcbcbc;	
}

#content {
	width: 100%;
	float: center;
	border: 0px solid #bcbcbc;
	margin-bottom: 50px;
}

#footer {
	clear: both;
	padding: 2px;
	border: 0px solid #bcbcbc;
	background-color: #e7e7e7;
}
</style>

</head>
<body>

	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>
	
	<div id="content">
		<tiles:insertAttribute name="content" />
	</div>

	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>
