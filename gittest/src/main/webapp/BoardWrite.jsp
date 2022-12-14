<%@page import="com.smhrd.boarddomain.Member_Board"%>
<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.smhrd.domain.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	
	Member_Board updateBoardNum = null;
	if(session.getAttribute("updateBoardNum") != null){
		updateBoardNum = (Member_Board)session.getAttribute("updateBoardNum");
	}
		
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>게시판 글쓰기</title>
	<style type="text/css">
       	 	#title{
            	height : 16;
            	font-family :'돋움';
            	font-size : 12;
            	text-align : center;
        	}
    	</style>
</head>
<body class="is-preload">
	<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<h1><a href="main.jsp">MusleFive</a></h1>
					<nav id="nav">
						<ul>
							<c:choose>
				
							<c:when test="${empty loginMember}">
								<li><a href="login.jsp" class="button">Log in</a></li>
								<li><a href="join.jsp" class="button">Sign up</a></li>
							</c:when>
							
							<c:otherwise>
							
								<c:if test="${loginMember.id eq 'admin'}">
									<li><a href="userinfo.jsp" class="button">회원관리</a></li>
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
					<h2 style="font-family : JSArirang-Regular">MusleFive</h2>
					<%if(loginMember != null){ %>
					<h1><font color="white"><%= loginMember.getId()%>님 환영합니다~~</font></h1>
					<ul class="actions special">
						<li><a href="main.jsp" class="button">main</a></li>
						<li><a href="routin.jsp" class="button">routin</a></li>
						<li><a href="BoardList.jsp" class="button">community</a></li>
						<li><a href="inbodyMap.jsp" class="button">Map</a></li>
					</ul>
					<%} else {%>
					<h1 style="margin : 0 0 1em;"><font color="white">로그인이 필요합니다.</font></h1>
					<ul class="actions special">
						<li><a href="main.jsp" class="button">main</a></li>
						<li><a href="login.jsp" class="button" onclick="gologin()">routin</a></li>
						<li><a href="login.jsp" class="button" onclick="gologin()">community</a></li>
						<li><a href="login.jsp" class="button" onclick="gologin()">Map</a></li>
					<ul>
						<%} %>
				</section>
				
			<!-- Main -->
				<section id="main" class="container">
					<header>
						<h2>COMMUNITY</h2>
						<p>헬창, 헬린이 소통의 공간 </p>
					</header>
					<div class="row">
						<div class="col-12">
						
							<div align="center">
								<font size="6" color="gray">글쓰기</font>
						   	</div>
						   	<br>
						    <%if(updateBoardNum == null){ %>
						    <form method="post" action="BoardWriteCon" name="BoardWirte" enctype="multipart/form-data">
							    <input type="hidden" name="board_id" value="${loginMember.id}">
							    <input type="hidden" name="id_num" value=<%=loginMember.getId_num()%>>
								    <table width="700" border="3" bordercolor="lightgray" align="center">
								        <tr>
								            <td id="title">작성자</td>
								            <td>${loginMember.id}</td>
								        </tr>
								            <tr>
								            <td id="title">
								                제 목
								            </td>
								            <td>
								                <input name="board_title" type="text" size="70" maxlength="100" value=""/>
								            </td>        
								        </tr>
								        <tr>
								            <td id="title">
								                내 용
								            </td>
								            <td>
								                <textarea name="board_content" cols="72" rows="20"></textarea>            
								            </td>        
								        </tr>
								        <tr>
								            <td id="title">
								                파일첨부
								            </td>
								            <td>
								                <input type="file" name="board_file">
								            </td>    
								        </tr>
								 
								        <tr align="center" valign="middle">
								            <td colspan="5">
								            <%if(loginMember != null){ %>
								                <input type="reset" value="작성취소" >
								                <input type="submit" value="등록" >
								            <%} %>
								                <a href="BoardList.jsp"><input type="button" value="목록" ></a>           
								            </td>
								        </tr>
								    </table>    
							    </form>
							<%} else{%>	
								<form method="post" action="updataCon" name="BoardWirte" enctype="multipart/form-data">
							    <input type="hidden" name="board_id" value="${loginMember.id}">
								    <table width="700" border="3" bordercolor="lightgray" align="center">
								        <tr>
								            <td id="title">작성자</td>
								            <td>${loginMember.id}</td>
								        </tr>
								            <tr>
								            <td id="title">
								                제 목
								            </td>
								            <td>
								            	<input type="hidden" name="boardNum" value="<%=updateBoardNum.getBoard_num()%>">
								                <input name="board_title" type="text" size="70" maxlength="100" value="<%=updateBoardNum.getBoard_title()%>">
								            </td>        
								        </tr>
								        <tr>
								            <td id="title">
								                내 용
								            </td>
								            <td>
								                <textarea name="board_content" cols="72" rows="20"><%=updateBoardNum.getBoard_content()%></textarea>            
								            </td>        
								        </tr>
								        <tr>
								            <td id="title">
								                파일첨부
								            </td>
								            <td>
								                <input type="file" name="board_file" accept=".gif, .jpg, .png">
								            </td>    
								        </tr>
								 
								        <tr align="center" valign="middle">
								            <td colspan="5">
								            <%if(loginMember != null){ %>
								                <input type="submit" value="수정" >
											<%} %>
								                <a href="BoardList.jsp"><input type="button" value="목록" ></a>           
								            </td>
								        </tr>
								    </table>    
							    </form>
							
							<%
							} 
						    /* session.removeAttribute("updateBoardNum"); */
							%>							
						<!-- 게시판 끝!  -->
						
						</div>
					</div>
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