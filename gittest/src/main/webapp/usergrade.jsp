<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>   
<%@ page import="com.smhrd.domain.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Member loginMember = (Member)request.getAttribute("loginMember");
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
<title>회원등급 변경 페이지</title>
	<style type="text/css">
	
        table{	
        
       		width : 1000px;
       		
            margin-left:auto; 
            	
            margin-right:auto;
        }
        
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
	<div id="page-wrapper">

			<!-- Header -->
				<header id="header" class="alt">
					<h1><a href="main.jsp">MusleFive</a> </h1>
					<nav id="nav">
						<ul>
							<li><a href="userinfo.jsp" class="button">회원관리</a></li>
							<li><a href="logoutCon" class="button">Log out</a></li>
							<li><a href="modify.jsp" class="button">개인정보수정</a></li>
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
						<li><a href="BoardList.jsp" class="button ">community</a></li>
						<li><a href="generic.jsp" class="button ">Map</a></li>
					</ul>
				</section>
				
				
				<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">
					
						<form action="usergradeCon" method="post">
							<input type="hidden" name="id" value="id">
							<input type="hidden" name="pw" value="pw">
							<input type="hidden" name="grade" value="grade">
							<table align="center">
								<col width='50'><col width='100'>
									<br>
									<h2 align="center">[회원등급 변경]</h2>
									<br>
									
								<tr align="center">
									<td id="title">아이디</td>
									<td id="title"><input name="id" value="<%=loginMember.getId() %>"></td>
								</tr>
								<tr align="center">
									<td id="title">회원등급</td>
									<td id="title">
										<select name="grade">
											<option value="준회원" <%=loginMember.getGrade().equals("준회원")?"selected":"" %> >준회원</option>
											<option value="정회원" <%=loginMember.getGrade().equals("정회원")?"selected":"" %> >정회원</option>
											<option value="특별회원" <%=loginMember.getGrade().equals("특별회원")?"selected":"" %>>특별회원</option>
											<option value="관리자" <%=loginMember.getGrade().equals("관리자")?"selected":"" %>>관리자</option>
										</select>	
									</td>
								</tr>
								<tr align="right">
									<td colspqn="2">
										<input type="submit" value="변경하기" class="button alt small">
									</td>
								</tr>
								<!-- <tr>
									<td align="right">
										<input type="submit" value="변경하기" class="button special small">
									</td>
								</tr> -->
							</table>32
						</form>
						
					</nav>		
					<p align="center"><a href="userinfo.jsp" class="button next scrolly">되돌아가기</a></p>
			</div>
				
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