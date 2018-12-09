<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet"> 
<link href="css/flexslider.css" rel="stylesheet" /> 
<link href="css/style.css" rel="stylesheet" />
<title>Home</title>
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
	
	</section> 
	<section id="call-to-action-2">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-sm-9">
					<h3>Why Flipped Learning?</h3>
					<p>The flipped classroom model of teaching is spreading across more and more educational institutions, as it seems to better respond to the learning needs of children living in today’s ever more connected world. Flipping the classroom is a win-win situation for both students and teachers. Here are 8 flipped classroom benefits for everyone in the learning environment.</p>
				</div>
				<div class="col-md-2 col-sm-3">
					<a href="#" class="btn btn-primary">Read More</a>
				</div>
			</div>
		</div>
	</section>
	<section id="content">
	<div class="container">
	    	<div class="row">
			<div class="col-md-12">
				<div class="aligncenter"><h2 class="aligncenter">Effect of Flipped Learning</h2>
				<img src="img/flipped-learning.png" alt="effect of flipped learning" width="600px" height="400px"/></div>
				<br/>
			</div>
		</div>
	<div class="about home-about">
				<div class="container">
						
						<div class="row">
							<div class="col-md-4">
								<!-- Heading and para -->
								<div class="block-heading-two">
									<h3><span>Fmate</span></h3>
								</div>
								<p>With a goal of overhauling university software education, we recruited Professor Won Kim, a world-renowned scholar, and established the Department of Software, the only education-specialized department in Gachon University. The curriculum and education methods reflect the industry’s demands, and are not shackled to conventional methods.<br><br></p>
							</div>
							<div class="col-md-4">
								<div class="block-heading-two">
									<h3><span>Courses</span></h3>
								</div>		
								<!-- Accordion starts -->
								<div class="panel-group" id="accordion-alt3">
								 <!-- Panel. Use "panel-XXX" class for different colors. Replace "XXX" with color. -->
								  <div class="panel">	
									<!-- Panel heading -->
									 <div class="panel-heading">
										<h4 class="panel-title">
										  <a data-toggle="collapse" data-parent="#accordion-alt3" href="#collapseOne-alt3">
											<i class="fa fa-angle-right"></i> Advanced Web Programming
										  </a>
										</h4>
									 </div>
									 <div id="collapseOne-alt3" class="panel-collapse collapse">
										<!-- Panel body -->
										<div class="panel-body">
										  Sed ut perspiciaatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas
										</div>
									 </div>
								  </div>
								  <div class="panel">
									 <div class="panel-heading">
										<h4 class="panel-title">
										  <a data-toggle="collapse" data-parent="#accordion-alt3" href="#collapseTwo-alt3">
											<i class="fa fa-angle-right"></i> Robotics
										  </a>
										</h4>
									 </div>
									 <div id="collapseTwo-alt3" class="panel-collapse collapse">
										<div class="panel-body">
										  Sed ut perspiciaatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas
										</div>
									 </div>
								  </div>
								  <div class="panel">
									 <div class="panel-heading">
										<h4 class="panel-title">
										  <a data-toggle="collapse" data-parent="#accordion-alt3" href="#collapseThree-alt3">
											<i class="fa fa-angle-right"></i> Distributed System
										  </a>
										</h4>
									 </div>
									 <div id="collapseThree-alt3" class="panel-collapse collapse">
										<div class="panel-body">
										  Sed ut perspiciaatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas
										</div>
									 </div>
								  </div>
								  <div class="panel">
									 <div class="panel-heading">
										<h4 class="panel-title">
										  <a data-toggle="collapse" data-parent="#accordion-alt3" href="#collapseFour-alt3">
											<i class="fa fa-angle-right"></i> All
										  </a>
										</h4>
									 </div>
									 <div id="collapseFour-alt3" class="panel-collapse collapse">
										<div class="panel-body">
										  Sed ut perspiciaatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas
										</div>
									 </div>
								  </div>
								</div>
								<!-- Accordion ends -->
								
							</div>
							
							<div class="col-md-4">
								<div class="block-heading-two">
									<h3><span>About us</span></h3>
								</div>	
								     <div class="testimonials">
										<div class="active item">
										  <blockquote><p>Gachon University’s Department of Software is a “top-tier” department that has become Korea’s new standard of software education thanks to its top-quality curriculum, paired with support from the Ministry of Science and ICT for "national program of excellence in software".</p></blockquote>
										  <div class="carousel-info">
											<img alt="" src="img/girl.png" class="pull-left">
											<div class="pull-left">
											  <span class="testimonials-name">AnKwakLee</span>
											  <span class="testimonials-post">Software Programmer</span>
											</div>
										  </div>
										</div>
									</div>
							</div>
							
						</div>
						
						 						
						 
						<br>
					 
					  </div>
						
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
					<strong>Gachon University</strong><br>
					1342 Seongnam-daero, Bokjeong-dong, Sujeong-gu, Seongnam-si, Gyeonggi-do<br>
					 fmate</address>
					<p>
						<i class="icon-phone"></i> (031) 750-5114 <br>
						<i class="icon-envelope-alt"></i> email@domainname.com
					</p>
				</div>
			</div>
			<div class="col-md-3 col-sm-3">
				<div class="widget">
					<h5 class="widgetheading">Quick Links</h5>
					<ul class="link-list">
						<li><a href="http://gachon.ac.kr/community/opencampus/03.jsp?boardType_seq=358">Latest Events</a></li>
						<li><a href="#">Terms and conditions</a></li>
						<li><a href="#">Privacy policy</a></li>
						<li><a href="#">Career</a></li>
						<li><a href="contact.jsp">Contact us</a></li>
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
							Copyright &copy; 2018.fmate All rights reserved. <a href="https://showyooni.github.io" target="_blank" title="模板之家">click</a>
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
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
<script src="js/bootstrap.min.js"></script> 
</body>
</html>
