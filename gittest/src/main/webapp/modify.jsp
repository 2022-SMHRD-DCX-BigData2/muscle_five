<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	<%
        String id = session.getAttribute("sessionID").toString();
    
        MemberDAO dao = MemberDAO.getInstance();
        Member memberBean = dao.getUserInfo(id);
    %>
 
    <title>회원정보 수정화면</title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
    </style>
    
    <script type="text/javascript">
    
        function init(){
            setComboValue("<%=member.getMail2()%>");
        }
 
        function setComboValue(val) {
            var selectMail = document.getElementById('mail2'); // select 아이디를 가져온다.
            for (i = 0, j = selectMail.length; i < j; i++) { // select 하단 option 수만큼 반복문 돌린다.
                if (selectMail.options[i].value == val) { // 입력된값과 option의 value가 같은지 비교
                	selectMail.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
        }
        
        // 비밀번호 입력여부 체크
        function checkValue() {
            if(!document.userinfo.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
        }
        
    </script>
</head>
<body onload="init()">
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
				        <b><font size="6" color="gray">회원정보 수정</font></b>
				        <br><br><br>
				        
				        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
				        <!-- 값(파라미터) 전송은 POST 방식 -->
				        <form method="post" action="main.jsp?contentPage=modifyPro.jsp" 
				                name="userinfo" onsubmit="return checkValue()">
				                
				            <table>
				                <tr>
				                    <td id="title">아이디</td>
				                    <td id="title"><%=member.getId() %></td>
				                </tr>
				                <tr>
				                    <td id="title">비밀번호</td>
				                    <td>
				                        <input type="password" name="pw" maxlength="50" 
				                            value="<%=member.getPassword()%>">
				                    </td>
				                </tr>
				            </table>    
				            <br><br>    
				            <table>
				                <tr>
				                    <td id="title">성별</td>
				                    <td><%=member.getGender()%></td>
				                </tr>
				                    
				                <tr>
				                    <td id="title">생일</td>
				                    <td>
				                        <%=member.getBirthyy() %>년 
				                        <%=member.getBirthmm() %>월 
				                        <%=member.getBirthdd() %>일
				                    </td>
				                </tr>
				                <tr>
				                    <td id="title">이메일</td>
				                    <td>
				                        <input type="text" name="mail1" maxlength="50" 
				                            value="<%=member.getMail1() %>">
				                        @
				                        <select name="mail2" id="mail2">
				                            <option value="naver.com">naver.com</option>
				                            <option value="gmail.com">gmail.com</option>
				                            <option value="daum.net" >daum.net</option>
				                            <option value="nate.com">nate.com</option>                        
				                        </select>
				                    </td>
				                </tr>
				            </table>
				            <br><br>
				            <input type="button" value="취소" onclick="location.href='main.jsp'">
				            <input type="submit" value="수정"/>  
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