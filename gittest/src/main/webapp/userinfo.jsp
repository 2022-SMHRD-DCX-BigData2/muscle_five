<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>    
<%@page import="com.smhrd.domain.MemberDAO"%>
<%@ page import="com.smhrd.domain.Member"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Member loginMember = (Member)request.getAttribute("loginMember");

	MemberDAO dao = new MemberDAO();
	List<Member> memberList = dao.selectAll();
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>현재 회원정보 출력화면</title>
	<link rel="stylesheet" href="assets/css/main.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

	
		<style type="text/css">
	
        table{
            margin-left:auto; 
            
            margin-right:auto;
        }
        
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
        
        #my_modal {
                display: none;
                width: 300px;
                padding: 20px 60px;
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 3px;
            }

        #my_modal .modal_close_btn {
                position: absolute;
                top: 10px;
                right: 10px;
                
                
        }
		
    </style>
    
    <script type="text/javascript">
    
    	// $('#myModal').modal(options)
    	$(function grademodify(){}
         	
         	$(".button small").click(function(){
         		
         		var id = $(this).closest(".datarow").find(".id").text();
         		$("#formid").val(id);
         		
         		var grade = $(this).closest(".datarow").find(".grade").text();
         		$(".formgrade").val([grade]);
         		
         	})
         	
         	// 등급수정 전달 버튼 이벤트
         	$(".button special small").click(function(){
         		
         		$("#updategradeBtn").submit();	
         	
         	})
     	});
    	
    	
    	function work() {
	
    		alert("삭제되었습니다.");
    		/* var result = confirm("~ 하시겠습니까?");
    		
    		if(result == true) {
    			alert("확인을 눌렀습니다.");
    		} 
    		else {
    			alert("취소를 눌렀습니다.");
    		} */
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
							<li><a href="#" class="button">회원관리</a></li>
							<li><a href="logoutCon" class="button">Log out</a></li>
							<li><a href="modify.jsp" class="button">개인정보수정</a></li>
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
						<li><a href="BoardList.jsp" class="button ">community</a></li>
						<li><a href="generic.jsp" class="button ">Map</a></li>
					</ul>
				</section>
				
				
				<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">
						<caption><br><h1 align="center">회원관리페이지</h1><br></caption>
						<table align="center">
							<tr></tr>
							<tr align="center">
								<td><font size="5" color="black">[아이디]</font></td>
								<td><font size="5" color="black">[성별]</font></td>
								<td><font size="5" color="black">[이메일]</font></td>		
								<td><font size="5" color="black">[회원등급]</font></td>		
								<td><font size="5" color="black">[등급변경]</font></td>		
								<td><font size="5" color="black">[회원관리]</font></td>					
							</tr>
							<!-- 2.모든 회원의 이메일(email),전화번호(tel),주소(address)를 출력하시오. -->
							<%for(Member m : memberList ){ %>
							<tr class="datarow" align="center">
								<td class="id"><%=m.getId() %></td>
								<td><%=m.getGender() %></td>
								<td><%=m.getMail1() + '@' +  m.getMail2()%></td>
								<td><%=m.getGrade() %></td>														
								<td class="grade"><button type="button" class="button small" 
									data-toggle="modal" data-target="#myModal">변경</td>
								<td><a href="deleteCon?id=<%= m.getId() %>"><button class="button alt small" onclick="work()" >회원 삭제</button></a></td>
							</tr>
							<%} %>
						</table>
					</nav>		
					<p align="center"><a href="main.jsp" class="button next scrolly">되돌아가기</a></p>
			</div>
				
			<!-- Footer -->
				<footer id="footer">
					<ul class="icons">
						<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands fa-facebook-	f"><span class="label">Facebook</span></a></li>
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
			
			
			
		<!-- 등급변경 Modal 참 -->
			<div id="myModal" class="modal fade" role="dialog">
			  <div class="modal-dialog">
			
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title">등급 변경</h4>
			      </div>
			      <div class="modal-body">
			        <p>
						<form action="usergradeCon" method="post" id="updategradeForm">
							<div class="form-group">
								<label for="id">아이디</label>
									<input name="id" id="formid" readonly="readonly">
							</div>
							<div>
								<div><label>등급</label></div>
								<label class="radio-inline">
									<input type="radio" name="optradio" value="1" class="formgrade">준회원</label>
								<label class="radio-inline">
									<input type="radio" name="optradio" value="2" class="formgrade">정회원</label>
								<label class="radio-inline">
									<input type="radio" name="optradio" value="3" class="formgrade">튻별회원</label>
								<label class="radio-inline">
									<input type="radio" name="optradio" value="4" class="formgrade">관리자</label>
							</div>
							
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" id="updategradeBtn">변경</button>
					        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					      </div>
						</form>
					</p>
			      </div>
			    </div>
			
			  </div>
			</div>	
			
			
			
			
			<!-- Scripts -->
				<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
      			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
			
				<!-- <script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
				<script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.js.map"></script>
				<script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
				<script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js.map"></script>
				<script src="bootstrap-5.2.3-dist/js/bootstrap.esm.js"></script>
				<script src="bootstrap-5.2.3-dist/js/bootstrap.esm.js.map"></script>
				<script src="bootstrap-5.2.3-dist/js/bootstrap.esm.min.js"></script>
				<script src="bootstrap-5.2.3-dist/js/bootstrap.esm.min.js.map"></script>
				<script src="bootstrap-5.2.3-dist/js/bootstrap.js"></script>
				<script src="bootstrap-5.2.3-dist/js/bootstrap.js.map"></script>
				<script src="bootstrap-5.2.3-dist/js/bootstrap.min.js"></script>
				<script src="bootstrap-5.2.3-dist/js/bootstrap.min.js.map"></script>-->
				
				<script src="assets/js/jquery.min.js"></script>
				<script src="assets/js/jquery.dropotron.min.js"></script>
				<script src="assets/js/jquery.scrollex.min.js"></script>
				<script src="assets/js/browser.min.js"></script>
				<script src="assets/js/breakpoints.min.js"></script>
				<script src="assets/js/util.js"></script>
				<script src="assets/js/main.js"></script>
</body>
</html>