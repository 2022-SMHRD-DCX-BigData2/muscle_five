<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	<%-- <%
        String id = session.getAttribute("sessionID").toString();
    
        MemberDAO dao = MemberDAO.getInstance();
        Member member = dao.getUserInfo(id);
    %> --%>
 
    <title>회원정보 수정화면</title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
        }
        
    </style>
    
    <script type="text/javascript">
    
        /* function init(){
            setComboValue("${loginMember.mail2}");
        }
 
        function setComboValue(val) {
            var selectMail = document.getElementById('mail2'); // select 아이디를 가져온다.
            for (i = 0, j = selectMail.length; i < j; i++) { // select 하단 option 수만큼 반복문 돌린다.
                if (selectMail.options[i].value == val) { // 입력된 값과 option의 value가 같은지 비교
                	selectMail.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
        }
         */
         
        // 비밀번호 입력여부 체크
        function checkValue() {
            if(!document.userinfo.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
        }
        
    </script>
</head>
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
						
						<br><br>
				        <b><font size="6" color="gray">u회원정보 수정</font></b>
				        <br><br><br>
				        
				        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
				        <!-- 값(파라미터) 전송은 POST 방식 -->

				        <form method="post" action="modyfyCon" >
		                
				            <table>
				                <tr>
				                    <td id="title">아이디</td>
				                    <td id="title">${loginMember.id}</td>
				                </tr>
				                <tr>
				                    <td id="title">비밀번호</td>
				                    <td>
				                        <input type="password" name="pw" maxlength="50" 
				                            value="${loginMember.pw}">
				                    </td>
				                </tr>
				            </table>    
				            <br><br>    
				            <table>
				                <tr>
				                    <td id="title">성별</td>
				                    <td>
				                    	<select name="gender">
						                     <option value="${loginMember.gender}"> 남 </option>
						                     <option value="${loginMember.gender}"> 여 </option>
						               	</select>
						            </td>
				                </tr>
				                    
				                <tr>
				                    <td id="title">생일</td>
				                    <td>
				                        <input type="text" name="birth_yy" maxlength="4" value="${loginMember.birth_dd}" placeholder="년(4자)" size="6" >
				                        <select name="birth_mm">
						                    <option value="${loginMember.birth_mm}">월</option>
						                    <option value="01" >1</option>
						                    <option value="02" >2</option>
						                   	<option value="03" >3</option>
						                    <option value="04" >4</option>
						                    <option value="05" >5</option>
						                    <option value="06" >6</option>
						                    <option value="07" >7</option>
						                    <option value="08" >8</option>
						                    <option value="09" >9</option>
						                    <option value="10" >10</option>
						                    <option value="11" >11</option>
						                    <option value="12" >12</option>
						                </select>
				                        <input type="text" name="birth_dd" maxlength="2" value="${loginMember.birth_dd}" placeholder="일" size="4" >
				                    </td>
				                </tr>
				                <tr>
				                    <td id="title">이메일</td>
				                    <td>
				                        <input type="text" name="mail1" maxlength="50" 
				                            value="${loginMember.mail1}">
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
				            <input type="submit" value="수정">  
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