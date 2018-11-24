<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Example12_1</title>
</head>
<body>
	<%!
		boolean first_request = true;
		int count = 0;
	%>
	<h2>Registration</h2>
	<%
		if(first_request){
			first_request = false;
	%>
	<form ACTION="http://localhost:8080/Web_example/Register">
		<table>
			<tr><td>First name : </td> <td> <input type="text" name="firstName"></td></tr>
			<tr><td>Last name : </td> <td> <input type="text" name="lastName"></td></tr>
			<tr><td>Email : </td> <td> <input type="text" name="email"></td></tr>
			<tr><td>Phone Number : </td> <td> <input type="text" name="phoneNumber"></td></tr>
		</table>
		<input type="submit" value="register">
	</form>
	<%
		}
		else {
	%>
	<form ACTION="http://localhost:8080/Web_example/Register"> 
	<table>
	<%
		String[] error_msgs = {"", "", "", ""};
		String[] names = {"firstName", "lastName", "email", "phoneNumber"};
		String[] value = new String[4];
		value[0] = request.getParameter("firstName");
		value[1] = request.getParameter("lastName");
		value[2] = request.getParameter("email");
		value[3] = request.getParameter("phoneNumber");
		
		boolean hashValue = true;
		for(int i=0; i<4; i++){
			if(value[i] == null || value[i].trim().equals("")){
				hashValue = false;
				error_msgs[i] = "Enter " +names[i];
				value[i] = "";
			}
		}
		
		if(hashValue){
	%>
		<tr><td>First name : </td><td>${firstName}</td></tr>
		<tr><td>Last name</td><td>${lastName}</td></tr>
		<tr><td>Email : </td><td>${email}</td></tr>
		<tr><td>Phone Number : </td><td>${phoneNumber}</td></tr>
	<%
		}
		else{
	%>
		<tr><td>First name : </td><td><input type="text" name="firstName" value = "${firstName}"></td><td style="color:red"><%= error_msgs[0] %></td></tr>
		<tr><td>Last name</td><td><input type="text" name="lastName" value = "${lastName}"></td><td style="color:red"><%= error_msgs[1] %></td></tr>
		<tr><td>Email : </td><td><input type="text" name="email" value = "${email}"></td><td style="color:red"><%= error_msgs[2] %></td></tr>
		<tr><td>Phone Number : </td><td><input type="text" name="phoneNumber" value = "${phoneNumber}"><td style="color:red"><%= error_msgs[3] %></td></tr>
	<%		
		}
	%>
	</table>
	<%
		if(!hashValue){
	%>	
		<input type="submit" value="register">
	<% 	 		
		}
	%>
		</form>
	<%
	}
	%>
</body>
</html>