<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="problem.ProblemDAO" %>   
<%@ page import="problem.Problem" %>   
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custorm.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet"> 
<link href="css/flexslider.css" rel="stylesheet" /> 
<link href="css/style.css" rel="stylesheet" />
<title>Problem</title>
<style>
a,a:hover {
   color: #000000;
   text-decoration: none;
}
</style>
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
      String userAuth = null;
      UserDAO userDAO = new UserDAO();
      
      if(session.getAttribute("userID") != null){
         userID = (String) session.getAttribute("userID");
         userAuth = userDAO.getAuth(userID);
         System.out.println("나온다" + userAuth);
      }
      int pageNumber = 1;
      if(request.getParameter("pageNumber") != null){
         pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
   <!-- end header -->
   
   
   
   <section id="inner-headline">
   <div class="container">
      <div class="row">
         <div class="col-lg-12">
            <h2 class="pageTitle">Problem</h2>
         </div>
      </div>
   </div>
   </section>
   <section id="content">
      <div class="container">
       <div class="row">
          <table class="table table-striped" style="text-align:center; border:1px; solid #dddddd">
             <thead>
               <tr>
                  <th style="background-color:#eeeeee; text-align: center;">No</th>
                  <th style="background-color:#eeeeee; text-align: center;">Article</th>
                  <th style="background-color:#eeeeee; text-align: center;">Writer</th>
                  <th style="background-color:#eeeeee; text-align: center;">Date</th>
               </tr>             
             </thead>
             <tbody>
                <%
                   ProblemDAO ProbDAO = new ProblemDAO();
                   ArrayList<Problem> list = ProbDAO.getList(pageNumber);
                   String checkIdentity = userAuth.equals("Pro") ? "pro" : "stu";
                   for(int i=0; i < list.size(); i++){
                   
                %>
                <!-- if 조건으로 Student와 professor 각각 페이지 열어주기. (DB에서 read해서 권위 확인 필요)
                problem_stu?problemDB 로 해야할듯. [view_problem은 지워도 될듯] -->
                
                <tr>
                   <td><%= list.get(i).getPrID() %></td>
                   <td><a href="problem_<%= checkIdentity %>.jsp?prID=<%= list.get(i).getPrID() %>"><%= list.get(i).getPrTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("/n","<br>")%></a></td>
                   <td><%= list.get(i).getUserID() %></td>
                   <td><%=list.get(i).getPrDate().substring(0,11) + list.get(i).getPrDate().substring(11, 13) + "시" + list.get(i).getPrDate().substring(14, 16) +  "분" %></td>

                </tr>   
                
                <%      
                   }
                %>
             </tbody>
          </table>
          <%
             if(pageNumber != 1){
          %>
            <a href="problem.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">Prev</a>
          <%      
             } if(ProbDAO.nextPage(pageNumber + 1)){
          %>
             <a href="problem.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">Next</a>
          <%
             }
          %>
          <!-- if 조건으로 Professor만 write 권한 주기. (DB에서 read해서 권위 확인 필요) -->
          <%
             if (userAuth.equals("Pro")) {
             
          %>
          <a href="write_quiz.jsp" class="btn btn-primary pull-right">Make quiz</a>
          <%
             }
          %>
       </div>
       </div>
                  </section>

   
       <footer>
   <div class="container">
      <div class="row">
         <div class="col-md-3 col-sm-3">
            <div class="widget">
               <h5 class="widgetheading">Our Contact</h5>
               <address>
               <strong>Bootstrap company Inc</strong><br>
               JC Main Road, Near Silnile tower<br>
                Pin-21542 NewYork US.</address>
               <p>
                  <i class="icon-phone"></i> (123) 456-789 - 1255-12584 <br>
                  <i class="icon-envelope-alt"></i> email@domainname.com
               </p>
            </div>
         </div>
         <div class="col-md-3 col-sm-3">
            <div class="widget">
               <h5 class="widgetheading">Quick Links</h5>
               <ul class="link-list">
                  <li><a href="#">Latest Events</a></li>
                  <li><a href="#">Terms and conditions</a></li>
                  <li><a href="#">Privacy policy</a></li>
                  <li><a href="#">Career</a></li>
                  <li><a href="#">Contact us</a></li>
               </ul>
            </div>
         </div>
         <div class="col-md-3 col-sm-3">
            <div class="widget">
               <h5 class="widgetheading">Latest posts</h5>
               <ul class="link-list">
                  <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a></li>
                  <li><a href="#">Pellentesque et pulvinar enim. Quisque at tempor ligula</a></li>
                  <li><a href="#">Natus error sit voluptatem accusantium doloremque</a></li>
               </ul>
            </div>
         </div>
         <div class="col-md-3 col-sm-3">
               <div class="widget">
               <h5 class="widgetheading">Recent News</h5>
               <ul class="link-list">
                  <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a></li>
                  <li><a href="#">Pellentesque et pulvinar enim. Quisque at tempor ligula</a></li>
                  <li><a href="#">Natus error sit voluptatem accusantium doloremque</a></li>
               </ul>
            </div>
         </div>
      </div>
   </div>
   <div id="sub-footer">
      <div class="container">
         <div class="row">
            <div class="col-lg-6">
               <div class="copyright">
                  <p>
                     Copyright &copy; 2017.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                  </p>
               </div>
            </div>
            <div class="col-lg-6">
               <ul class="social-network">
                  <li><a href="#" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                  <li><a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                  <li><a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                  <li><a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
                  <li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus"></i></a></li>
               </ul>
            </div>
         </div>
      </div>
   </div>
   </footer>
   </div>
   </div>
   
   
   
   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>   
<script src="js/bootstrap.min.js"></script> 
</body>
</html>