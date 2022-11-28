<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.smhrd.domain.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE HTML>
<!--
	Alpha by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>muslefive</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />

		<style>
			
			#insta{
			width : 50px;
			height : 50px;
			}
			#s-box{
			width : 450px;
			height : auto;
			margin : auto;
			}

			#big-box{
			border : solid 1px;
			border-color : white;
			padding : 2em;
			}
			#box{
			border : none;
			padding : 0px;
			width : auto;
			margin-left :auto;
			border-radius : 0px;
			overflow :hidden;
			}
			#user-name{
			font-size : 20px;
			height : 0px;
			text-align : top;
			}
			#btn-good button{
			border: none;
			background-color: rgba(0,0,0,0);
			color : gray;
			font-size:20px;
			}
			#btn-good {
			margin-right : 400px;
			 }
			
			#font{
			color : rgb(0,0,0);
			}
			#calendar{
			margin : 180px;
			}		
			#muscle{
			margin : 100px;
			
			}		
			#prev {
			margin-right : 150px;
			}
			#next {
			margin-left : 150px;
			}
			#btn_group button{
				border: none;
				background-color: rgba(0,0,0,0);
				color : gray;
				padding : 5px;
				font-size:20px; padding:20px 20px
			}
			#btn_group button:hover{
				color:skyblue;
				backrtound-color: skyblue;
			}
		</style>
	</head>
	<body class="landing is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header" class="alt">
					<h1><a href="main.jsp">MusleFive</a></h1>
					<nav id="nav">
						<ul class="links">
						<c:choose>
				
							<c:when test="${empty loginMember}">
								<li><a href="login.jsp" class="button">Log in</a></li>
								<li><a href="join.jsp" class="button">Sign up</a></li>
							</c:when>
							
							<c:otherwise>
							
								<c:if test="${loginMember.id eq 'admin'}">
									<li><a href="#">회원관리</a></li>
								</c:if>
								

								<li><a href="logoutCon" class="button">Log out</a></li>
								<li><a href="modify.jsp" class="button">개인정보수정</a></li>
								
							</c:otherwise>
							
						</c:choose>
							
						</ul>
					</nav>
				</header>

			<!-- Banner -->
				<section id="banner">
					<h2>MusleFive</h2>
					<%if(loginMember != null){ %>
					<h1><font color="white"><%= loginMember.getId()%>님 환영합니다~~</font></h1>
					<ul class="actions special">
						<li><a href="main.jsp" class="button ">main</a></li>
								<li><a href="#" class="button ">routin</a></li>
							<li><a href="community.jsp" class="button ">community</a></li>
							<li><a href="generic.jsp" class="button ">Map</a></li>
							</ul>
							<%} else {%>
							<h1><font color="white">로그인이 필요합니다.</font></h1>
							<ul class="actions special">
							<li><a href="main.jsp" class="button ">main</a></li>
							<li><a href="#" class="button ">routin</a></li>
							<li><a href="community.jsp" class="button ">community</a></li>
							<li><a href="generic.jsp" class="button ">Map</a></li>
							</ul>
						<%} %>
				</section>
				       
                  
                     <div class="section">
                         <div class="inner txt-cnt wow fadeInUp delay-1s">
                            <img src="#" alt="">
                     </div>
                      </div>
                   
                      <div class="section nav-mk pt-0">
                         <div class="inner">
                            <ul class="thumb-list">
                           
                            </ul>
                     </div>
                      </div>
						</header>
						
					
					<div class="row" id="muscle">
						<div class="col-6 ">
							<form action="compositionCon">
							<section class="box special" >
								<h3 id="font">채성분 입력</h3>
								<pre>체중<input type="text" name="weight"></pre>
								<pre>골격근량<input type="text" name="muscle"></pre>
								<pre>체지방량<input type="text" name="fat"></pre>
								<br>
								<input type="submit" value="제출">
							</section>
							</form>
						</div>
						
						
						<div class="col-6" >
							<section class="box special" id="big-box">
								<div id="insta_main" align="left">
									<img id="insta" src="인스타사진2.png"> <span   id="user-name">MuscleFive</span>
								</div>
								<pre id="box">
									<h3 id="font">추천운동부분입니다!!!!!</h3>
									<div id="s-box">
										<pre>팔굽혀펴기 max : </pre>
										<pre>턱걸이 max : </pre>
										<pre>이것저것 max : </pre>
									</div>
								</pre>
								<div id="btn-good">
									<button id='like1'>👍</button><span id='span1'>0</span>
								</div>
								<div id="btn_group">
									<button  id="prev">prev</button>
									<button  id="next">next</button>
								</div>
							</section>
						</div>
					</div>

						<div class="col-4 col-12-narrower" id="calendar">
							<section class="box special">
								<span class="image featured"><img src="images/pic03.jpg" alt="" /></span>
								<h1 id="font">캘린더부분입니다!!!!!!!!!!!!</h1>
							</section>
						</div>

			<!-- CTA -->
				<section id="cta">
					<p>팀 옴므파탈 제공</p>
					<p>tel : 062-655-3506</p>
					<p>주소 : 전라남도 순천시 중앙로 260</p>
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
			<script>
				$(document).on('click', '#like1', function() {
					let like = Number($('#span1').text())
					$('#span1').text(like + 1)
					$(this).text('👎')
					$(this).attr('id', 'dislike1')
				})
		
				$(document).on('click', '#dislike1', function() {
					$('#span1').text('0')
					$(this).text('👍')
					$(this).attr('id', 'like1')
				})
			</script>

	</body>
</html>