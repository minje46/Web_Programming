<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Hashtable" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
table{
border-collpase:"collpase";
}
</style>
</head>
<%
String bgcolor, textColor;
if(request.getHeader("User-Agent").contains("Chrome")){
	bgcolor = "yellow";
	textColor = "red";
}
else {
	bgcolor =  "navy";
	textColor = "white";
}
%>
<body bgColor="<%= bgcolor %>" text="<%= textColor %>">
<jsp:useBean id="myHeaderTable" class="ex12.Header" scope="application"/>
this page information
<%
Enumeration<String> headerNames = request.getHeaderNames();
Hashtable<String, String> newHeaderTable = new Hashtable<String, String>();
Hashtable<String, String> oldHeaderTable = myHeaderTable.getHeaderTable();
int i = 0;

while (headerNames.hasMoreElements()) {
    String name = (String)headerNames.nextElement();
    String cname = name.substring(0,1).toUpperCase() + name.substring(1);
    String value = request.getHeader(name);
    newHeaderTable.put(cname, value);
}%>

<table border="1">
<tr><td>Host</td><td>${header["Host"]}</td></tr>
    <tr><td>Cookie</td><td>${header["Cookie"]}</td></tr>
    <tr><td>Connection</td><td>${header["Connection"]}</td></tr>
    <tr><td>Upgrade-insecure-requests</td><td>${header["Upgrade-insecure-requests"]}</td></tr>
    <tr><td>Accept</td><td>${header["Accept"]}</td></tr>
    <tr><td>User-agent</td><td>${header["User-agent"]}</td></tr>
    <tr><td>Accept-language</td><td>${header["Accept-language"]}</td></tr>
    <tr><td>Cache-control</td><td>${header["Cache-control"]}</td></tr>
    <tr><td>Accept-encoding</td><td>${header["Accept-encoding"]}</td></tr>
</table>
that information
<%
if(oldHeaderTable == null){
%>
<jsp:setProperty name="myHeaderTable" property="headerTable" value="<%=newHeaderTable%>"/>
<p>success storing</p>
<% } else{
	%>
	<table border="1">
	<%
	for(String key : oldHeaderTable.keySet()){
		%>
		<tr><td><%=key%></td><td><%=oldHeaderTable.get(key)%></td></tr>
		<%
	}
	%>
	</table>
	<%
}
%>

</body>
</html>