<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Example10_1</title>
</head>
<body>
	<%
	String[] error_msgs = {"", "", "", ""}; 
	int i = 0;

	java.util.Enumeration<String> paramNames = request.getParameterNames();
	while(paramNames.hasMoreElements()) {
		String name = (String)paramNames.nextElement();
		String value = request.getParameter(name);
		
		if(value.length()==0 || value.equals("")) {
			error_msgs[i] = "Enter " + name; 
		}
		i++;
	}
	
	String first = request.getParameter("firstName") == null ? "" : request.getParameter("firstName");
	String last = request.getParameter("lastName")== null ? "" : request.getParameter("lastName");
	String email = request.getParameter("eMail")== null ? "" : request.getParameter("eMail");
	String phone = request.getParameter("phoneNumber")== null ? "" : request.getParameter("phoneNumber");
	%>
	
	<h2>Registration</h2>
	<form ACTION="http://localhost:8080/Web_example/Ex10_1.jsp">
		<table>
			<tr><td>First name : </td> <td> <input type="text" name="firstName" value="<%=first%>"></td> <td style="color:red"><%=error_msgs[0]%></td></tr>
			<tr><td>Last name : </td> <td> <input type="text" name="lastName" value="<%=last%>"></td> <td style="color:red"><%=error_msgs[1]%></td></tr>
			<tr><td>E-mail : </td> <td> <input type="text" name="eMail" value="<%=email%>"></td> <td style="color:red"><%=error_msgs[2]%></td></tr>
			<tr><td>Phone Number : </td> <td> <input type="text" name="phoneNumber" value="<%=phone%>"></td> <td style="color:red"><%=error_msgs[3]%></td></tr>
		</table>
		<input type="submit" value="register">
	</form>
</body>
</html>