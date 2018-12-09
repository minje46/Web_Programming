<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet"> 
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title>fmate</title>
</head>
<body>
<!-- 로그인이 된 사람들의 세션을 만들어 준다. 
		 회원값이 있는 사람들은 userID에 정보가 담기게 되고
		 아닌 사람은 null값을 가지게 된다.
	-->
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%>
<div id="wrapper" class="home-page">
<div class="topbar">
  <div class="container">
    <div class="row">
      <div class="col-md-12"> 	  
        <p class="pull-left hidden-xs"><i class="fa fa-clock-o"></i><span>Study with me</span></p>
        <p class="pull-right"><i class="fa fa-phone"></i>Tel No. (+82) 123-456-789</p>
      </div>
    </div>
  </div>
</div>
	<!-- start header -->
	<header>
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="main.jsp"><img src="img/logo.png" alt="logo"/></a>
                </div>
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="main.jsp">Home</a></li> 
                        <li><a href="problem.jsp">Problem</a></li>
                        <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Course <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="bbs.jsp">Advanced Web Programming</a></li>
                            <li><a href="bbs.jsp">Robotics</a></li>
                            <li><a href="bbs.jsp">Distributed System</a></li> 
                           
                        </ul>
                    </li> 
                        <li><a href="contact.html">Contact</a></li>
                     
                    
                    <!-- 접속하기는 로그인안한 사람만 보여주게하기 -->
			<%
				if(userID == null){
			%>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				<a href="#" class="dropdown-toggle" 
				data-toggle="dropdown" role="button" aria-haspopup="true" 
				aria-expanded="false">Enter<span class="caret"></span></a>
				
					<ul class="dropdown-menu">
						<li><a href="login.jsp">Log in</a></li>
						<li><a href="join.jsp">Register</a></li>
					</ul>
				</li>		
			</ul>
			 <% 
				}else{
			 %>			
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
					<a href="#" class="dropdown-toggle" 
					data-toggle="dropdown" role="button" aria-haspopup="true" 
					aria-expanded="false">Manages<span class="caret"></span></a>
					
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">Logout</a></li>
						</ul>
					</li>		
				</ul> 
			 <%	
				}
		   	 %>
                    </ul>
                </div>
            </div>
        </div>
	</header>
	<!-- end header -->
	<div class="container">
		 <div class="row">
		 	<form method="post" action="writeAction.jsp">
			 	<table class="table table-striped" style="text-align:center; border:1px; solid #dddddd">
			 		<thead>
						<tr>
							<th colspan="1" style="background-color:#eeeeee; text-align: center;">Write</th>
						</tr>		 		
			 		</thead>
			 		
			 		<tbody>
			 			<tr>
			 				<td><input type="text" class="form-control" placeholder="Article" name="bbsTitle" maxlength="50"></td>
			 			</tr>
			 			<tr>	
			 				<td><textarea class="form-control" placeholder="Contents" name="bbsContent" maxlength="2048" style="height:350px"></textarea> </td>
			 			</tr>	
			 		</tbody>
			 	</table>
				 	<input type="submit" class="btn btn-primary pull-right" value="Write">
			</form>
		 </div>
	</div>
	
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
<script src="js/bootstrap.min.js"></script> 
</body>
</html>