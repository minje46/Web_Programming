<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>	
<%@ page import="bbs.Bbs" %>	
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
<title>Professor</title>

<style>

.left {
   width: 50%;
   float:left;
   margin-top: 50px;
  
}
.right {
   width: 50%;
   float:right;
 
}

.bb-chart-arc.bb-target text {
   fill-opacity: 0;
}
</style>

 <!-- chart plug-in -->
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="https://naver.github.io/billboard.js/release/latest/dist/billboard.js"></script>
<link rel="stylesheet" href="https://naver.github.io/billboard.js/release/latest/dist/billboard.css">

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
				<h2 class="pageTitle">Course</h2>
			</div>
		</div>
	</div>
	</section>
	<section id="content">
	<div class="container">	 
<!--  The number of users 
<script id="_wauu34">
   var _wau = _wau || [];
   _wau.push(["dynamic", "3rej5a97z9", "u34", "ffffff000000", "small"]);
</script>
<script async src="//waust.at/d.js"></script>
 -->
 <h1 align="center">What is the correct status codes of HTTP?
</h1>
 <br>
 <br>
 <br>
 <div id="chart" class='left' align="center"></div>
 <div id="donutChart" class='right'></div>
<!-- 
<div>
   <div class="left">
       <input type="text" value="Enter the question"
      style="text-align:center; width:100%; height:10%; font-size:20px; font-weight:bold;">
      <input type="submit">
      <div id="chart"></div> -->
<!--
   </div>
   <div class="right">
      <div id="donutChart"></div>
   </div>
</div> -->
<script>

var data1 = "no.1"; // ex: 1번: 수학
var data2 = "no.2"; 
var data3 = "no.3";
var data4 = "no.4"; 

var x = 3; // binding data1 
var y = 5; // data2
var z = 10; // data3
var k = 17; // data4

var donutTitle = "correct ratio";

var donutChart = bb.generate({
   data: {
      columns: [
         [data1, x],
         [data2, y],
         [data3, z],
         [data4, k]
      ],
      type: "donut"
   },
   legend: {
      item: {
         onover: function(id) {
            d3.select(".bb-chart-arc.bb-target-" + id + " text").style("fill-opacity", 1);
         },
         onout: function(id) {
            d3.select(".bb-chart-arc.bb-target-" + id + " text").style("fill-opacity", 0);
         }
      }
   },
   donut: {
      title : donutTitle,
      label: {
         show: true
      }
   },
   bindto: "#donutChart"
});

var chart = bb.generate({
     data: {
       columns: [
         ["참여율", 30]
       ],
       type: "gauge"
     },
     color: {
      pattern: [
         "#FF0000",
          "#F97600",
          "#F6C600",
          "#60B044"
      ],
      threshold: {
         values: [
            30,
            60,
            90,
            100
         ]
      }
     },
     size: {
         height: 180
     },
     bindto: "#chart"
   });
   
setTimeout(function() {
   chart.load({
      columns: [["참여율", 0]]
   });
}, 1500);
setTimeout(function() {
   chart.load({
      columns: [["참여율", 100]]
   });
}, 2000);
setTimeout(function() {
   chart.load({
      columns: [["참여율", 30]]
   });
}, 2500);
</script>
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
</body>
</html>