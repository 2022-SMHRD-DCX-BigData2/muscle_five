<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
<title>Insert title here</title>
	<style>
		
		#divrow{
			margin : auto;
			height: 600px;
			width: 500px;
		}
				
		.inbodyimg{
			width : 200px;
			height : 200px;
		}
		
		#wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
		
	</style>
</head>
<body class="landing is-preload">
	<div  id="page-wrapper">
	<!-- Header -->
	<header id="header" class="alt">
		<h1><a href="main.jsp">MusleFive</a> </h1>
		<nav id="nav">
			<ul>
				<li><a href="login.jsp" class="button">Login</a></li>
				<li><a href="join.jsp" class="button">Sign Up</a></li>
			</ul>
		</nav>
	</header>

	<!-- Banner -->
		<section id="banner">
			<h2>MusleFive</h2>
			<p>환영합니다.</p>
			<ul class="actions special">
				<li><a href="main.jsp" class="button ">main</a></li>
				<li><a href="routin.jsp" class="button ">routin</a></li>
				<li><a href="community.jsp" class="button ">community</a></li>
				<li><a href="generic.jsp" class="button ">Map</a></li>
			</ul>
		</section>

	<!-- Main -->
		<section id="main" class="container">

			<section class="box special">
				<div class="content-wrap n-tech">
					<!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
					<div id="wrap">
						<nav id="Update"> <font size="8">회원가입 축하드립니다!</font>
						<br>
						아래의 정보를 확인하세요<br>
						<br>
						
						<table>
							<tr>
								<td>ID</td>	
								<td><%=request.getAttribute("joinid")%></td>
							</tr>
						</table>
						<a href="login.jsp"><input type="button" value="로그인하기"></a> </nav>
					</div>
				</div>
			</section>
		</section>
		
		
	<!-- Footer -->
		<footer id="footer">
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
				<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
				<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
				<li><a href="#" class="icon brands fa-google-plus"><span class="label">Google+</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</footer>
	</div>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script> 
</body>
</html>