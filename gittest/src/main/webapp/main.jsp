<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.MemberDAO"%>
<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.smhrd.domain.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Member loginMember = (Member)session.getAttribute("loginMember");

	MemberDAO dao = new MemberDAO();
	
	List<Member> likeCnt = dao.selectExerciseCnt();
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>muslefive</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />

		<style>
		.inbodyimg{
			width : 200px;
			height : 200px;
		}
		#font{
			color : rgb(255,255,255);
		}
		
		</style>
		<script type="text/javascript">
			function gologin() {
	            //location.href="login.jsp";
	            alert("회원 전용입니다. 로그인 해주세요.");
	        }
		</script>
</head>
<body class="landing is-preload"  >
	<div id="page-wrapper">
	
			<!-- Header -->
				<header id="header" class="alt">
					<h1><a href="main.jsp">MusleFive</a></h1>
					<nav id="nav">
						<ul class="links">
						<c:choose>
							<c:when test="${empty loginMember}">
								<li><a href="login.jsp" 
								class="button">Log in</a></li>
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
					<h1 style="margin : 0 0 1em;"><font color="white"><%= loginMember.getId()%>님 환영합니다~~</font></h1>
					<ul class="actions special">
						<li><a href="main.jsp" class="button ">main</a></li>
						<li><a href="routin.jsp" class="button ">routin</a></li>
						<li><a href="BoardList.jsp" class="button ">community</a></li>
						<li><a href="inbodyMap.jsp" class="button ">Map</a></li>
					</ul>
					<%} else {%>
					<h1 style="margin : 0 0 1em;"><font color="white">로그인이 필요합니다.</font></h1>
					<ul class="actions special">
						<li><a href="main.jsp" class="button ">main</a></li>
						<li><a href="login.jsp" class="button " onclick="gologin()">routin</a></li>
						<li><a href="login.jsp" class="button " onclick="gologin()">community</a></li>
						<li><a href="inbodyMap.jsp" class="button ">Map</a></li>
					<ul>
						<%} %>
				</section>

			<!-- Main -->
				<section id="main" class="container">
					<section class="box special">
						<header class="major">
							<h2 style="font-weight:400; font-size:45px;"> What is Body Composition?</h2>
							<div class="content-wrap n-tech">
                <div class="content">
                    <div class="n-tech-what">
                       <div class="inner wow fadeInDown delay-02s">
                          <p style="font-size:20px" align="left" > 체성분이란 인체를 구성하고 있는 성분을 말합니다. <br>인체의 구성성분을 분류하는 방법은 아래 이미지와 같이 여러 가지 방식이 있습니다.<br>인바디는 이 중 분자적개념(Molecular)을 이용하여<br> 체수분, 단백질, 무기질, 체지방의 네 가지 체성분을 정량적으로 제공합니다.<br>
이러한 구성 성분의 비율은 성별과 나이, 개개인의 특성에 따라 차이를 보이며 건강과 밀접한 관련이 있습니다. <br>영양상태에 문제가 없는지, 몸이 부어 있지는 않은지, <br >신체가 균형있게 발달하고 있는지 등 체성분분석을 통해 몸의 상태를 정확하게 파악할 수 있습니다. </p>
                       </div>
                       	
                       <br>
                       <br>
                       <hr>               

                       <section class="box special features">
						<div class="features-row">
							<section >
								<img src="images/체수분사진.png" class="inbodyimg" style="margin : 0 0 0.5em;" ></img>
								<h3>체수분</h3>
								<p align="left" style="font-size:20px">체수분은 우리 몸에서 가장 많은 체성분으로 우리 몸의 <br>모든 세포와 체액에 분포돼 있습니다. 체수분은 영양소와 노폐물을 운반하고, 혈액의 주성분이 되어 인체 내 물질의 이동통로가 되고 여러 화학반응의 매개가 되는 역할을<br>합니다.</p>
							</section>
							<section>
								<img src="images/단백질사진.png" class="inbodyimg" style="margin : 0 0 0.5em;"></img>
								<h3>골격근</h3>
								<p align="left" style="font-size:20px">단백질은 근육 뿐만 아니라 뼈, 피부, 머리카락 등 신체 <br>조직의 주요 성분 성분입니다. 단백질 결핍은 인체 기능이<br> 원할히 수행되지 않아 건강이 위험할 수 있으며 소아의<br> 경우 성장이 저하될 수 있습니다.</p>
							</section>
						</div>
						<div class="features-row">
							<section>
								<img src="images/미네랄사진.png" class="inbodyimg" style="margin : 0 0 0.5em;"></img>
								<h3>무기질</h3>
								<p align="left" style="font-size:20px">무기질은 생명과 건강을 유지하는데 필수적인  <br>영양소 입니다. 무기질은 체내에서 여러 물질의 구성 요소가 되며 생리현상을 조절합니다. 무기질의 부족은 <br>성장부진, 골다공증 등의 위험이 나타날 수 있습니다. </p>
							</section>
							<section>
								<img src="images/체지방.png" class="inbodyimg" style="margin : 0 0 0.5em;"></img>
								<h3>체지방</h3>
								<p align="left" style="font-size:20px">체지방은 인체를 구성하고 있는 성분 중 하나로 에너지를 저장하는 창고입니다. 분포에 따라 비만과 대사증후군의 원인이 됩니다.  <br>체지방의 지나친 부족은 면역력 저하, 호르몬 불균형이 <br>생길 수 있어 적당한 수준을 유지하는 것이 중요합니다.</p>
							</section>
						</div>
					</section>
                       
                  
                     <div class="section">
                         <div class="inner txt-cnt wow fadeInUp delay-1s">
                            <img src="#" alt="">
                     	 </div>
                     </div>
                   
                      <div class="section nav-mk pt-0">
                         <div class="inner">
                            <ul class="thumb-list">
                            </ul>
                    	 </div>
                      </div>
						</header>
					</section>

					<div class="col-12" >
							<section class="box special "  alt="">
								<h3>추천 운동 랭킹</h3>
								<%
								int cnt = 0;
								for(Member i : likeCnt){
									cnt ++;
									if(cnt < 4){
										if(i.getType() < 4){
								%>
											<pre>NOVICE <%=i.getType()%> LEVEL <b style="color:red">❤</b> : <%=i.getLikeCnt() %></pre> 
								<%} else if(i.getType() < 7){ %>
											<pre>NORMAL <%= i.getType() %> LEVEL <b style="color:red">❤</b> : <%=i.getLikeCnt() %></pre> 
									
								<%}else{ %>	
											<pre>ADVANCE <%= i.getType() %> LEVEL <b style="color:red">❤</b> : <%=i.getLikeCnt() %></pre> 
								<%}}} %>
								
							</section>
					</div>
				</section>

			<!-- CTA -->
				<section id="cta">
					<p>팀 옴므파탈 제공</p>
					<p>tel : 062-655-3506</p>
					<p>주소 : 전라남도 순천시 중앙로 260</p>
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