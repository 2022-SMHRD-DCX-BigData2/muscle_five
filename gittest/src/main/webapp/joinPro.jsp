<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />

    <style>
        #wrap{
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
</head>
<body class="landing is-preload">
	<!-- join.jsp에서 입력한 정보를 넘겨 받아 처리 -->
    <% 
        // 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("UTF-8"); 
    
        // getParameter()를 이용해 넘겨진 파라미터 값을 얻어올 수 있다.
        // 파라미터 값을 얻을때 name= 에 지정해둔 값과 동일한 값을 인자로 지정해야 된다.
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        
        // 성별의 경우 파라미터 이름이 둘다 gender로 동일하므로 배열로 받아야 된다.
        String[] gender = request.getParameterValues("gender");
        String birth_yy = request.getParameter("birth_yy");
        
        // 생일의 경우 <select>로 되어 있는데 파라미터 값을 받을 시 배열형태로 넘겨 받는다.
        String[] birth_mm = request.getParameterValues("birth_mm");
        String birth_dd = request.getParameter("birth_dd");
        String email1 = request.getParameter("email_1");
        
        // 이메일의 경우 <select>로 되어 있는데 파라미터 값을 받을 시 배열형태로 넘겨 받는다.
        String[] email2 = request.getParameterValues("email_2");
    %>
    <!-- Header -->
	<header id="header" class="alt">
		<h1><a href="main.html">MusleFive</a></h1>
		<nav id="nav">
			<ul class="links">
				<li><a href="login.jsp" class="button">Login</a></li>
				<li><a href="join.jsp" class="button">Sign Up</a></li>
			</ul>
		</nav>
	</header>
	
    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=id %></font>님 가입을 축하드립니다.
        <br><br>
        
        <table>
        
            <tr>
                <td id="title">아이디</td>
                <td><%=id %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=pw %></td>
            </tr>
                    
            <tr>
                <td id="title">성별</td>
                <td>
                <%
                    // 배열로 넘겨받은 값을 처리하기 위해 for문 이용
                    for(String g : gender){
                        out.println(g);
                    }
                %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">생일</td>
                <td>
                <%=birth_yy %>년 
                <%
                    // 배열로 넘겨받은 값을 처리하기 위해 for문 이용
                    for(String mm : birth_mm){
                        out.println(mm);
                    }        
                %>월 <%=birth_dd %>일
                </td>
            </tr>
                    
            <tr>
                <td id="title">이메일</td>
                <td>
                    <%=email1 %>
                    <%
                    // 배열로 넘겨받은 값을 처리하기 위해 for문 이용
                    for(String e : email2){
                        out.println("@"+e);
                    }        
                    %>
                </td>
            </tr>
            
        </table>
        
        <br>
        <input type="button" value="확인">
        
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