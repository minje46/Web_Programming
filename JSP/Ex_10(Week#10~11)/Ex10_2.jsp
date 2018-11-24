<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Example10_2</title>
	
	<%
		String color_background, color_text;
		if(request.getHeader("User-Agent").contains("Chrome"))
		{
			color_background = "yellow";
			color_text = "red";
		}
		else
		{
			color_background = "navy";
			color_text = "white";
		}
	%>
</head>
<body bgColor="<%=color_background%>" text="<%=color_text%>" >
	<%@page import="java.util.Enumeration" %>
	<%
		Enumeration<String> header_name = request.getHeaderNames();
		while(header_name.hasMoreElements())
		{
			String name = (String)header_name.nextElement();
			String upper = name.substring(0,1).toUpperCase() + name.substring(1);	
			%>
			
			<p> <%=upper%> : <%=request.getHeader(name)%> </p>
			<%
		}
	%>

</body>
</html>