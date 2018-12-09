<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>	
<%@ page import="bbs.Bbs" %>	
<%@ page import="bbs.BbsDAO" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/custor.css">
<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet"> 
<link href="css/flexslider.css" rel="stylesheet" /> 
<link href="css/style.css" rel="stylesheet" />
<title>Fmate</title>
</head>
<body>
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
	<!-- 로그인이 된 사람들의 세션을 만들어 준다. 
		 회원값이 있는 사람들은 userID에 정보가 담기게 되고
		 아닌 사람은 null값을 가지게 된다.
	-->
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = login.jsp'");
			script.println("</script>");	
		}
		int bbsID = 0 ;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다..')");
			script.println("location.href = bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = bbs.jsp'");
			script.println("</script>");
		}
	%>
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
                        <li><a href="contact.jsp">Contact</a></li>
                        
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
						<li><a href="join.jsp">Join</a></li>
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
					aria-expanded="false">Manage<span class="caret"></span></a>
					
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">Log out</a></li>
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
	
	<div class="container">
		 <div class="row">
		 	<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
			 	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd;">
			 		<thead>
						<tr>
							<th colspan="1" style="background-color:#eeeeee; text-align: center;">Edit</th>
						</tr>		 		
			 		</thead>
			 		
			 		<tbody>
			 			<tr>
			 				<td><input type="text" class="form-control" placeholder="Article" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
			 			</tr>
			 			<tr>	
			 				<td><textarea class="form-control" placeholder="Contents" name="bbsContent" maxlength="2048" style="height:350px"><%= bbs.getBbsContent() %></textarea> </td>
			 			</tr>	
			 		</tbody>
			 		
			 	</table>
				 	<input type="submit" class="btn btn-primary pull-right" value="Eidt">
			</form>
		 </div>
	</div>
	
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
<script src="js/bootstrap.min.js"></script> 
</body>
</html>