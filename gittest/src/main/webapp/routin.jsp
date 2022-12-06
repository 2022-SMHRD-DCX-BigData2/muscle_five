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
	
	MemberDAO dao3 = new MemberDAO();
	List<Member> likeExercise = dao3.selectLikeExercise(loginMember.getId_num());
	
	
	
	
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
			padding : 0 2.5em 0 2.5em;
			}
			.routin_btn button:hover {
			color : white;
			background-color: skyblue;
			}
			/* 모달관련스타일 */
			.modal {
	        position: absolute;
			top: 160%;
			left: 25%;
	        width: 60%;
	        height: 100%;
	
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
				color : skyblue ;
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

						
						
						<div class="row" id="divmuscle" >
						
						<div class="col-6 ">
						
							<section class="box special"  style="padding : 2.5em 2em; font-family : S-CoreDream-3Light;">
						<div id="chart"></div>
								<h5 id="font" style="margin:0 0 0.8em;">체성분 입력</h5>
								<div id="chart"></div>
								<input type="hidden" id="gender" value="<%=loginMember.getId()%>">
								<pre>체중(kg)<input style="text-align:center;" type="text" name="weight" id="weight" value="<%=lastComposition.getWeight()%>"></pre>
								<pre>골격근량(kg)<input style="text-align:center;" type="text" name="muscle" id="muscle" value="<%=lastComposition.getMuscle()%>"></pre>
								<pre>체지방량(kg)<input style="text-align:center;" type="text" name="fat" id="fat" value="<%=lastComposition.getFat()%>"></pre>
								<input type="hidden" nane="weeks" value="3" id="weeks">
								<%-- <pre>원하는 주 운동 횟수
								<select name="weeks" id="weeks" value="<%=lastComposition.getWeeks()%>">
						        	<option value="3"> 3 </option>
						        	<option value="4"> 4 </option>
						        </select>
								</pre> --%>
								<pre>팔굽혀펴기(max)<input type="text" name="pushup" id="pushup" style="text-align:center;" value="<%=lastComposition.getPushup()%>">턱걸이(max)<input type="text" name="pullup" id="pullup" style="text-align:center;" value="<%=lastComposition.getPullup()%>">
								</pre>
								<!-- 모달관련 -->
								<br>
								<input type="submit" value="업데이트" onclick="insertCom(<%=userNum%>)">
								<%if(lastComposition.getWeight() * 0.45 < lastComposition.getMuscle()){ %>
									<button class="analysis" id="cAnalysis">분석</button>
								<%}else if(lastComposition.getWeight() * 0.46 > lastComposition.getMuscle()){ %>
									<button class="analysis" id="dAnalysis">분석</button>
								<%}else{ %>
									<button class="analysis" id="iAnalysis">분석</button>
								<%} %>
								<br><br>
								
								
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
									<%if(lastComposition.getType() < 4){ %>
										<h3 id="font" style="margin : 0 0 0.5em;">NOVIS <%=lastComposition.getType()%> LEVEL</h3>
									<%} else if(lastComposition.getType() < 7){ %>
										<h3 id="font" style="margin : 0 0 0.5em;">NORMAL <%=lastComposition.getType()%> LEVEL</h3>
									<%} else{ %>
										<h3 id="font" style="margin : 0 0 0.5em;">ADVANCE <%=lastComposition.getType()%> LEVEL</h3>
									<%} %>
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
										<pre><img src="images/<%=lastComposition.getMfirst_exercise()%>.png" style="width:150px; height:100px;"><%=lastComposition.getMfirst_exercise()%><pre><button class="analysis_add" id="<%=lastComposition.getMfirst_exercise().replace(" ", "")%>">운동 더보기</button></pre></pre>
										<pre><img src="images/<%=lastComposition.getMsecond_exercise()%>.png" style="width:150px; height:100px;"><%=lastComposition.getMsecond_exercise()%><pre><button class="analysis_add" id="<%=lastComposition.getMsecond_exercise().replace(" ", "")%>">운동 더보기</button></pre></pre>
										<pre><img src="images/<%=lastComposition.getMthird_exercise()%>.png" style="width:150px; height:100px;"><%=lastComposition.getMthird_exercise()%><pre><button class="analysis_add" id="<%=lastComposition.getMthird_exercise().replace(" ", "")%>">운동 더보기</button></pre></pre>
										<pre><img src="images/<%=lastComposition.getMfourth_exercise()%>.png" style="width:150px; height:100px;"><%=lastComposition.getMfourth_exercise()%><pre><button class="analysis_add" id="<%=lastComposition.getMfourth_exercise().replace(" ", "")%>">운동 더보기</button></pre></pre>
										</div>
										
								</div>
								<div id="btn-good">
								<%
								int heart = 0;
								if(likeExercise == null){ %>
								<button id='like1' style="float:left;" onclick="likeCon(<%=lastComposition.getType()%>)">🤍</button>
								<%}else{
									for(Member i : likeExercise){
										if(i.getType() == lastComposition.getType()){
											heart ++;
										}
									}
									if(heart > 0){%>
										<button id='like1' style="float:left;" onclick="unlikeCon(<%=lastComposition.getType()%>)">❤</button>
								<%		
									}else{%>
										<button id='like1' style="float:left;" onclick="likeCon(<%=lastComposition.getType()%>)">🤍</button>
								<%
									}
								} 
								%>	
								
									
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
	<div class="modal" id="cAnalysis">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<img align="center" src="images/c형.png">
		</div>
	</div>
	<div class="modal" id="iAnalysis">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<img align="center" src="images/i형.png">
		</div>
	</div>
	<div class="modal" id="dAnalysis">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<img align="center" src="images/d형.png">
		</div>
	</div>
	<div class="modal" id="kneepushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			kneepushup<br><br>
			1. 어깨넓이 정도로 손으로 상체를 지지하고 허리를 곧게하여 무릎을 바닥에 고정합니다.
			<br>
			2. 가슴(대흉근)이 바닥에 닿을때까지 저항하며 내려가며 운동중에는 항상 허리는 곧게 유지합니다.
			<br>
			3. 가슴(대흉근)과 어깨(삼각근)근육으로 상체를 시작지점으로 밀어줍니다.
			<br>
			4. 근력이 증가하여 무릎을 대지 않고 할 수 있다면 일반적인 푸시업으로 하는 게 좋습니다.
			<br>
			5. 호흡은 상체가 내려갈 때 들어마시고 올릴 때 내쉽니다.
			<br>
			※ 주동근: 대흉근(Pectoralis major) / 협력근, 상완삼두근(Triceps), 삼각근(Deltoids)
		</div>
	</div>
	<div class="modal" id="superman">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			superman<br><br>
			1. 바닥에 엎드려 양팔을 앞으로 뻗는다.
			<br>
			2. 양팔과 양다리를 벌려 몸을 X자로 만든다.
			<br>
			3) 배를 제외한 상체 윗부분과 양쪽 다리를 지면에서 힘차고 빠르게 들어올린다.
			<br>
			4) 들어올린 상태에서 10~30초간 자세를 유지한 뒤 상체와 하체를 천천히 내린다. 3번 반복한다.
		</div>
	</div>
	<div class="modal" id="plank25s">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			plank<br><br>
			<br>
			1. 팔꿈치를 굽히고, 무게 중심을 팔 대신에 팔뚝에 싣는 것이 중요합니다. 
			그리고 몸은 어깨에서부터 발목에 이르기까지 일직선을 이루고 있어야 하며, 
			복부에 힘을 주고 있는 것이 좋습니다. 
			<br>
			2. 자세를 유지하며 30초 이상 버티고, 호흡이 멈추지 않도록 크게 내쉬 마십니다.
		</div>
	</div>
	<div class="modal" id="boxsquat">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			boxsquat<br>
			1. 벤치 혹은 박스 앞에 어깨너비로 선다.
			<br>
			2. 팔을 앞으로 뻗고 힙을 뒤로 빼주며 앉는다.
			<br>
			3. 힙을 벤치 혹은 박스 터치 후 다시 일어난다.
			<br>
			4. 앉으며 호흡 들여마시고, 일어서며 내쉰다.
			<br>
			5. 위의 동작를 하나로 반복 실시.
		</div>
	</div>
	<div class="modal" id="jogging1km">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			jogging1km<br><br>
			건강을 유지하는 수단으로서 자기의 몸에 알맞은 속도로 천천히 달리는 운동
		</div>
	</div>
	<div class="modal" id="sprint25m">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			sprint25m<br><br>
			1.본인이 낼 수 있는 출력의 70%로 달립니다.
		</div>
	</div>
	<div class="modal" id="jumprope">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			jumprope<br><br>
			1. 바른자세로 정면으로 바라보고 선다.
			<br>
			2. 양 팔꿈치는 구부려준다.
			<br>
			3. 점프를 하면서 팔을 돌려준다.
			<br>
			4. 운동하는 동안 편안하게 호흡을 한다.
		</div>
	</div>
	<div class="modal" id="pushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			pushup<br>
			1. 어깨넓이 정도로 손으로 상체를 지지하고 허리를 곧게하여 고정합니다.
			<br>
			2. 가슴(대흉근)이 바닥에 닿을때까지 저항하며 내려가며 운동중에는 항상 허리는 곧게 유지합니다.
			<br>
			3. 가슴(대흉근)과 어깨(삼각근)근육으로 상체를 시작지점으로 밀어줍니다.
			<br>
			4. 호흡은 상체가 내려갈 때 들어마시고 올릴 때 내쉽니다.
			<br>
			※ 주동근: 대흉근(Pectoralis major) / 협력근, 상완삼두근(Triceps), 삼각근(Deltoids)
		</div>
	</div>
	<div class="modal" id="dead hang">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			dead hang<br>
			s
		</div>
	</div>
	<div class="modal" id="squat">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			squat<br>
			1. 다리를 어깨너비로 벌리고 섭니다.
			<br>
			2. 가슴을 들고 허리를 곧게 펴줍니다.
			<br>
			3. 고관절을 접으면서 몸이 다리 사이로 들어가는 느낌으로 앉아 줍니다.
			<br>
			4. 무릎과 지면을 바깥으로 밀어 내는 느낌으로 밀어주며 일어납니다.
		</div>
	</div>
	<div class="modal" id="widepushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			widepushup<br>
			1. 어깨넓이보다 넓게 손을 위치시 시켜 상체를 지지하고 허리를 곧게하여 고정합니다.
			<br>
			2. 가슴(대흉근)이 바닥에 닿을때까지 저항하며 내려가며 운동중에는 항상 허리는 곧게 유지합니다.
			<br>
			3. 가슴(대흉근)과 어깨(삼각근)근육으로 상체를 시작지점으로 밀어줍니다.
			<br>
			4. 호흡은 상체가 내려갈 때 들어마시고 올릴 때 내쉽니다.
			<br>
			※ 주동근: 대흉근(Pectoralis major) / 협력근, 상완삼두근(Triceps), 삼각근(Deltoids)
		</div>
	</div>
	<div class="modal" id="jumppullup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			jump pullup<br>
			1. 철봉을 양손으로 잡아 줍니다. 이 때 손등이 나를 향하도록 잡습니다.
			<br>
			2. 무릎이 살짝 구부러지는 높이를 만들어 줍니다.
			<br>
			3. 점프를 하며 당겨줍니다.
			<br>
			4. 천천히 내려옵니다.
		</div>
	</div>
	<div class="modal" id="crunch">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			crunch<br>
			1. 편안하게 누워 무릎을 접어 줍니다.
			<br>
			2. 몸이 공이 된다고 생각하며 상복부만 말아줍니다.
			<br>
			3. 천천히 펴주며 반복합니다.
		</div>
	</div>
	<div class="modal" id="widepushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			widepushup<br>
			1. 어깨넓이보다 넓게 손을 위치시 시켜 상체를 지지하고 허리를 곧게하여 고정합니다.
			<br>
			2. 가슴(대흉근)이 바닥에 닿을때까지 저항하며 내려가며 운동중에는 항상 허리는 곧게 유지합니다.
			<br>
			3. 가슴(대흉근)과 어깨(삼각근)근육으로 상체를 시작지점으로 밀어줍니다.
			<br>
			4. 호흡은 상체가 내려갈 때 들어마시고 올릴 때 내쉽니다.
			<br>
			※ 주동근: 대흉근(Pectoralis major) / 협력근, 상완삼두근(Triceps), 삼각근(Deltoids)
		</div>
	</div>
	<div class="modal" id="stop squat">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			stop squat<br>
			1. 다리를 어깨너비로 벌리고 섭니다.
			<br>
			2. 가슴을 들고 허리를 곧게 펴줍니다.
			<br>
			3. 고관절을 접으면서 몸이 다리 사이로 들어가는 느낌으로 앉아 줍니다.
			<br>
			4. 지면을 미는 느낌과 복압을 준 상태 그대로 2초 멈춰줍니다.
			<br>
			5. 무릎과 지면을 바깥으로 밀어 내는 느낌으로 밀어주며 일어납니다.
		</div>
	</div>
	<div class="modal" id="crunch">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			crunch<br>
			1. 편안하게 누워 무릎을 접어 줍니다.
			<br>
			2. 몸이 공이 된다고 생각하며 상복부만 말아줍니다.
			<br>
			3. 천천히 펴주며 반복합니다.
		</div>
	</div>
	<div class="modal" id="diamondpushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			diamond pushup<br>
			1. 엄지와 검지를 만나게 하여 다이아몬드 모양을 만들어 줍니다.
			<br>
			2. 다리는 넓게 벌려 줍니다.
			<br>
			3. 가슴(대흉근)이 바닥에 닿을때까지 저항하며 내려가며 운동중에는 항상 허리는 곧게 유지합니다.
			<br>
			4. 가슴(대흉근)과 어깨(삼각근)근육으로 상체를 시작지점으로 밀어줍니다.
			<br>
			5. 호흡은 상체가 내려갈 때 들어마시고 올릴 때 내쉽니다.
		</div>
	</div>
	<div class="modal" id="chinup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			chin up<br>
			1. 철봉을 양손으로 잡아 줍니다. 이 때 손바닥이 나를 향하도록 잡습니다.
			<br>
			2. 어깨를 그대로 두고 당겨줍니다.
			<br>
			3. 턱이 봉에 닿을때까지 갔다면 천천히 내려옵니다.
			
		</div>
	</div>
	<div class="modal" id="legraise">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			leg raise<br>
			1. 철봉을 양손으로 잡아줍니다.
			<br>
			2. 몸이 흔들리지 않도록 단단히 고정합니다.
			<br>
			3. 복근에 힘을 주며 몸이 니은이 되도록 올려줍니다.
			<br>
			4. 천천히 내려줍니다. 이 때 몸이 흔들리지 않도록 주의합니다.
		</div>
	</div>
	<div class="modal" id="jumpsquat">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			jump squat<br>
			1. 다리를 어깨너비로 벌리고 섭니다.
			<br>
			2. 가슴을 들고 허리를 곧게 펴줍니다.
			<br>
			3. 고관절을 접으면서 몸이 다리 사이로 들어가는 느낌으로 앉아 줍니다.
			<br>
			4. 무릎과 지면을 바깥으로 밀어 내는 느낌으로 밀어주며 일어납니다.
			<br>
			5. 4번동작 시 폭발적으로 뛰어 줍니다.
		</div>
	</div>
	<div class="modal" id="halfburpee">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			half burpee<br>
			1. 편안하게 서줍니다.
			<br>
			2. 바닥에 양손을 펴주고 다리를 피며 엎드려 줍니다.
			<br>
			3. 다리를 접어줍니다.
			<br>
			4. 일어나며 뛰어 줍니다.
		</div>
	</div>
	<div class="modal" id="pikepushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			pike pushup<br>
			1. 팔을 어깨너비보다 넓게 벌려 줍니다.
			<br>
			2. 다리는 넓게 벌려 줍니다.
			<br>
			3. 정수리가 땅을 보도록 합니다.
			<br>
			4. 머리가 바닥에 닿을때까지 저항하며 내려가며 운동중에는 항상 허리는 곧게 유지합니다.
			<br>
			5. 어깨(삼각근)근육으로 상체를 시작지점으로 밀어줍니다.
			<br>
			6. 호흡은 상체가 내려갈 때 들어마시고 올릴 때 내쉽니다.
			
		</div>
	</div>
	<div class="modal" id="pullup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			pullup<br>
			1. 철봉을 양손으로 잡아 줍니다. 이 때 손등이 나를 향하도록 잡습니다.
			<br>
			2. 어깨를 그대로 두고 당겨줍니다.
			<br>
			3. 턱이 봉에 닿을때까지 갔다면 천천히 내려옵니다.
		</div>
	</div>
	<div class="modal" id="onelegPlank">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			oneleg Plank<br>
			1. 팔꿈치를 11자로 두고 몸은 곧게 핀 상태로 둡니다.
			<br>
			2. 그 상태에서 한 다리를 들어줍니다.
			<br>
			3. 복근에 힘을 주며 한 쪽으로 기울어 지지 않도록 버텨 줍니다. 
		</div>
	</div>
	<div class="modal" id="lunge">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			lunge<br>
			1. 편안한 자세로 서 줍니다.
			<br>
			2.정면을 바라보며 상체는 곧게 세워줍니다.
			<br>
			3. 한쪽 다리를 앞으로 내밀며 굽혀 줍니다. 굽힌 다리가 무릎이 너무 앞으로 나가지 않도록 주의합니다.
			<br>
			4. 뒤에 다리가 바닥에 닿기 직전까지 내려갑니다.
			<br>
			5. 둔근에 힘을 주며 일어나 줍니다.
		</div>
	</div>
	<div class="modal" id="boxhandpushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			box hand pushup<br>
			1. 양손은 어깨너비보다 넓게 벌려지면을 지지해 줍니다.
			<br>
			2. 다리를 박스에 올려줍니다. 이때 몸은 ㄱ 과 같은 모양이 되게 합니다.
			<br>
			3. 삼각근을 이용하며 정수리가 땅에 닿는 느낌으로 내려갑니다.
			<br>
			4. 내려갔을때 팔꿈치가 지면과 수직이 되도록 합니다.
			<br>
			5. 시작자세로 돌아옵니다.
		</div>
	</div>
	<div class="modal" id="widepullup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			wide pullup<br>
			1. 철봉을 어깨 너비보다 넓게 양손으로 잡아 줍니다. 이 때 손등이 나를 향하도록 잡습니다.
			<br>
			2. 어깨를 그대로 두고 견갑과 광배근을 이용하여 당겨줍니다.
			<br>
			3. 턱이 봉에 닿을때까지 갔다면 천천히 내려옵니다.
		</div>
	</div>
	<div class="modal" id="onearmonelegPlank">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			onearm oneleg Plank<br>
			1. 팔꿈치를 11자로 두고 몸은 곧게 핀 상태로 엎드립니다.
			<br>
			2. 그 상태에서 한 다리를 들어줍니다.
			<br>
			3. 복근에 힘을 주며 한 쪽으로 기울어 지지 않도록 버텨 줍니다. 
			<br>
			4. 다리를 든 곳의 반대쪽 손을 들어 줍니다.
			<br>
			5. 복근에 힘을 주며 한 쪽으로 기울어 지지 않도록 버텨 줍니다. 
		</div>
	</div>
	<div class="modal" id="jumplunge">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			jump lunge<br>
			1. 편안한 자세로 서 줍니다.
			<br>
			2.정면을 바라보며 상체는 곧게 세워줍니다.
			<br>
			3. 한쪽 다리를 앞으로 내밀며 굽혀 줍니다. 굽힌 다리가 무릎이 너무 앞으로 나가지 않도록 주의합니다.
			<br>
			4. 뒤에 다리가 바닥에 닿기 직전까지 내려갑니다.
			<br>
			5. 팔을 위로 저으며 둔근에 폭발적으로 힘을 주며 뛰어 줍니다.
		</div>
	</div>
	<div class="modal" id="wallwalk">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			wall walk<br>
			1. 벽에 발바닥이 닿도록 하여 엎드려 누워줍니다.
			<br>
			2. 팔을 펴주고 다리를 한다리씩 벽에 댑니다.
			<br>
			3. 삼각근에 힘을주어 버티며 손바닥이 바닥과 10cm거리가 될때까지 벽쪽으로 가줍니다.
			
		</div>
	</div>
	<div class="modal" id="chesttobar">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			chest to bar<br>
			1. 철봉을 어깨 너비보다 넓게 양손으로 잡아 줍니다. 이 때 손등이 나를 향하도록 잡습니다.
			<br>
			2. 어깨를 그대로 두고 견갑과 광배근을 이용하여 당겨줍니다.
			<br>
			3. 가슴이 봉에 닿을때까지 당겨줍니다.
			<br>
			4. 천천히 내려옵니다.
		</div>
	</div>
	<div class="modal" id="toestobar">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			toes to bar<br>
			1. 철봉을 양손으로 잡아줍니다.
			<br>
			2. 몸이 흔들리지 않도록 단단히 고정합니다.
			<br>
			3. 복근에 힘을 주며 발이 봉이 닿도록 올려줍니다.
			<br>
			4. 천천히 내려줍니다. 이 때 몸이 흔들리지 않도록 주의합니다.
		</div>
	</div>
	<div class="modal" id="boxpistolsquat">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			box pistol squat<br>
			1. 박스를 준비 해 줍니다.
			<br>
			2. 한다리를 들고 천천히 앉아 줍니다. 앉았을 때 몸이 총모양이 됩니다.
			<br>
			3. 박스에 닿았다면 둔근과 대퇴사두에 힘을 주며 일어나 줍니다.
		</div>
	</div>
	<div class="modal" id="burpee">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			burpee<br>
			1. 편안하게 서줍니다.
			<br>
			2. 바닥에 양손을 펴주고 다리를 피며 엎드려 줍니다.
			<br>
			3. 팔을 구부려 가슴이 바닥에 닿도록 합니다.
			<br>
			4. 팔을 펴줍니다.
			<br>
			5. 다리를 무릎쪽으로 당기며 쪼그려 앉습니다.
			<br>
			6. 일어나며 뛰어 줍니다.
		</div>
	</div>
	<div class="modal" id="wallhandstandpushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			wall hand stand pushup<br>
			1. 벽에 발뒤꿈치가 닿도록 물구나무를 서줍니다. 
			<br>
			2. 벽에 엉덩이는 닿고 등과 머리는 떨이지도록 해줍니다.
			<br>
			3. 손끝을 대각선 방향으로 보도록 하고 삼각근과 승모근에 힘을 주어 버티며 내려갑니다.
			<br>
			4. 전완이 지면과 수직이 되도록 주의하고 삼각근과 승모근에 긴장 상태를 유지하며 원래 자세로 돌아옵니다.
			
		</div>
	</div>
	<div class="modal" id="KneelingAbWheel">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			Kneeling Ab Wheel<br>
			1. 지면에 무릎을 대고 ab휠을 잡아 줍니다.
			<br>
			2. 코어에 긴장을 유지하며 천천히 내려갑니다.
			<br>
			3. 팔꿈치가 펴져 있는 상태 그대로 복근의 수축을 이용하여 원래 자세로 돌아갑니다.
		</div>
	</div>
	<div class="modal" id="freestandpushup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			free stand pushup<br>
			1. 지지 할 수 있는 구조물 없이 물구나무를 서줍니다.
			<br>
			2. 코어에 긴장을 유지하며 삼각근과 승모근을 이요하여 팔을 구부렸다 펴줍니다.
		</div>
	</div>
	<div class="modal" id="Ab Wheel">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			Ab Wheel<br>
			1. 지면에 발을 대고 ab휠을 잡아 줍니다.
			<br>
			2. 코어에 긴장을 유지하며 천천히 내려갑니다.
			<br>
			3. 코어의 긴장이 풀리지 않는 부분까지 내려가 줍니다.
			<br>
			4. 팔꿈치가 펴져 있는 상태 그대로 복근의 수축을 이용하여 원래 자세로 돌아갑니다.
		</div>
	</div>
	<div class="modal" id="muscleup">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			muscleup<br>
			1. 양손을 어깨너비만큼 하여 철봉을 잡아 줍니다.
			<br>
			2. 코어와 광배에 힘을 주고 몸을 앞뒤로 흔들어 반동을 만들어 줍니다.
			<br>
			3. 다리를 차주며 몸이 지면과 수평이 되는 느낌으로 배꼽이 최대한 봉과 가깝게 해줍니다.
			<br>
			4. 상체를 접으며 올라간 후 팔을 펴줍니다.
		</div>
	</div>
	<div class="modal" id="pistolsquat">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			pistol squat<br>
			1. 편안한 자세로 무릎너비 만큼 다리를 벌리고 서줍니다.
			<br>
			2. 한다리를 들고 천천히 앉아 줍니다. 앉았을 때 몸이 총모양이 됩니다.
			<br>
			3. 둔근과 대퇴사두 복근 전신의 힘을 이용하여 일어나 줍니다.
		</div>
	</div>
	<div class="modal" id="deadhang">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			deadhang<br>
			1. 턱걸이 전의 기본 자세입니다.
			<br>
			2. 축 매달리며 팔을 완전히 펴줍니다.
			<br>
			3. 견갑을 끌어 당겨 으쓱 해줍니다.
		</div>
	</div>
	<div class="modal" id="AbWheel">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			AbWheel<br><br>
			1. 바닥에 무릎을 꿇고 오버핸드그립으로 앱휠을 잡아준다.(매트 위에서 진행하는 것을 추천)
			<br>
			2. 팔을 쭉 펴주면서 휠을 앞으로 굴려주는데, 무릎은 고정시키도 팔과 함께 상체를 앞으로 이동시킨다.
			<br>
			3. 최대한 팔을 뻗은 다음 잠시 멈추었다가 천천히 들어올리면서 시작자세로 돌아온다.			
			<br>
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
			
			<!-- 캘린더 스크립트 -->

			<script src="assets/js/calendar.js"></script>
			<script type="text/javascript">
			function likeCon(type){
				var type = type
				$.ajax({
					url : "likeCon",
					type : "get",
					data : {
						"type" : type,
						"id_num" : $("#idNumber").val()
					},
					success : function(res){
						console.log(res)
		            	
		            	location.reload();
		            	location.replace(location.href);
		            	location.href = location.href;
		            			
		            		
		               },
		            error : function(){
		               alert("Ajax 통신 실패했는데요")
		            }
				});	
			}
			
			function unlikeCon(type){
				var type = type
				$.ajax({
					url : "unlikeCon",
					type : "get",
					data : {
						"type" : type,
						"id_num" : $("#idNumber").val()
					},
					success : function(res){
						console.log(res)
		            	location.reload();
		            	location.replace(location.href);
		            	location.href = location.href;
		            			
		            		
		               },
		            error : function(){
		               alert("Ajax 통신 실패했는데요")
		            }
				});	
			}
			
			
			function insertCom(userNum){
				var id_num = userNum
				var weight = document.getElementById("weight").value
				var muscle = document.getElementById("muscle").value
				var fat = document.getElementById("fat").value
				var weeks = document.getElementById("weeks").value
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

	            	   input += "<pre><img src='images/" + res.mfirst_exercise + ".png' style='width:150px; height:100px;'>" + res.mfirst_exercise +"<pre><button class='analysis_add' id=" + res.mfirst_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/" + res.msecond_exercise + ".png' style='width:150px; height:100px;'>" + res.msecond_exercise +"<pre><button class='analysis_add' id=" + res.msecond_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/" + res.mthird_exercise + ".png' style='width:150px; height:100px;'>" + res.mthird_exercise +"<pre><button class='analysis_add' id=" + res.mthird_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/" + res.mfourth_exercise + ".png' style='width:150px; height:100px;'>" + res.mfourth_exercise +"<pre><button class='analysis_add' id=" + res.mfourth_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   
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

	            	   input += "<pre><img src='images/" + res.wfirst_exercise + ".png' style='width:150px; height:100px;'>" + res.wfirst_exercise +"<pre><button class='analysis_add' id=" + res.wfirst_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/" + res.wsecond_exercise + ".png' style='width:150px; height:100px;'>" + res.wsecond_exercise +"<pre><button class='analysis_add' id=" + res.wsecond_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/" + res.wthird_exercise + ".png' style='width:150px; height:100px;'>" + res.wthird_exercise +"<pre><button class='analysis_add' id=" + res.wthird_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/" + res.wfourth_exercise + ".png' style='width:150px; height:100px;'>" + res.wfourth_exercise +"<pre><button class='analysis_add' id=" + res.wfourth_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   
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

	            	   input += "<pre><img src='images/" + res.ffirst_exercise + ".png' style='width:150px; height:100px;'>" + res.ffirst_exercise +"<pre><button class='analysis_add' id=" + res.ffirst_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/" + res.fsecond_exercise + ".png' style='width:150px; height:100px;'>" + res.fsecond_exercise +"<pre><button class='analysis_add' id=" + res.fsecond_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/" + res.fthird_exercise + ".png' style='width:150px; height:100px;'>" + res.fthird_exercise +"<pre><button class='analysis_add' id=" + res.fthird_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   input += "<pre><img src='images/" + res.ffourth_exercise + ".png' style='width:150px; height:100px;'>" + res.ffourth_exercise +"<pre><button class='analysis_add' id=" + res.ffourth_exercise.replace(' ', '') + ">운동 더보기</button></pre></pre>";
	            	   
	            	   
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
		    		
		    		  $("button#iAnalysis").click(function(){
		    		    $("div#iAnalysis").fadeIn();
		    		  });
		    		  
		    		  $("button#cAnalysis").click(function(){
			    		    $("div#cAnalysis").fadeIn();
			    		  });
		    		  
		    		  $("button#dAnalysis").click(function(){
			    		    $("div#dAnalysis").fadeIn();
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
		    		  
		    		  $(document).on("click","button#widepushup", function() {
		    			  $("div#widepushup").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#jumppullup", function() {
		    			  $("div#jumppullup").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#crunch", function() {
		    			  $("div#crunch").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#stopsquat", function() {
		    			  $("div#stopsquat").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#diamondpushup", function() {
		    			  $("div#diamondpushup").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#chinup", function() {
		    			  $("div#chinup").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#legraise", function() {
		    			  $("div#legraise").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#jumpsquat", function() {
		    			  $("div#jumpsquat").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#jogging2km", function() {
		    			  $("div#jogging1km").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#sprint50m", function() {
		    			  $("div#sprint25m").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(document).on("click","button#halfburpee", function() {
		    			  $("div#halfburpee").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#pikepushup", function() {
		    			  $("div# pikepushup").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#pullup", function() {
		    			  $("div#pullup").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#onelegPlank", function() {
		    			  $("div#onelegPlank").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#lunge", function() {
		    			  $("div#lunge").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#boxhandpushup", function() {
		    			  $("div#boxhandpushup").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#widepullup", function() {
		    			  $("div#widepullup").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#onearmonelegPlank", function() {
		    			  $("div#onearmonelegPlank").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#jumplunge", function() {
		    			  $("div#jumplunge").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#wallwalk", function() {
		    			  $("div#wallwalk").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#chesttobar", function() {
		    			  $("div#chesttobar").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#toestobar", function() {
		    			  $("div#toestobar").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#boxpistolsquat", function() {
		    			  $("div#boxpistolsquat").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#jogging3km", function() {
		    			  $("div#jogging1km").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#uphillsprint", function() {
		    			  $("div#uphillsprint").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#burpee", function() {
		    			  $("div#burpee").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#KneelingAbWheel", function() {
		    			  $("div#KneelingAbWheel").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#freestandpushup", function() {
		    			  $("div#freestandpushup").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#muscleup", function() {
		    			  $("div#muscleup").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#AbWheel", function() {
		    			  $("div#AbWheel").fadeIn();
		    			  
		    		  });
		    		  
		    		  
		    		  
		    		  $(document).on("click","button#pistolsquat", function() {
		    			  $("div#pistolsquat").fadeIn();
		    			  
		    		  });
		    		  $(document).on("click","button#wallhandstandpushup", function() {
		    			  $("div#wallhandstandpushup").fadeIn();
		    			  
		    		  });
		    		  
		    		  $(".modal_content").click(function(){
		                    $("div.modal").fadeOut();

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