<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.smhrd.domain.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>muslefive</title>
	<link rel="stylesheet" href="assets/css/main.css" />
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
    
	        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수 (유효성 검사)
	        function checkValue()
	        {
	            if(!document.userinfo.id.value){
	                alert("아이디를 입력하세요.");
	                return false;
	            }
	            
	            if(form.reid.value != "idCheck"){
	                alert("아이디 중복체크를 해주세요.");
	                return false;
	            }
	            
	            if(!document.userinfo.pw.value){
	                alert("비밀번호를 입력하세요.");
	                return false;
	            }
	            
	            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	            if(document.userinfo.pw.value != document.userinfo.pwcheck.value){
	                alert("비밀번호를 동일하게 입력하세요.");
	                return false;
	            }
	            
	            if(!form.birth_yy.value){
	                alert("년도를 입력하세요.");
	                return false;
	            }
	            
	            if(form.birth_mm.value == "00"){
	                alert("월을 선택하세요.");
	                return false;
	            }
	            
	            if(!form.birth_dd.value){
	                alert("날짜를 입력하세요.");
	                return false;
	            }
	            
	            if(!form.mail_1.value){
	                alert("메일 주소를 입력하세요.");
	                return false;
	            }
	        }
	        
	        function checkJoin(){
	        	if(document.userinfo !=null){
	        		alert("회원가입에 성공하였습니다.");
	                return false;
	        	}
	        }
	        
	        // 취소 버튼 클릭시 '로그인 화면'으로 이동
	        function gojoin() {
	            location.href="login.jsp";
	        }
	        
	        // 아이디 중복체크 화면open
	        function idCheck(){
	        	if (!document.userinfo.id.value){
	        		 alert("아이디를 입력하세요.");
	        		 document.userinfo.id.focus();
	        		 return
	        	}
	        	var id = document.userinfo.id.value
	        	//idcheck.jsp는 idCheck 서블릿으로 요첨함.
	        	var url = "idcheck.jsp?id=" + id;
	            window.open(url, "_blank_1", "width = 500, height = 300, resizable = no, scrollbars = no"); 

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
							<li><a href="login.jsp" class="button">Log in</a></li>
							<li><a href="#" class="button">Sign Up</a></li>
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
						        <br><br>
						        <b><font size="6" color="gray">회원가입</font></b>
						        <br><br>
						     	<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        						<!-- 값(파라미터) 전송은 POST 방식으로, 전송할 페이지는 joinPro.jsp -->

						        <form action="joinCon" method="post" name="userinfo" onsubmit="return checkValue()">
						            <table>
						                <tr>
						                    <td id="title">아이디</td>
						                    <td>
						                        <input type="text" name="id" maxlength="50">
                       							<input type="button" value="중복확인" onclick="idCheck()">  
                       							<input type="hidden" name="reid" size="20" value="idUncheck">  
						                    </td>
						                </tr>
						                        
						                <tr>
						                    <td id="title">비밀번호</td>
						                    <td>
						                        <input type="password" name="pw" maxlength="20">
						                    </td>
						                </tr>
						                
						                <tr>
						                    <td id="title">비밀번호 확인</td>
						                    <td>
						                        <input type="password" name="pwcheck" maxlength="20">
						                    </td>
						                </tr>
						                    
						                <tr>
						                    <td id="title">성별</td>
						                    <td>
						                    	<select name="gender">
						                        	<option value="남"> 남 </option>
						                       	 	<option value="여"> 여 </option>
						                       	</select>	
						                    </td>
						                </tr>
						                    
						                <tr>
						                    <td id="title">생일</td>
						                    <td>
						                        <input type="text" name="birth_yy" maxlength="4" placeholder="년(4자)" size="6" >
						                        <select name="birth_mm">
						                            <option value="">월</option>
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
						                        <input type="text" name="birth_dd" maxlength="2" placeholder="일" size="4" >
						                    </td>
						                </tr>
						                    
						                <tr>
						                    <td id="title">이메일</td>
						                    <td>
						                        <input type="text" name="mail1" maxlength="30">@
						                        <select name="mail2">
						                            <option value="naver.com">naver.com</option>
						                            <option value="daum.net">daum.net</option>
						                            <option value="gmail.com">gmail.com</option>
						                            <option value="nate.com">nate.com</option>                        
						                        </select>
						                    </td>
						                    <td id="title"><input type="hidden" name="grade" value="준회원"></td>
						                </tr>
						            </table>
						            <br>
						            <a href="login.jsp"><input type="submit" value="가입하기"/></a>
						            <a href="login.jsp"><input type="button" value="취소" onclick="goJoin()"></a>
						        </form>
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