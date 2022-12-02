<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.smhrd.domain.Member"%>
<%@ page import="com.smhrd.boarddomain.Member_Board"%>
<%@ page import="com.smhrd.boarddomain.BoardDAO"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>게시판 목록</title>	
	<style type="text/css">
        #wrap {
            width: 800px;
            margin: 0 auto 0 auto;
        }
        #topForm{
            text-align :right;
        }
        #board, #pageForm, #searchForm{
            text-align :center;
        }
        
        #bList{
            text-align :center;
        }
    </style>
    
    <script type="text/javascript">
        function writeForm(){
            location.href="BoardWriteForm.bo";
        }
        
        function gologin() {
            //location.href="login.jsp";
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
						<ul>
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
					<h1><font color="white"><%= loginMember.getId()%>님 환영합니다~~</font></h1>
					<ul class="actions special">
						<li><a href="main.jsp" class="button ">main</a></li>
						<li><a href="routin.jsp" class="button ">routin</a></li>
						<li><a href="BoardList.jsp" class="button ">community</a></li>
						<li><a href="inbodyMap.jsp" class="button ">Map</a></li>
					</ul>
					<%} else {%>
					<h1 style="color:white;">로그인이 필요합니다.</h1>
					<ul class="actions special">
						<li><a href="main.jsp" class="button ">main</a></li>
						<li><a href="login.jsp" class="button " onclick="gologin()">routin</a></li>
						<li><a href="BoardList.jsp" class="button ">community</a></li>
						<li><a href="inbodyMap.jsp" class="button ">Map</a></li>
					<ul>
						<%} %>
				</section>
	
			<!-- Main -->
				<section id="main" class="container">
					<header>
						<h2 style="color:white;">COMMUNITY</h2>
						<p style="color:white;">헬창, 헬린이 소통의 공간</p>
					</header>
					<div class="row">
						<div class="col-12">
							<div id="wrap">
							<!-- 위치 선택 부분 -->
							
								<div>
									<form action="">
										시/도<select id="add1">
											<option>선택해주세요</option>
											<option value="서울">서울특별시</option>
											<option value="부산">부산광역시</option>
											<option value="대구">대구광역시</option>
											<option value="인천">인천광역시</option>
											<option value="광주">광주광역시</option>
											<option value="대전">대전광역시</option>
											<option value="울산">울산광역시</option>
											<option value="세종">세종특별자치시</option>
											<option value="경기">경기도</option>
											<option value="강원">강원도</option>
											<option value="충북">충청북도</option>
											<option value="충남">충청남도</option>
											<option value="전북">전라북도</option>
											<option value="전남">전라남도</option>
											<option value="경북">경상북도</option>
											<option value="경남">경상남도</option>
											<option value="제주">제주특별자치도</option>
										</select>
										시/군/구<select id="add2">
											<option>선택해주세요</option>
										</select>
									</form>
								</div>
								<br><br>
								<div id = locationList></div>
								<br><br>		
								
								<!-- 지도 맵 표시 부분 -->
								
								<!-- 지도를 표시할 div 입니다 -->
								<div id="map" style="width:850px; height:450px;"></div>
								
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f52ffd0c746ee592129221513282961&libraries=services"></script>
								
								<script>
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					            		mapOption = {
					                		center: new kakao.maps.LatLng(34.946029, 127.515990), // 지도의 중심좌표
					                		level: 5 // 지도의 확대 레벨
					            		};
					        
					     			// 지도를 생성합니다
					        		var map = new kakao.maps.Map(mapContainer, mapOption);
					     			
					        		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
					            	var mapTypeControl = new kakao.maps.MapTypeControl();

					            	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
					            	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
					            	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

					            	// 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다
					            	var zoomControl = new kakao.maps.ZoomControl();
					            	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
					            
					            	// 주소-좌표 변환 객체 생성합니다
					            	var geocoder = new kakao.maps.services.Geocoder();
					            	
					            	// 주소로 좌표를 검색합니다
					            	geocoder.addressSearch('전라남도 순천시 중앙로 232', function(result, status) {
					            		
					            		// 정상적으로 검색이 완료됐으면
					            		if (status === kakao.maps.services.Status.OK) {
					            			
					            			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					            			
					            			// 결과값으로 받은 위치를 마커로 표시합니다
					            			var marker = new kakao.maps.Marker({
					            				map: map, // 마커를 표시할 지도
					            				position: coords
					            			});
					            			
					            			// 인포윈도우로 장소에 대한 설명을 표시합니다
					            			var infowindow = new kakao.maps.InfoWindow({
					            				content: '<div style="width:150px;text-align:center;padding:6px 0;">장소입력</div>'
					            			});
					            			infowindow.open(map, marker);
					            			
					            			// 지도의 중심을 결과값으로 받은 위치를 이동시킵니다
					            			map.setCenter(coords);
					            		}
					            	});
	
					            		// 마커에 마우스오버 이벤트를 등록합니다
					              		kakao.maps.event.addListener(marker, 'mouseover', function() {
					              		// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
					              		infowindow.open(map, marker);
					              	});

					              		// 마커에 마우스아웃 이벤트를 등록합니다
					              	kakao.maps.event.addListener(marker, 'mouseout', function() {
					              	// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
					              	infowindow.close();
					              	});
					            			
					            	
									
								</script>
									
								
						</div>
					</div>
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
			<script type="text/javascript">
				$(document).ready(function(){
					var mCity="";
		    		var city="";
					$("#add1").change(function(){
						
						mCity = $("#add1 option:selected").val();
						console.log(mCity);
						var cityList = getCity(mCity);
						
						$("select#add2 option").remove();
						
						$("select#add2").append("<option>선택해주세요</option>");
						cityList.forEach(function(city) {
							$("select#add2").append("<option value='"+city+"'>"+ city +"</option>");	
						});
						
					});
					$("#add2").change(function(){
						
						city = $("#add2 option:selected").val();
						console.log(city);
						
						let getAddressData = [];
						
						getAddressData.push({
							'loc_add1' : mCity,
							'loc_add2' : city
						}); // push 끝
						
						console.log(getAddressData);
						var addressList = getAddress(getAddressData);
						
						
						
						//======== 여기서부터 장소 리스트 테이블 작성 부분 ======= 
						
						var addressTable = "<table border='1'>"
						addressTable += "<tr>";
						addressTable += "<th>측정장소</th>";
						addressTable += "<th>주소</th>";
						addressTable += "<th>전화번호</th>";
						addressTable += "<th>위치</th>";
						addressTable += "</tr>";
						addressList.forEach(function(address) {
								addressTable += "<tr>";
								
								// 장소 이름
								addressTable +=  "<td>" + address.loc_name + "</td>";
								
								var end = address.loc_address.indexOf('(');
								if (end > 0) {
									var locAddress = address.loc_address.substr(0, end);
								} else {
									locAddress = address.loc_address;
								}
							
								// 장소 주소
								addressTable +=  "<td>" + locAddress + "</td>";
								// 장소 전화번호
								addressTable +=  "<td>" + address.loc_phone + "</td>";
								// 장소 위치 부분
								// 위치를 누르면 아래쪽 지도에 위치가 표시될 수 있도록 작성
								addressTable +=  "<td>" + "위치"  + "</td>";
								addressTable += "</tr>";
						});
						addressTable += "</table>";
						$("div#locationList").html(addressTable);
						
						//======== 여기서부터 장소 리스트 테이블 작성 끝 ======= 
						
						
					});
					
				});
							
				function getCity(mCity){
					console.log("getEvents 실행");
					var result;
			    	  		// ajax 처리로 데이터를 로딩 시킨다.
			    	  		$.ajax({
			    		  
			    		 		url: "LocationCityListCon",
			    		 		type: "get",
			    		 		async: false,
			    		 		dataType: "json",
			    		 		data : {
			    					"json" : mCity
			    				},
			    		 		success: function(res) {
			    			 		console.log(res);
			    			 		result = res;
						 		},
						 		error : function(){
							 		alert("Ajax 통신 실패");
						 		}
			    	  		});
			    	  		
			    	console.log(result);
			    	return result;
			    	
			     } // getCity 끝
			     
			     
			     function getAddress(getAddressData){
						console.log("getAddress 실행");
					
						var result;
				    	  		// ajax 처리로 데이터를 로딩 시킨다.
				    	  		$.ajax({
				    		  
				    		 		url: "LocationAddressListCon",
				    		 		type: "get",
				    		 		async: false,
				    		 		dataType: "json",
				    		 		data : {
				    		 			"json" : JSON.stringify(getAddressData)
				    				},
				    		 		success: function(res) {
				    			 		console.log(res);
				    			 		result = res;
							 		},
							 		error : function(){
								 		alert("Ajax 통신 실패");
							 		}
				    	  		});
				    	  		
				    	console.log(result);
				    	return result;
				 } // getAddress 끝

    		</script>

</body>
</html>