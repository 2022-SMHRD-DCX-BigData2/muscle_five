<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.smhrd.domain.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>게시판 목록</title>
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

			<!-- Main -->
				<section id="main" class="container">
					<header>
						<h2>COMMUNITY</h2>
						<p>헬창, 헬린이 소통의 공간</p>
					</header>
					<div class="row">
						<div class="col-12">
							<div id="wrap">

								<!-- 게시판 만들기 -->
								<!-- 글목록 위 부분-->
								<br>
								
								<div id="topForm" align="right">
									<c:if test="${sessionScope.sessionID!=null}">
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
										<c:forEach var="board" items="${requestScope.list}">
											<tr align="right">
												<td>${board.board_num}</td>
												<td><a href="BoardDetail.jsp">${board.board_title}</a></td>
												<td><a href="BoardDetail.jsp">${board.board_num} </a></td>
												<td>${board.board_date}</td>
												<td>${board.board_views}</td>
											</tr>
										</c:forEach>
									</table>
								</div>
						
								<!-- 페이지 넘버 부분 -->
								<br>
								<div id="pageForm"  align="center">
									<c:if test="${startPage != 1}">
										<a href='BoardListCon?page=${startPage-1}'>[ 이전 ]</a>
									</c:if>
						
									<c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
										<c:if test="${pageNum == spage}">
						                	${pageNum}
						            	</c:if>
										<c:if test="${pageNum != spage}">
											<a href='BoardListCon?page=${pageNum}'>${pageNum}</a>
										</c:if>
									</c:forEach>
									<c:if test="${endPage != maxPage }">
										<a href='BoardListCon?page=${endPage+1}'>[다음]</a>
									</c:if>
								</div>
						
								<!--  검색 부분 -->
								<br>
								<div id="searchForm" align="center">
									<form>
										<table>
											<tr>
												<td>
													<select name="opt">
														<option value="0">제목</option>
														<option value="1">내용</option>
														<option value="2">제목+내용</option>
														<option value="3">글쓴이</option>
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