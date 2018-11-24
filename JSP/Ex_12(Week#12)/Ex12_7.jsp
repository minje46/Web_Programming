<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Make random number between 0 and 1</title>
</head>
<body>
	<%@ taglib uri="/WEB-INF/ex12_taglib.tld" prefix="ex12" %>
	<h2>The random number between 0 and 1</h2>
	<ex12:random/>
	<br/><br/>
	
	<h2>The random number with limit</h2>
	<ex12:randomInt limit="100"/>
</body>
</html>