<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 화면</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
        }
        
    </style>
    	<%-- <%
			request.setCharacterEncoding("UTF-8");
				
    		HttpSession session = request.getSession();
    		Member loginMember =  (Member) session.getAttribute("loginMember");
			String pw = request.getParameter("pw");
			        
			// 세션에서 아이디를, Delete.jsp에서 입력받은 비밀번호를 가져온다.
			// 가져온 결과를 가지고 회원정보를 삭제한다. - 삭제결과를 반환
			MemberDAO dao = new MemberDAO();
			int check = dao.deleteMember(id, pw);
			        
			if(check == 1){
			            session.invalidate(); // 삭제했다면 세션정보를 삭제한다.
		%> --%>
    <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(!document.deleteform.pw.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
            if(document.deleteform.pw.value){
                alert("비밀번호가 맞지 않습니다.");
                history.go(-1);
                return false;
            }
            
        }
    </script>
    
</head>
<body>
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
						<div class="content-wrap n-tech">
						
							<br><br>
						    <b><font size="6" color="gray">내 정보</font></b>
						    <br><br>
						 
						    <form name="deleteform" method="post" action="deleteCon.jsp"
						        onsubmit="return checkValue()">
						 
						        <table>
						            <tr>
						                <td>비밀번호</td>
						                <td><input type="password" name="pw" maxlength="50"></td>
						            </tr>
						        </table>
						        
						        <br> 
						        <a href = "main.jsp"><input type="button" value="취소"></a>
						        <input type="submit" value="탈퇴" onsubmit="return checkpwValue()"/> 
						    </form>
						    
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