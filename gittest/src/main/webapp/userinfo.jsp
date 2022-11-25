<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>    
<%@page import="com.smhrd.domain.MemberDAO"%>
<%@ page import="com.smhrd.domain.Member"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	MemberDAO dao = new MemberDAO();
	List<Member> memberList = dao.selectAll();
%>
<html>
<head>
<meta charset="UTF-8">
<title>현재 회원정보 출력화면</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<style type="text/css">
	
        table{
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
    <script type="text/javascript">
    
    </script>
</head>
<body class="landing is-preload">
	<div id="page-wrapper">

			<!-- Header -->
				<header id="header" class="alt">
					<h1><a href="main.jsp">MusleFive</a> </h1>
					<nav id="nav">
						<ul>
							<li><a href="#" class="button">회원관리</a></li>
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
						<li><a href="community.jsp" class="button ">community</a></li>
						<li><a href="generic.jsp" class="button ">Map</a></li>
					</ul>
				</section>
				
				
				<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<table>
							<br>
							<caption><h2>회원관리페이지</h2></caption>
							<br>
							<tr></tr>
							<tr align="center">
								<td><font size="6" color="black">[아이디]</font></td>
								<td><font size="6" color="black">[성별]</font></td>
								<td><font size="6" color="black">[이메일]</font></td>		
								<td><font size="6" color="black">[회원관리]</font></td>					
							</tr>
							<!-- 2.모든 회원의 이메일(email),전화번호(tel),주소(address)를 출력하시오. -->
							<%for(Member m : memberList ){ %>
							<tr  align="center">
								<td><%=m.getId() %></td>
								<td><%=m.getGender() %></td>
								<td><%=m.getMail1() + '@' +  m.getMail2()%></td>
								<td><a href="deleteCon?id=<%= m.getId() %>" class="button special small">회원삭제</a></td>
							</tr>
							<%} %>
						</table>
					</nav>		
					<p align="center"><a href="main.jsp" class="button next scrolly">되돌아가기</a></p>
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