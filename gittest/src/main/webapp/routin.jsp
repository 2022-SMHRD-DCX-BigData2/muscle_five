<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.smhrd.domain.BodyComposition"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.compositionMember"%>
<%@page import="com.smhrd.domain.MemberDAO"%>
<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.smhrd.domain.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");

	MemberDAO dao = new MemberDAO();
	compositionMember lastComposition = dao.selectOneComposition(loginMember.getId_num());
	
	MemberDAO dao2 = new MemberDAO();
	List<BodyComposition> bodyCompositionList = dao2.bodyCompositionselectAll(loginMember.getId_num());
	
	
	
%>
<!DOCTYPE HTML>
<!--
	Alpha by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>muslefive</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" type="text/css" href="assets/css/c3.css">
		

		<style>
			/*월수금 버튼  */
			.routin_btn{
			border:solid 0.1px;
			font-size: 23px;
			font-weight : 300;
			background-color: rgba(0,0,0,0);
			border-radius: 10px;
			border-color : #e5e5e5;
			crusor:pointer;
			padding : 0 3.5em 0 3.5em;
			}
			.routin_btn button:hover {
			color : white;
			background-color: skyblue;
			}
			/* 모달관련스타일 */
			.modal {
	        position: absolute;
	        left: 0;
			top: 210%;
			left: 25%;
	        width: 50%;
	        height: 50%;
	
	        display: none;
	        padding: 40px;
	        
	
	        background-color: rgb(255, 255, 255);
		 	border-radius: 10px;
			box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	      	}
			
			
	      	
			.analysis{
			background-color: #666;
		    border-radius: 6px;
		    border: 0;
		    color: #ffffff;
		    cursor: pointer;
		    display: inline-block;
		    font-weight: 400;
		    height: 3em;
		    line-height: 3em;
		    padding: 0 2em;
		    text-align: center;
		    text-decoration: none;
		    white-space: nowrap;
		    font-size : inherit;
			}
			.analysis button:hover{
				background-color: skyblue;
				color : skyblue;
			}
			.analysis_add{
			border:none;
			background-color: #f8f8f8;
			crusor : pointer;
			}
			#insta{
			width : 50px;
			height : 50px;
			}
			
			#box{
			border : 0;
			padding : 0px;
			width : auto;
			margin-left :auto;
			border-radius : 0px;
			box-shadow : unset;
			}
			#big-box{
			border : solid 1px;
			border-color : white;
			padding : 2em;
			margin:0;
			}
			#user-name{
			font-size : 20px;
			height : 0px;
			font-weight : 400;
			}
			#btn-good button{
			border: none;
			background-color: rgba(0,0,0,0);
			color : red;
			font-size:25px;
			}
			#btn-good {
			margin-right : 400px;
			 }
			 
			#font{
			color : rgb(0,0,0);
			font-size:30px;
			}
			#calendar{
			margin : 180px;
			}		
			#divmuscle{
			margin : 150px;
			
			}		
			#prev {
			margin-right : auto;
			}
			#next {
			margin-left : auto;
			}
			#btn_group button{
				border: none;
				background-color: rgba(0,0,0,0);
				color : gray;
				padding : 5px;
				font-size:20px; 
			}
			#btn_group button:hover{
				color:skyblue;
				backrtound-color: skyblue;
			}
			</style>
			<!--   // fullcalendar css  -->
			<link rel="stylesheet" href="assets/calendarcss/main.css" /> 
			<!--   // fullcalendar js -->
			<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
			<!--   //fullcalendar 언어 설정관련 script -->
			<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
			<script type="text/javascript">
				function gologin() {
		            alert("회원 전용입니다. 로그인 해주세요.");
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
						<c:choose>
				
							<c:when test="${empty loginMember}">
								<li><a href="login.jsp" class="button">Log in</a></li>
								<li><a href="join.jsp" class="button">Sign up</a></li>
							</c:when>
							
							<c:otherwise>
							
								<c:if test="${loginMember.id eq 'admin'}">
									<li><a href="#" class="button">회원관리</a></li>
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
					<h1 style="margin : 0 0 1em;"><font color="white"><%=loginMember.getId()%>님 환영합니다~~</font></h1>
					<ul class="actions special">
						<li><a href="main.jsp" class="button">main</a></li>
						<li><a href="routin.jsp" class="button">routin</a></li>
						<li><a href="BoardList.jsp" class="button">community</a></li>
						<li><a href="inbodyMap.jsp" class="button">Map</a></li>
						
				   		
				   		
						
					</ul>
					<%} %>
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
					
					<%
					int userNum = loginMember.getId_num(); 
					if(lastComposition == null){
					%>
					<div class="row" id="divmuscle" >
						<div class="col-6 ">
							<section class="box special"  style="padding : 2.5em 2em; font-family : S-CoreDream-3Light;">
								<h5 id="font" style="margin:0 0 0.8em;">체성분 입력</h5>
								<input type="hidden" id="gender" value="<%=loginMember.getId()%>">
								<pre>체중(kg)<input style="text-align:center;" type="text" name="weight" id="weight"></pre>
								<pre>골격근량(kg)<input style="text-align:center;" type="text" name="muscle" id="muscle"></pre>
								<pre>체지방량(kg)<input style="text-align:center;" type="text" name="fat" id="fat"></pre>
								<pre>원하는 주 운동 횟수
								<select name="weeks" id="weeks">
						        	<option value="3"> 3 </option>
						        	<option value="4"> 4 </option>
						        	</select>
								</pre>
								<pre>팔굽혀펴기(max)<input type="text" name="pushup" id="pushup" style="text-align:center;">턱걸이(max)<input type="text" name="pullup" id="pullup" style="text-align:center;">
								</pre>
								<input type="submit" value="입력하기" onclick="insertCom(<%=userNum%>)">
							</section>
						</div>
						<%}else{ %>
						
						<!-- 차트 표사 div  -->
						<div id="chart"></div>
						
						
						<div class="row" id="divmuscle" >
						<div class="col-6 ">
							<section class="box special"  style="padding : 2.5em 2em; font-family : S-CoreDream-3Light;">
								<h5 id="font" style="margin:0 0 0.8em;">체성분 입력</h5>
								<input type="hidden" id="gender" value="<%=loginMember.getId()%>">
								<pre>체중(kg)<input style="text-align:center;" type="text" name="weight" id="weight" value="<%=lastComposition.getWeight()%>"></pre>
								<pre>골격근량(kg)<input style="text-align:center;" type="text" name="muscle" id="muscle" value="<%=lastComposition.getMuscle()%>"></pre>
								<pre>체지방량(kg)<input style="text-align:center;" type="text" name="fat" id="fat" value="<%=lastComposition.getFat()%>"></pre>
								<pre>원하는 주 운동 횟수
								<select name="weeks" id="weeks" value="<%=lastComposition.getWeeks()%>">
						        	<option value="3"> 3 </option>
						        	<option value="4"> 4 </option>
						        </select>
								</pre>
								<pre>팔굽혀펴기(max)<input type="text" name="pushup" id="pushup" style="text-align:center;" value="<%=lastComposition.getPushup()%>">턱걸이(max)<input type="text" name="pullup" id="pullup" style="text-align:center;" value="<%=lastComposition.getPullup()%>">
								</pre>
								<!-- 모달관련 -->
								<input type="submit" value="업데이트" onclick="insertCom(<%=userNum%>)">
								<button class="analysis" id="analysis">분석</button>
								<div class="modal">
								  <div class="modal_content" 
								       title="클릭하면 창이 닫힙니다."  >
								    여기에 모달창 내용을 적어줍니다.<br>
								    이미지여도 좋고 글이어도 좋습니다.
								  </div>
								</div>
								
							</section>
								
						</div>
						
						<%} %>
						
						<%
						if(lastComposition == null){
						%>
						<div class="col-6" >
							<section class="box special" id="big-box" style ="backgorund-color:white">
								<div id="insta_main" align="left">
									<img id="insta" src="인스타사진2.png"> <span   id="user-name" style="color : black;"> <%=loginMember.getId() %></span>
								</div><br>

								<div class="box"  style ="background-color:whitesmoke; box-shadow:inherit;" id="commendRoutin">
									<h3 id="font" style="margin : 0 0 0.5em;">추천 운동</h3>
										<pre><br><br></pre>
										<pre><br><br></pre>
										<pre><br><br></pre>
										<pre><br><br></pre>
								</div>
								<div id="btn-good">
									<button id='like1' style="float:left;">🤍</button>
								</div>
								<div id="btn_group" style="display:flex; margin : 2.4em 0 0;">
									<button id="prev">prev</button>
									<button id="next">next</button>
								</div>
							</section>
						</div>
					</div>
					<%}else{ %>
					<div class="col-6" >
							<section class="box special" id="big-box" style ="backgorund-color:white">
								<div id="insta_main" align="left">
								<input type="hidden" id="idNumber" value="<%=lastComposition.getId_num()%>">
									<img id="insta" src="인스타사진2.png"> <span   id="user-name" style="color : black;"> <%=loginMember.getId() %></span>
								</div><br>
								<div class="box"  style ="background-color:whitesmoke; box-shadow:inherit;" id="commendRoutin">
									<h3 id="font" style="margin : 0 0 0.5em;">추천 요일</h3>
									<%if(lastComposition.getWeeks() == 3){ %>
									<button class="routin_btn" onclick="selectMonday(<%=lastComposition.getType()%>)">월</button>
									<button class="routin_btn" onclick="selectWednesday(<%=lastComposition.getType()%>)">수</button>
									<button class="routin_btn" onclick="selectFriday(<%=lastComposition.getType()%>)">금</button>
									<%} else{%>
									<a onclick="">월</a>
									<a onclick="">화</a>
									<a onclick="">목</a>
									<a onclick="">금</a>
									<%} %>
										<div id="recommendRoutin">
										<pre><img src="images/푸쉬업4.png" style="width:150px; height:100px;"><%=lastComposition.getMfirst_exercise()%><pre><button class="analysis_add" id="<%=lastComposition.getMfirst_exercise().replace(" ", "")%>">운동 더보기</button></pre></pre>
										<pre><img src="images/풀업3.png" style="width:150px; height:100px;"><%=lastComposition.getMsecond_exercise()%><pre><button class="analysis_add" id="<%=lastComposition.getMsecond_exercise().replace(" ", "")%>">운동 더보기</button></pre></pre>
										<pre><img src="images/풀업3.png" style="width:150px; height:100px;"><%=lastComposition.getMthird_exercise()%><pre><button class="analysis_add" id="<%=lastComposition.getMthird_exercise().replace(" ", "")%>">운동 더보기</button></pre></pre>
										<pre><img src="images/풀업3.png" style="width:150px; height:100px;"><%=lastComposition.getMfourth_exercise()%><pre><button class="analysis_add" id="<%=lastComposition.getMfourth_exercise().replace(" ", "")%>">운동 더보기</button></pre></pre>
										</div>
										
								</div>
								<div id="btn-good">
									<button id='like1' style="float:left;">🤍</button>
								</div>
								<div id="btn_group" style="display:flex; margin : 2.4em 0 0;">
									<button onclick="prevType(<%=lastComposition.getType()%>)" id="prev">prev</button>
									<button onclick="nextType(<%=lastComposition.getType()%>)" id="next">next</button>
								</div>
							</section>
						</div>
					</div>
					
					
					<%} %>

						<!-- <div class="col-4 col-12-narrower" id="calendar">
							<section class="box special">
								<span class="image featured"><img src="images/pic03.jpg" ></span>
						
							</section>
						</div> -->
						
						<div id='calendar'></div>
						
						
						

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
	<div class="modal" id="analysis">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<p style="float:left">분석내용입니다.<br> 
			이미지여도 좋고 글이어도 좋습니다.</p>
		</div>
	</div>
	<div class="modal" id="kneepushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			kneepushup<br>
			설명
		</div>
	</div>
	<div class="modal" id="superman">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			superman<br>
			설명
		</div>
	</div>
	<div class="modal" id="plank25s">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			plank<br>
			설명
		</div>
	</div>
	<div class="modal" id="boxsquat">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			boxsquat<br>
			설명
		</div>
	</div>
	<div class="modal" id="jogging1km">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			jogging1km<br>
			설명
		</div>
	</div>
	<div class="modal" id="sprint25m">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			sprint25m<br>
			설명
		</div>
	</div>
	<div class="modal" id="jumprope">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			jumprope<br>
			설명
		</div>
	</div>
	<div class="modal" id="pushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			pushup<br>
			설명
		</div>
	</div>
	<div class="modal" id="dead hang">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			dead hang<br>
			설명
		</div>
	</div>
	<div class="modal" id="squat">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			squat<br>
			설명
		</div>
	</div>
	<div class="modal" id="widepushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			widepushup<br>
			설명
		</div>
	</div>
	<div class="modal" id="jumppullup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			jump pullup<br>
			설명
		</div>
	</div>
	<div class="modal" id="crunch">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			crunch<br>
			설명
		</div>
	</div>
	<div class="modal" id="widepushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			widepushup<br>
			설명
		</div>
	</div>
	<div class="modal" id="stop squat">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			stop squat<br>
			설명
		</div>
	</div>
	<div class="modal" id="crunch">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			crunch<br>
			설명
		</div>
	</div>
	<div class="modal" id="diamondpushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			diamond pushup<br>
			설명
		</div>
	</div>
	<div class="modal" id="chinup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			chin up<br>
			설명
		</div>
	</div>
	<div class="modal" id="legraise">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			leg raise<br>
			설명
		</div>
	</div>
	<div class="modal" id="jumpsquat">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			jump squat<br>
			설명
		</div>
	</div>
	<div class="modal" id="halfburpee">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			half burpee<br>
			설명
		</div>
	</div>
	<div class="modal" id="pikepushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			pike pushup<br>
			설명
		</div>
	</div>
	<div class="modal" id="pullup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			pullup<br>
			설명
		</div>
	</div>
	<div class="modal" id="onelegPlank">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			oneleg Plank<br>
			설명
		</div>
	</div>
	<div class="modal" id="lunge">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			lunge<br>
			설명
		</div>
	</div>
	<div class="modal" id="boxhandpushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			box hand pushup<br>
			설명
		</div>
	</div>
	<div class="modal" id="widepullup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			wide pullup<br>
			설명
		</div>
	</div>
	<div class="modal" id="onearm/onelegPlank">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			onearm/oneleg Plank<br>
			설명
		</div>
	</div>
	<div class="modal" id="jumplunge">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			jump lunge<br>
			설명
		</div>
	</div>
	<div class="modal" id="wallwalk">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			wall walk<br>
			설명
		</div>
	</div>
	<div class="modal" id="chesttobar">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			chest to bar<br>
			설명
		</div>
	</div>
	<div class="modal" id="toestobar">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			toes to bar<br>
			설명
		</div>
	</div>
	<div class="modal" id="boxpistolsquat">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			box pistol squat<br>
			설명
		</div>
	</div>
	<div class="modal" id="burpee">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			burpee<br>
			설명
		</div>
	</div>
	<div class="modal" id="wallhandstandpushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			wall hand stand pushup<br>
			설명
		</div>
	</div>
	<div class="modal" id="KneelingAbWheel">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			Kneeling Ab Wheel<br>
			설명
		</div>
	</div>
	<div class="modal" id="freestandpushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			free stand pushup<br>
			설명
		</div>
	</div>
	<div class="modal" id="Ab Wheel">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			Ab Wheel<br>
			설명
		</div>
	</div>
	<div class="modal" id="muscleup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			muscleup<br>
			설명
		</div>
	</div>
	<div class="modal" id="pistolsquat">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			pistol squat<br>
			설명
		</div>
	</div>
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	
	
	<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script>
				$(document).on('click', '#like1', function() {
					$(this).text('❤')
					$(this).attr('id', 'dislike1')
				})
		
				$(document).on('click', '#dislike1', function() {
					$(this).text('🤍')
					$(this).attr('id', 'like1')
				})
				
				
			</script>
			<!-- 캘린더 스크립트 -->

			<script src="assets/js/calendar.js"></script>
			<script type="text/javascript">
			function insertCom(userNum){
				var id_num = userNum
				var weight = document.getElementById("weight").value
				var muscle = document.getElementById("muscle").value
				var fat = document.getElementById("fat").value
				var weeks = $("#weeks option:selected").val()
				var pushup = document.getElementById("pushup").value
				var pullup = document.getElementById("pullup").value
	            $.ajax({
	               url : "compositionCon",
	               type : "get",
	               data : {
	                  "id_num" : id_num,
	                  "weight" : weight,
	                  "muscle" : muscle,
	                  "fat" : fat,
	                  "weeks" : weeks,
	                  "pushup" : pushup,
	                  "pullup" : pullup	                  
	                  
	               },
	               dataType : "json",
	               success : function(res){
	            	   
	            	   alert("업데이트완료")
	            	   
	            	   location.reload();
	            	   location.replace(location.href);
	            	   location.href = location.href;

	               },
	               error : function(){
	                  alert("Ajax 통신 실패했는데요")
	               }
	            });
	            
	            
	         }
			
			function prevType(type){
				var type = type
	            $.ajax({
	               url : "prevExercise",
	               type : "get",
	               data : {
	                  "type" : type,
	                  "id_num" : $("#idNumber").val()
	                  
	               },
	               success : function(){
	            	   
	            	   location.reload();
	            	   location.replace(location.href);
	            	   location.href = location.href;

	               },
	               error : function(){
	                  alert("Ajax 통신 실패했는데요")
	               }
	            });
	            
	            
	         }
			
			function nextType(type){
				var type = type
	            $.ajax({
	               url : "nextExercise",
	               type : "get",
	               data : {
	                  "type" : type,
	                  "id_num" : $("#idNumber").val()
	                  
	               },
	               success : function(){
	            	   
	            	   location.reload();
	            	   location.replace(location.href);
	            	   location.href = location.href;

	               },
	               error : function(){
	                  alert("Ajax 통신 실패했는데요")
	               }
	            });
	            
	            
	         }
			
			function selectMonday(type){
				var type = type
	            $.ajax({
	               url : "selelctDay",
	               type : "get",
	               data : {
	                  "type" : type,
	                  
	               },
	               dataType : "json",
	               success : function(res){	
	            	   
	            	   var input = "";
	            	   input += "<pre><img src='images/푸쉬업4.png' style='width:150px; height:100px;'>" + res.mfirst_exercise +"<pre><button class='analysis_add' id=" + res.mfirst_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/푸쉬업4.png' style='width:150px; height:100px;'>" + res.msecond_exercise +"<pre><button class='analysis_add' id=" + res.msecond_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/푸쉬업4.png' style='width:150px; height:100px;'>" + res.mthird_exercise +"<pre><button class='analysis_add' id=" + res.mthird_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/푸쉬업4.png' style='width:150px; height:100px;'>" + res.mfourth_exercise +"<pre><button class='analysis_add' id=" + res.mfourth_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   
	            	   $("#recommendRoutin").html(input);
						
	               },
	               error : function(){
	                  alert("Ajax 통신 실패했는데요")
	               }
	            });
	            
	         }
			
			function selectWednesday(type){
				var type = type
	            $.ajax({
	               url : "selelctDay",
	               type : "get",
	               data : {
	                  "type" : type,
	                  
	               },
	               dataType : "json",
	               success : function(res){
	            	   
	            	   var input = "";
	            	   input += "<pre><img src='images/푸쉬업4.png' style='width:150px; height:100px;'>" + res.wfirst_exercise +"<pre><button class='analysis_add' id=" + res.wfirst_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/푸쉬업4.png' style='width:150px; height:100px;'>" + res.wsecond_exercise +"<pre><button class='analysis_add' id=" + res.wsecond_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/푸쉬업4.png' style='width:150px; height:100px;'>" + res.wthird_exercise +"<pre><button class='analysis_add' id=" + res.wthird_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/푸쉬업4.png' style='width:150px; height:100px;'>" + res.wfourth_exercise +"<pre><button class='analysis_add' id=" + res.wfourth_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   
	            	   $("#recommendRoutin").html(input);

	               },
	               error : function(){
	                  alert("Ajax 통신 실패했는데요")
	               }
	            });
	            
	            
	         }
			
			function selectFriday(type){
				var type = type
	            $.ajax({
	               url : "selelctDay",
	               type : "get",
	               data : {
	                  "type" : type,
	                  
	               },
	               dataType : "json",
	               success : function(res){
	            	   
	            	   
	            	   var input = "";
	            	   input += "<pre><img src='images/푸쉬업4.png' style='width:150px; height:100px;'>" + res.ffirst_exercise +"<pre><button class='analysis_add' id=" + res.ffirst_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/푸쉬업4.png' style='width:150px; height:100px;'>" + res.fsecond_exercise +"<pre><button class='analysis_add' id=" + res.fsecond_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/푸쉬업4.png' style='width:150px; height:100px;'>" + res.fthird_exercise +"<pre><button class='analysis_add' id=" + res.fthird_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/푸쉬업4.png' style='width:150px; height:100px;'>" + res.ffourth_exercise +"<pre><button class='analysis_add' id=" + res.ffourth_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   
	            	   
	            	   $("#recommendRoutin").html(input);

	               },
	               error : function(){
	                  alert("Ajax 통신 실패했는데요")
	               }
	            });
	            
	            
	         }
			
			</script>
			
			<!-- 모달관련 -->
			<script>
			
			
		    	$(function(){ 
		    		
		    		  $("button#analysis").click(function(){
		    		    $("div#analysis").fadeIn();
		    		  });
		    		  
		    		  $(document).on("click","button#kneepushup", function() {
		    			  $("div#kneepushup").fadeIn();
		    			  console.log("이상하다..")
		    		  });
		    		 
		    		  $(document).on("click","button#superman", function() {
		    			  $("div#superman").fadeIn();
		    			  
		    		  });
		    		 
		    		  $(document).on("click","button#plank25s", function() {
		    			  $("div#plank25s").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#boxsquat", function() {
		    			  $("div#boxsquat").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#jogging1km", function() {
		    			  $("div#jogging1km").fadeIn();
		    			  
		    		  });
		    		 
		    		  $(document).on("click","button#sprint25m", function() {
		    			  $("div#sprint25m").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#jumprope", function() {
		    			  $("div#jumprope").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#plank60s", function() {
		    			  $("div#plank25s").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#pushup", function() {
		    			  $("div#pushup").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#deadhang", function() {
		    			  $("div#deadhang").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#squat", function() {
		    			  $("div#squat").fadeIn();
		    			  
		    		  });
		    		  
		    		  
		    		  
		    		  
		    		  
		    		  $(".modal_content").click(function(){
		                    $(".modal").fadeOut();
		              });
		    		  
		    		  
		    		  
		    		 
		    		  
		    		  
		    		  
		    		});

		    </script>
		    
		    <script src="https://d3js.org/d3.v5.min.js" charset="utf-8"></script>
		    <script src="assets/js/c3.js"></script>
		    
		    <script type="text/javascript">
		      var chart = c3.generate({
		        bindto: '#chart',
		        data: {
		          x : 'date',
		          xFormat : '%Y-%m-%d',
		          columns: [
		        
		            ['date' <% 
		             			for (BodyComposition bodyComposition : bodyCompositionList) {
		             				out.print(",'" + bodyComposition.getInsertdate().substring(0, 10)+"'");
		             			}
		            		%> 
		            ],
		            ['체성분' <% 
             			for (BodyComposition bodyComposition : bodyCompositionList) {
             				out.print(",'" + bodyComposition.getWeight()+"'");
             			}
             				%>
		            ],
		            ['골격근량'<% 
             			for (BodyComposition bodyComposition : bodyCompositionList) {
             				out.print(",'" + bodyComposition.getMuscle()+"'");
             			}
             				%>
		            ],
		            ['체지방량'<% 
             			for (BodyComposition bodyComposition : bodyCompositionList) {
             				out.print(",'" + bodyComposition.getFat()+"'");
             			}
             				%>
		        	]
		          ]
		        },
		        axis : {
		          x : {
		            type : 'timeseries',
		            tick : {
		              format : "%Y/%m/%d" // https://github.com/mbostock/d3/wiki/Time-Formatting#wiki-format
		            }
		          }
		        }
		      });
		      
		      </script>
		      
		    
			

	</body>
</html>