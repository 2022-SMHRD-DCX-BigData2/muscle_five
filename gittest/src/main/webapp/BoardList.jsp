<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.smhrd.domain.Member"%>
<%@ page import="com.smhrd.boarddomain.Member_Board"%>
<%@ page import="com.smhrd.boarddomain.BoardDAO"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Member loginMember = (Member)session.getAttribute("loginMember");

	Member_Board Board = (Member_Board)session.getAttribute("Board");
	
	String pageNum = null;
	
	if(session.getAttribute("page") == null){
		session.setAttribute("page", "1");
		pageNum = (String) session.getAttribute("page");
	}else{
		pageNum = (String) session.getAttribute("page");
	}
	
	
	
	
	

	BoardDAO dao = new BoardDAO();
	List<Member_Board> board_list = dao.BoardselectAll();
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>게시판 목록</title>	
	<style type="text/css">
        #wrap {
            width: 800px;
            margin: 0 auto 0 auto;
        }
        #topForm{
            text-align :right;
        }
        #board, #pageForm, #searchForm{
            text-align :center;
        }
        
        #bList{
            text-align :center;
        }
    </style>
    
    <script type="text/javascript">
        function writeForm(){
            location.href="BoardWriteForm.bo";
        }
    </script>

</head>
<body class="landing is-preload">
	<div id="page-wrapper">

			<!-- Header -->
				<header id="header" class="alt">
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
						<li><a href="main.jsp" class="button ">main</a></li>
						<li><a href="routin.jsp" class="button ">routin</a></li>
						<li><a href="BoardList.jsp" class="button ">community</a></li>
						<li><a href="generic.jsp" class="button ">Map</a></li>
					</ul>
					<%} else {%>
					<h1 style="color:white;">로그인이 필요합니다.</h1>
					<ul class="actions special">
						<li><a href="main.jsp" class="button ">main</a></li>
						<li><a href="routin.jsp" class="button ">routin</a></li>
						<li><a href="BoardList.jsp" class="button ">community</a></li>
						<li><a href="generic.jsp" class="button ">Map</a></li>
					<ul>
						<%} %>
				</section>
	
			<!-- Main -->
				<section id="main" class="container">
					<header>
						<h2 style="color:white;">COMMUNITY</h2>
						<p style="color:white;">헬창, 헬린이 소통의 공간</p>
					</header>
					<div class="row">
						<div class="col-12">
							<div id="wrap">

								<!-- 게시판 만들기 -->
								<!-- 글목록 위 부분-->
								<br>
								
								<div id="topForm" align="right">
									<c:if test="${loginMember.id != null}">
										<a href="BoardWrite.jsp"><input type="button" value="글쓰기" onclick="writeForm()"></a>
									</c:if>
								</div>
						
								<!-- 게시글 목록 부분 -->
								<br>
								<div id="board">
									<table id="bList" width="800" border="3" bordercolor="lightgray">
										<tr heigh="30"  align="center">
											<td>글번호</td>
											<td>제목</td>
											<td>작성자</td>
											<td>작성일</td>
											<td>조회수</td>
										</tr>
										
										<%
										int boardListCnt = 0;
										int newPageNum = Integer.parseInt(pageNum);
										for(Member_Board b : board_list ){ 
											boardListCnt ++;
											if(newPageNum == 1){	
												if(boardListCnt <= 10){%>
										<tr  align="center">
											<td><%=b.getBoard_num() %></td>
											<td><a href="BaordDetailCon?num=<%=b.getBoard_num()%>"><%=b.getBoard_title() %></a></td>
											<td><%=b.getBoard_id() %></td>
											<td><%=b.getBoard_date() %></td>
											<td><%=b.getBoard_count() %></td>
										</tr>
										<% }
												
											}else{
												if((boardListCnt > (newPageNum - 1) * 10) && (boardListCnt <= newPageNum * 10)){%>
													<tr align="center">
														<td><%=b.getBoard_num() %></td>
														<td><a href="BaordDetailCon?num=<%=b.getBoard_num()%>"><%=b.getBoard_title() %></a></td>
														<td><%=b.getBoard_id() %></td>
														<td><%=b.getBoard_date() %></td>
														<td><%=b.getBoard_count() %></td>
													</tr>
												
										
										<%			
													
												} 
											}
										}
										session.removeAttribute("page");
										
										
										%>
										
										
										
										<!--<c:forEach var="board" items="${requestScope.list}">
											<tr align="right">
												<td>${board.board_num}</td>
												<td><a href="BoardDetail.jsp">${board.board_title}</a></td>
												<td><a href="BoardDetail.jsp">${board.board_num} </a></td>
												<td>${board.board_date}</td>
												<td>${board.board_views}</td>
											</tr>
										</c:forEach>-->
										
									</table>
								</div>
						
								<!-- 페이지 넘버 부분 -->
								<br>
								<div id="pageForm"  align="center">
									<%
									int communityCnt = 0;
									for(Member_Board b : board_list ){
										communityCnt ++;
										}
									
									int pageCnt = communityCnt / 10;
									if(pageCnt == 0){%>
										<a href='BoardListCon?page=1'>[1]</a>
									
									
									<%} else{ 
										for(int i=0; i<=pageCnt; i++){%>
											<a href='BoardListCon?page=<%=i+1%>'><%="[" + (i+1) + "]"%></a>
												
									
									<%}}%>
									
									 
									
								</div>
						
								<!--  검색 부분 -->
								<br>
								<div id="searchForm" align="center">
									<form action="searchCon">
										<table>
											<tr>
												<td>
													<select name="opt">
														<option value="1">제목</option>
														<option value="2">내용</option>
														<option value="4">글쓴이</option>
													</select> 
												</td>	
												<td>
													<input type="text" size="20" name="condition" /> 
												</td>
												<td>
													<input type="submit" value="검색" />
												</td>
											</tr>
										</table>
									</form>
								</div>
							</div>
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