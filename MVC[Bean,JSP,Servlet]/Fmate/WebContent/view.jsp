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
<link rel="stylesheet" href="css/custom.css">
<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet"> 
<link href="css/flexslider.css" rel="stylesheet" /> 
<link href="css/style.css" rel="stylesheet" />
<title>fmate</title>
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
	<!-- end header -->
		<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">Course</h2>
			</div>
		</div>
	</div>
	</section>
		<section id="content">
	<div class="container">	 
		<div class="row"> 
							<div class="col-md-12">
								<div class="about-logo">
									<h3>Advanced Web Programming</h3>
									<p>This course presents the most advanced techniques available for use on the World Wide Web. Especially XML, HTML5, AJAX, JQUERY, JSON, Servlet, JSP and SPRING framework will be covered in the course. Strategies for planning, development, and implementation will be discussed and demonstrated.</p>
                                    	<p>We study advanced techniques for web page construction. A different technique is dealt with on one or two weeks. In the class, the technique is first presented by the professor, and then students do exercise on the technique on the same day. Students are assigned four homeworks. They take mid-term and final exams.</p>
								</div>  
							</div>
						</div>
						</div>
						</section>
	<div class="container">
		 <div class="row">
			 	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd;">
			 		<thead>
						<tr>
							<th colspan="3" style="background-color:#eeeeee; text-align: center;">게시판 글 보기</th>
						</tr>		 		
			 		</thead>
			 		
			 		<tbody>
			 			<tr>
			 				<td style="width:20%;">Article</td>
			 				<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("/n","<br>")%></td>
			 			</tr>
			 			<tr>
			 				<td>작성자</td>
			 				<td colspan="2"><%= bbs.getUserID() %></td>
			 			</tr>
			 			<tr>
			 				<td>작성일자</td>
			 				<td colspan="2"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11, 13) + ":" + bbs.getBbsDate().substring(14, 16) +  "분" %></td>
			 			</tr>
			 			<tr>
			 				<td height="400px">Contents</td>
			 				<td colspan="2" style="min-height:200px; text-align:left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("/n","<br>")%></td>
			 			</tr>
			 		</tbody>
			 	</table>
				 	<a href="bbs.jsp" class="btn btn-primary">list</a>
				 	<%
				 		if(userID != null && userID.equals(bbs.getUserID())){
				 	%>
						<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>				 	
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">Delete</a>				 	
				 	<% 		
				 		}
				 	%>
		 </div>
	</div>
	
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
<script src="js/bootstrap.min.js"></script> 
</body>
</html>