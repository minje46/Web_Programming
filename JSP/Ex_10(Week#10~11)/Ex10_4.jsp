<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@	page import="java.util.Enumeration" %>
<%@ page import="java.util.Hashtable" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Exampe10_4</title>
</head>

<body>
	<jsp:useBean id="beanTable" class="ex10.Ex10_4" scope="application"/>
	<h2>Request read</h2>
	<table border="1" border-collapse:"collapse">
		<%
			Enumeration<String> headerName = request.getHeaderNames();
			Hashtable<String, String> newRequest = new Hashtable<String, String>();
			Hashtable<String, String> prevRequest = beanTable.getHeader();
			int count = beanTable.getCount();
			count++;
			
			while(headerName.hasMoreElements()){
				String name = (String)headerName.nextElement();
				String upper = name.substring(0,1).toUpperCase() + name.substring(1);
			
			%>
			<tr><td> <%=upper%></td> <td><%=request.getHeader(name)%></td></tr>
			<%
			}
		%>
	</table>
	<h3>Count : <%=count%></h3>
	<br><br>
	<h2>Request data is stored in bean class</h2>
	<jsp:setProperty name="beanTable" property="count" value="<%=count%>"/>
	<%
		if(prevRequest == null){
			%>
			<jsp:setProperty name="beanTable" property="header" value="<%=newRequest%>"/>
			<%
		}
		else{
			%>
			<table border="1">
			<%
				for(String key :prevRequest.keySet()){
					%>
					<tr><td><%=key%></td> <td><%=prevRequest.get(key)%></td></tr>
					<%
				}
			%>
			</table>
			<%
		}
	%>
</body>
</html>