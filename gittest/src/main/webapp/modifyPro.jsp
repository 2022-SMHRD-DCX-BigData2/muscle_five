<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
 	<title>회원정보 수정처리</title>
 	
</head>
<body class="landing is-preload">
    
	<body class="landing is-preload">
	
		<div id="page-wrapper">
		
				<!-- Header -->
					<header id="header" class="alt">
						<h1><a href="main.jsp">MusleFive</a></h1>
						<nav id="nav">
							<ul class="links">
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
						<li><a href="main.html" class="button ">main</a></li>
						<li><a href="routin.html" class="button ">routin</a></li>
						<li><a href="community.html" class="button ">community</a></li>
						<li><a href="generic.html" class="button ">Map</a></li>
					</ul>
				</section>

			<!-- Main -->
				<section id="main" class="container">
					<section class="box special">
						<header class="major">
						    <%
						    	request.setCharacterEncoding("UTF-8");
						    
						        // 세션에서 아이디를 가져와 Member에 세팅
						    	HttpSession session = request.getSession();
						        Member loginMember = (Member) session.getAttribute("loginMember");
								String id = loginMember.getId();
						        member.setId(id);
						    	
						        // pw, gender, birth_yy, birth_mm, birth_dd, mail1, mail2 파라미터 수집
						        String pw = request.getParameter("pw");
						        String gender = request.getParameter("gender");
						        String birth_yy = request.getParameter("birth_yy");
						        String birth_mm = request.getParameter("birth_mm");
						        String birth_dd = request.getParameter("birth_dd");
						        String birth = birth_yy + birth_mm + birth_dd;
						        String mail1 = request.getParameter("mail1");
						        String mail2 = request.getParameter("mail2");
						        String mail = mail1 + "@" + mail2;
								
						        Member update = new Member(pw, gender, birth, mail);
						        
						        // 수정할 회원정보를 담고있는 Member을 DAO로 전달하여 회원정보 수정을 한다.
						        MemberDAO dao = MemberDAO.getInstance();
						        dao.updateMember(member);
						    %>
						    <br><br>
						    <font size="5" color="gray">회원정보가 수정되었습니다.</font>
						    <br><br>
						    <input type="button" value="메인으로" onclick="location.href='main.jsp'"/>
				    	</header>
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