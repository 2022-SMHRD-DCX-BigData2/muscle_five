<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
		
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
		
		<script type="text/javascript">
		
		 // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	        function checkValue()
	        {
	            input = eval("document.logininfo");
	            if(!input.id.value)
	            {
	                alert("아이디를 입력하세요");    
	                input.id.focus();
	                return false;
	            }
	            if(!input.pw.value)
	            {
	                alert("비밀번호를 입력하세요");    
	                input.pw.focus();
	                return false;
	            }
	        }
	    
	        // 회원가입 버튼 클릭시 회원가입 화면으로 이동
	        function goJoin() {
	            location.href="join.jsp";
	        }    
	        
    	</script>
</head>
<body class="landing is-preload">
	<div id="page-wrapper">

			<!-- Header -->
				<header id="header" class="alt">
					<h1><a href="main.jsp">MusleFive</a> </h1>
					<nav id="nav">
						<ul>
							<li><a href="#" class="button">Log in</a></li>
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
						        <form action="loginCon" name="logininfo" method="post" 
						                onsubmit="return checkValue()">
						            <table>
						                <tr>
						                    <td>아이디</td>
						                    <td><input type="text" name="id" maxlength="50"></td>
						                </tr>
						                <tr>
						                    <td>비밀번호</td>
						                    <td><input type="password" name="pw" maxlength="50"></td>
						                </tr>
						            </table>
						            <br>
						            <input type="submit" value="로그인"/>
						            <a href="join.jsp"><input type="button" value="회원가입" onclick="goJoin()" /></a>
						        </form>
						      	<%--
						            // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
						            // LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
						            String msg = request.getParameter("msg");
						            
						            if(msg != null && msg.equals("0")) 
						            {
						                out.println("<br>");
						                out.println("비밀번호를 확인해 주세요.");
						            }
						            else if(msg != null && msg.equals("-1"))
						            {    
						                out.println("<br>");
						                out.println("아이디를 확인해 주세요.");
						            }
						      	--%> 
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